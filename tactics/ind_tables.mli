(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

open Names
open Constr

(** This module provides support for registering inductive scheme builders,
   declaring schemes and generating schemes on demand *)

(** A scheme is either a "mutual scheme_kind" or an "individual scheme_kind" *)

type mutual
type individual
type 'a scheme_kind

type handle

type scheme_dependency =
| SchemeMutualDep of Names.MutInd.t * mutual scheme_kind * bool
| SchemeIndividualDep of inductive * individual scheme_kind * bool

type mutual_scheme_object_function =
  Environ.env -> handle -> inductive list -> bool -> constr array Evd.in_ustate option (* None = silent error *)
type individual_scheme_object_function =
  Environ.env -> handle -> inductive -> bool -> constr Evd.in_ustate option (* None = silent error *)

(** Main functions to register a scheme builder. Note these functions
   are not safe to be used by plugins as their effects won't be undone
   on backtracking.

    In [declare_X_scheme_object key ?suff ?deps f], [key] is the name
    of the scheme kind. It must be unique across the Coq process's
    lifetime. It is used to generate [scheme_kind] in a marshal-stable
    way and as the scheme name in Register Scheme.

    [suff] defaults to [key], generated schemes which aren't given an
    explicit name will be named "ind_suff" where "ind" is the
    inductive's name.
*)

val declare_mutual_scheme_object : string list * Sorts.family option ->
  (Declarations.one_inductive_body option -> string) ->
  ?deps:(Environ.env -> Names.MutInd.t -> bool -> scheme_dependency list) ->
  mutual_scheme_object_function -> mutual scheme_kind

val declare_individual_scheme_object : string list * Sorts.family option ->
  (Declarations.one_inductive_body option -> string) ->
  ?deps:(Environ.env -> inductive -> bool -> scheme_dependency list) ->
  individual_scheme_object_function ->
  individual scheme_kind

val is_declared_scheme_object : string list * Sorts.family option * bool -> bool
(** Is the string used as the name of a [scheme_kind]? *)

val scheme_kind_name : _ scheme_kind -> string list * Sorts.family option * bool
(** Name of a [scheme_kind]. Can be used to register with DeclareScheme. *)

val scheme_key : string list * Sorts.family option * bool -> _ scheme_kind

val get_suff : string list -> Sorts.family option -> Declarations.one_inductive_body option -> string
  
(** Force generation of a (mutually) scheme with possibly user-level names *)

val define_individual_scheme : ?loc:Loc.t -> ?intern:bool -> individual scheme_kind ->
  Id.t option -> inductive -> unit

module Locmap : sig
  type t

  val default : Loc.t option -> t
  val make
     : ?default:Loc.t (* The default is the loc of the first inductive, if passed *)
    -> Names.MutInd.t
    -> Loc.t option list (* order must match the one of the inductives block *)
    -> t
  val lookup : locmap:t -> Names.inductive -> Loc.t option
end

val define_mutual_scheme : ?locmap:Locmap.t -> ?intern:bool -> mutual scheme_kind ->
  (int * Id.t) list -> inductive list -> unit

(** Main function to retrieve a scheme in the cache or to generate it *)
val find_scheme : 'a scheme_kind -> inductive -> Constant.t Proofview.tactic

(** Like [find_scheme] but does not generate a constant on the fly *)
val lookup_scheme : 'a scheme_kind -> inductive -> Constant.t option

(** To be used by scheme-generating functions when looking for a subscheme. *)
val local_lookup_scheme : handle -> 'a scheme_kind -> inductive -> Constant.t option

val pr_scheme_kind : 'a scheme_kind -> Pp.t

val declare_definition_scheme :
  (internal : bool
   -> univs:UState.named_universes_entry
   -> role:Evd.side_effect_role
   -> name:Id.t
   -> ?loc:Loc.t
   -> Constr.t
   -> Constant.t * Evd.side_effects) ref
