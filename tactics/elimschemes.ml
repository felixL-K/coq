(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

(* Created by Hugo Herbelin from contents related to inductive schemes
   initially developed by Christine Paulin (induction schemes), Vincent
   Siles (decidable equality and boolean equality) and Matthieu Sozeau
   (combined scheme) in file command.ml, Sep 2009 *)

(* This file builds schemes related to case analysis and recursion schemes *)

open Sorts
open Constr
open Indrec
open Declarations
open Ind_tables

(* Induction/recursion schemes *)

let build_induction_scheme_in_type env dep sort ind =
  let sigma = Evd.from_env env in
  let sigma, pind = Evd.fresh_inductive_instance ~rigid:UState.univ_rigid env sigma ind in
  let pind = Util.on_snd EConstr.EInstance.make pind in
  let sigma, sort = Evd.fresh_sort_in_family ~rigid:UnivRigid sigma sort in
  let sigma, c = build_induction_scheme env sigma pind dep sort in
  EConstr.to_constr sigma c, Evd.ustate sigma

(**********************************************************************)
(* [modify_sort_scheme s rec] replaces the sort of the scheme
   [rec] by [s] *)

let change_sort_arity sort =
  let rec drec a = match kind a with
    | Cast (c,_,_) -> drec c
    | Prod (n,t,c) -> let s, c' = drec c in s, mkProd (n, t, c')
    | LetIn (n,b,t,c) -> let s, c' = drec c in s, mkLetIn (n,b,t,c')
    | Sort s -> s, mkSort sort
    | _ -> assert false
  in
    drec


(** [weaken_sort_scheme env sigma s n c t] derives by subtyping from [c:t]
   whose conclusion is quantified on [Type i] at position [n] of [t] a
   scheme quantified on sort [s]. [s] is declared less or equal to [i]. *)
let weaken_sort_scheme env evd sort npars term ty =
  let open Context.Rel.Declaration in
  let evdref = ref evd in
  let rec drec ctx np elim =
    match kind elim with
      | Prod (n,t,c) ->
          let ctx = LocalAssum (n, t) :: ctx in
          if Int.equal np 0 then
            let osort, t' = change_sort_arity (EConstr.ESorts.kind !evdref sort) t in
              evdref := (if false then Evd.set_eq_sort else Evd.set_leq_sort) env !evdref sort (EConstr.ESorts.make osort);
              mkProd (n, t', c),
              mkLambda (n, t', mkApp(term, Context.Rel.instance mkRel 0 ctx))
          else
            let c',term' = drec ctx (np-1) c in
            mkProd (n, t, c'), mkLambda (n, t, term')
      | LetIn (n,b,t,c) ->
        let ctx = LocalDef (n, b, t) :: ctx in
        let c',term' = drec ctx np c in
        mkLetIn (n,b,t,c'), mkLetIn (n,b,t,term')
      | _ -> CErrors.anomaly ~label:"weaken_sort_scheme" (Pp.str "wrong elimination type.")
  in
  let ty, term = drec [] npars ty in
    !evdref, ty, term

let optimize_non_type_induction_scheme kind dep sort env _handle ind =
  (* This non-local call to [lookup_scheme] is fine since we do not use it on a
     dependency generated on the fly. *)
  match lookup_scheme kind ind with
  | Some cte ->
    let sigma = Evd.from_env env in
    (* in case the inductive has a type elimination, generates only one
       induction scheme, the other ones share the same code with the
       appropriate type *)
    let sigma, cte = Evd.fresh_constant_instance env sigma cte in
    let c = mkConstU cte in
    let t = Typeops.type_of_constant_in env cte in
    let (mib,mip) = Inductive.lookup_mind_specif env ind in
    let npars =
      (* if a constructor of [ind] contains a recursive call, the scheme
         is generalized only wrt recursively uniform parameters *)
      if (Inductiveops.mis_is_recursive_subset [ind] mip.mind_recargs)
      then
        mib.mind_nparams_rec
      else
        mib.mind_nparams in
    let sigma, sort = Evd.fresh_sort_in_family sigma sort in
    let sigma, t', c' = weaken_sort_scheme env sigma sort npars c t in
    let sigma = Evd.minimize_universes sigma in
    (Evarutil.nf_evars_universes sigma c', Evd.ustate sigma)
  | None ->
    build_induction_scheme_in_type env dep sort ind

(* (Induction, Some inType) 
enleve dep dans suff *)
let rect_dep =
  declare_individual_scheme_object (["Induction"], Some InType)
    (fun id -> match id with None -> "rect_dep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "rect_dep")
    (fun env _ x -> build_induction_scheme_in_type env true InType x)

(* (Induction, Some inSet) 
enleve dep dans suff *)
let rec_dep =
  declare_individual_scheme_object (["Induction"], Some InSet)
    (fun id -> match id with None -> "rec_dep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "rec_dep")
    (optimize_non_type_induction_scheme rect_dep true InSet)

(* (Induction, Some inProp) *)
let ind_dep =
  declare_individual_scheme_object (["Induction"], Some InProp)
    (fun id -> match id with None -> "ind_dep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "ind_dep")
    (optimize_non_type_induction_scheme rec_dep true InProp)

(* (Induction, Some inSProp) *)
let sind_dep =
  declare_individual_scheme_object (["Induction"], Some InSProp)
    (fun id -> match id with None -> "sind_dep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "sind_dep")
    (fun env _ x -> build_induction_scheme_in_type env true InSProp x)

(* (Minimality, Some inType) *)
let rect_nodep =
  declare_individual_scheme_object (["Minimality"], Some InType)
    (fun id -> match id with None -> "rect_nodep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "rect_nodep")
    (fun env _ x -> build_induction_scheme_in_type env false InType x)

(* (Minimality, Some inSet) *)
let rec_nodep =
  declare_individual_scheme_object (["Minimality"], Some InSet)
    (fun id -> match id with None -> "rec_nodep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "rec_nodep")
    (optimize_non_type_induction_scheme rect_nodep false InSet)

(* (Minimality, Some inProp) 
enleve nodep dans suff *)
let ind_nodep =
  declare_individual_scheme_object (["Minimality"], Some InProp)
    (fun id -> match id with None -> "ind_nodep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "ind_nodep")
    (optimize_non_type_induction_scheme rec_nodep false InProp)

(* (Minimality, Some inSProp) 
enleve nodep dans suff *)
let sind_nodep =
  declare_individual_scheme_object (["Minimality"], Some InSProp)
    (fun id -> match id with None -> "sind_nodep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "sind_nodep")
    (fun env _ x -> build_induction_scheme_in_type env false InSProp x)
    
let elim_scheme ~dep ~to_kind =
  match dep, to_kind with
  | false, InSProp -> sind_nodep
  | false, InProp -> ind_nodep
  | false, InSet -> rec_nodep
  | false, (InType | InQSort) -> rect_nodep
  | true, InSProp -> sind_dep
  | true, InProp -> ind_dep
  | true, InSet -> rec_dep
  | true, (InType | InQSort) -> rect_dep

(* Case analysis *)

let build_case_analysis_scheme_in_type env dep sort ind =
  let sigma = Evd.from_env env in
  let (sigma, indu) = Evd.fresh_inductive_instance env sigma ind in
  let indu = Util.on_snd EConstr.EInstance.make indu in
  let sigma, sort = Evd.fresh_sort_in_family ~rigid:UnivRigid sigma sort in
  let (sigma, c) = build_case_analysis_scheme env sigma indu dep sort in
  let (c, _) = Indrec.eval_case_analysis c in
  EConstr.Unsafe.to_constr c, Evd.ustate sigma

(* Elimination, inType *)
let case_dep =
  declare_individual_scheme_object (["Elimination"], Some InType)
    (fun id -> match id with None -> "case_dep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "case_dep")
    (fun env _ x -> build_case_analysis_scheme_in_type env true InType x)

(* Case, inType*)
let case_nodep =
  declare_individual_scheme_object (["Case"], Some InType)
    (fun id -> match id with None -> "case_nodep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "case_nodep")
    (fun env _ x -> build_case_analysis_scheme_in_type env false InType x)

(* Elimination, inProp*)
let casep_dep =
  declare_individual_scheme_object (["Elimination"], Some InProp)
    (fun id -> match id with None -> "casep_dep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "casep_dep")
    (fun env _ x -> build_case_analysis_scheme_in_type env true InProp x)

(* Case, InProp *)
let casep_nodep =
  declare_individual_scheme_object (["Case"], Some InProp)
    (fun id -> match id with None -> "casep_nodep" | Some i -> (Names.Id.to_string i) ^ "_" ^ "casep_nodep")
    (fun env _ x -> build_case_analysis_scheme_in_type env false InProp x)
    
