theories/Zarith/Zsyntax.vo: theories/Zarith/Zsyntax.v theories/Zarith/fast_integer.vo theories/Zarith/zarith_aux.vo parsing/g_zsyntax.cmo
theories/Zarith/Zmisc.vo: theories/Zarith/Zmisc.v theories/Zarith/fast_integer.vo theories/Zarith/zarith_aux.vo theories/Zarith/auxiliary.vo theories/Zarith/Zsyntax.vo theories/Bool/Bool.vo
theories/Zarith/ZArith.vo: theories/Zarith/ZArith.v theories/Zarith/fast_integer.vo theories/Zarith/zarith_aux.vo theories/Zarith/auxiliary.vo theories/Zarith/Zsyntax.vo theories/Zarith/ZArith_dec.vo theories/Zarith/Zmisc.vo theories/Zarith/Wf_Z.vo
theories/Zarith/ZArith_dec.vo: theories/Zarith/ZArith_dec.v theories/Bool/Sumbool.vo theories/Zarith/fast_integer.vo theories/Zarith/zarith_aux.vo theories/Zarith/auxiliary.vo theories/Zarith/Zsyntax.vo
theories/Zarith/zarith_aux.vo: theories/Zarith/zarith_aux.v theories/Arith/Arith.vo theories/Zarith/fast_integer.vo
theories/Zarith/Wf_Z.vo: theories/Zarith/Wf_Z.v theories/Zarith/fast_integer.vo theories/Zarith/zarith_aux.vo theories/Zarith/auxiliary.vo theories/Zarith/Zsyntax.vo
theories/Zarith/fast_integer.vo: theories/Zarith/fast_integer.v theories/Arith/Le.vo theories/Arith/Lt.vo theories/Arith/Plus.vo theories/Arith/Mult.vo theories/Arith/Minus.vo
theories/Zarith/auxiliary.vo: theories/Zarith/auxiliary.v theories/Arith/Arith.vo theories/Zarith/fast_integer.vo theories/Zarith/zarith_aux.vo theories/Arith/Peano_dec.vo theories/Arith/Compare_dec.vo
theories/Sets/Uniset.vo: theories/Sets/Uniset.v theories/Bool/Bool.vo theories/Sets/Permut.vo
theories/Sets/Relations_3.vo: theories/Sets/Relations_3.v theories/Sets/Relations_1.vo theories/Sets/Relations_2.vo
theories/Sets/Relations_3_facts.vo: theories/Sets/Relations_3_facts.v theories/Sets/Relations_1.vo theories/Sets/Relations_1_facts.vo theories/Sets/Relations_2.vo theories/Sets/Relations_2_facts.vo theories/Sets/Relations_3.vo
theories/Sets/Relations_2.vo: theories/Sets/Relations_2.v theories/Sets/Relations_1.vo
theories/Sets/Relations_2_facts.vo: theories/Sets/Relations_2_facts.v theories/Sets/Relations_1.vo theories/Sets/Relations_1_facts.vo theories/Sets/Relations_2.vo
theories/Sets/Relations_1.vo: theories/Sets/Relations_1.v
theories/Sets/Relations_1_facts.vo: theories/Sets/Relations_1_facts.v theories/Sets/Relations_1.vo
theories/Sets/Powerset.vo: theories/Sets/Powerset.v theories/Sets/Ensembles.vo theories/Sets/Relations_1.vo theories/Sets/Relations_1_facts.vo theories/Sets/Partial_Order.vo theories/Sets/Cpo.vo
theories/Sets/Powerset_facts.vo: theories/Sets/Powerset_facts.v theories/Sets/Ensembles.vo theories/Sets/Constructive_sets.vo theories/Sets/Relations_1.vo theories/Sets/Relations_1_facts.vo theories/Sets/Partial_Order.vo theories/Sets/Cpo.vo theories/Sets/Powerset.vo
theories/Sets/Powerset_Classical_facts.vo: theories/Sets/Powerset_Classical_facts.v theories/Sets/Ensembles.vo theories/Sets/Constructive_sets.vo theories/Sets/Relations_1.vo theories/Sets/Relations_1_facts.vo theories/Sets/Partial_Order.vo theories/Sets/Cpo.vo theories/Sets/Powerset.vo theories/Sets/Powerset_facts.vo theories/Logic/Classical_Type.vo theories/Sets/Classical_sets.vo
theories/Sets/Permut.vo: theories/Sets/Permut.v
theories/Sets/Partial_Order.vo: theories/Sets/Partial_Order.v theories/Sets/Ensembles.vo theories/Sets/Relations_1.vo
theories/Sets/Multiset.vo: theories/Sets/Multiset.v theories/Sets/Permut.vo theories/Arith/Plus.vo
theories/Sets/Integers.vo: theories/Sets/Integers.v theories/Sets/Finite_sets.vo theories/Sets/Constructive_sets.vo theories/Logic/Classical_Type.vo theories/Sets/Classical_sets.vo theories/Sets/Powerset.vo theories/Sets/Powerset_facts.vo theories/Sets/Powerset_Classical_facts.vo theories/Arith/Gt.vo theories/Arith/Lt.vo theories/Arith/Le.vo theories/Sets/Finite_sets_facts.vo theories/Sets/Image.vo theories/Sets/Infinite_sets.vo theories/Arith/Compare_dec.vo theories/Sets/Relations_1.vo theories/Sets/Partial_Order.vo theories/Sets/Cpo.vo
theories/Sets/Infinite_sets.vo: theories/Sets/Infinite_sets.v theories/Sets/Finite_sets.vo theories/Sets/Constructive_sets.vo theories/Logic/Classical_Type.vo theories/Sets/Classical_sets.vo theories/Sets/Powerset.vo theories/Sets/Powerset_facts.vo theories/Sets/Powerset_Classical_facts.vo theories/Arith/Gt.vo theories/Arith/Lt.vo theories/Arith/Le.vo theories/Sets/Finite_sets_facts.vo theories/Sets/Image.vo
theories/Sets/Image.vo: theories/Sets/Image.v theories/Sets/Finite_sets.vo theories/Sets/Constructive_sets.vo theories/Logic/Classical_Type.vo theories/Sets/Classical_sets.vo theories/Sets/Powerset.vo theories/Sets/Powerset_facts.vo theories/Sets/Powerset_Classical_facts.vo theories/Arith/Gt.vo theories/Arith/Lt.vo theories/Arith/Le.vo theories/Sets/Finite_sets_facts.vo
theories/Sets/Finite_sets.vo: theories/Sets/Finite_sets.v theories/Sets/Ensembles.vo theories/Sets/Constructive_sets.vo
theories/Sets/Finite_sets_facts.vo: theories/Sets/Finite_sets_facts.v theories/Sets/Finite_sets.vo theories/Sets/Constructive_sets.vo theories/Logic/Classical_Type.vo theories/Sets/Classical_sets.vo theories/Sets/Powerset.vo theories/Sets/Powerset_facts.vo theories/Sets/Powerset_Classical_facts.vo theories/Arith/Gt.vo theories/Arith/Lt.vo
theories/Sets/Ensembles.vo: theories/Sets/Ensembles.v
theories/Sets/Cpo.vo: theories/Sets/Cpo.v theories/Sets/Ensembles.vo theories/Sets/Relations_1.vo theories/Sets/Partial_Order.vo
theories/Sets/Constructive_sets.vo: theories/Sets/Constructive_sets.v theories/Sets/Ensembles.vo
theories/Sets/Classical_sets.vo: theories/Sets/Classical_sets.v theories/Sets/Ensembles.vo theories/Sets/Constructive_sets.vo theories/Logic/Classical_Type.vo
theories/Relations/Rstar.vo: theories/Relations/Rstar.v
theories/Relations/Relations.vo: theories/Relations/Relations.v theories/Relations/Relation_Definitions.vo theories/Relations/Relation_Operators.vo theories/Relations/Operators_Properties.vo
theories/Relations/Relation_Operators.vo: theories/Relations/Relation_Operators.v theories/Relations/Relation_Definitions.vo theories/Lists/PolyList.vo theories/Lists/PolyListSyntax.vo
theories/Relations/Relation_Definitions.vo: theories/Relations/Relation_Definitions.v
theories/Relations/Operators_Properties.vo: theories/Relations/Operators_Properties.v theories/Relations/Relation_Definitions.vo theories/Relations/Relation_Operators.vo
theories/Relations/Newman.vo: theories/Relations/Newman.v theories/Relations/Rstar.vo
theories/Reals/TypeSyntax.vo: theories/Reals/TypeSyntax.v
theories/Reals/Rlimit.vo: theories/Reals/Rlimit.v theories/Reals/Rbasic_fun.vo theories/Logic/Classical_Prop.vo
theories/Reals/R_Ifp.vo: theories/Reals/R_Ifp.v theories/Reals/Rbase.vo contrib/omega/Omega.vo
theories/Reals/Rfunctions.vo: theories/Reals/Rfunctions.v theories/Reals/Rlimit.vo
theories/Reals/Reals.vo: theories/Reals/Reals.v theories/Reals/TypeSyntax.vo theories/Reals/Raxioms.vo theories/Reals/Rbase.vo theories/Reals/R_Ifp.vo theories/Reals/Rbasic_fun.vo theories/Reals/Rlimit.vo theories/Reals/Rfunctions.vo theories/Reals/Rderiv.vo
theories/Reals/Rderiv.vo: theories/Reals/Rderiv.v theories/Reals/Rfunctions.vo theories/Logic/Classical_Pred_Type.vo contrib/omega/Omega.vo
theories/Reals/Rbasic_fun.vo: theories/Reals/Rbasic_fun.v theories/Reals/R_Ifp.vo
theories/Reals/Rbase.vo: theories/Reals/Rbase.v theories/Reals/Raxioms.vo contrib/ring/ZArithRing.vo theories/Logic/Classical_Prop.vo contrib/omega/Omega.vo
theories/Reals/Raxioms.vo: theories/Reals/Raxioms.v theories/Zarith/ZArith.vo theories/Reals/TypeSyntax.vo
theories/Logic/Eqdep.vo: theories/Logic/Eqdep.v
theories/Logic/Eqdep_dec.vo: theories/Logic/Eqdep_dec.v
theories/Logic/Classical.vo: theories/Logic/Classical.v theories/Logic/Classical_Prop.vo theories/Logic/Classical_Pred_Set.vo
theories/Logic/Classical_Type.vo: theories/Logic/Classical_Type.v theories/Logic/Classical_Prop.vo theories/Logic/Classical_Pred_Type.vo
theories/Logic/Classical_Prop.vo: theories/Logic/Classical_Prop.v
theories/Logic/Classical_Pred_Type.vo: theories/Logic/Classical_Pred_Type.v theories/Logic/Classical_Prop.vo
theories/Logic/Classical_Pred_Set.vo: theories/Logic/Classical_Pred_Set.v theories/Logic/Classical_Prop.vo
theories/Lists/TheoryList.vo: theories/Lists/TheoryList.v theories/Lists/PolyList.vo theories/Arith/Le.vo theories/Arith/Lt.vo theories/Arith/Minus.vo theories/Bool/DecBool.vo
theories/Lists/Streams.vo: theories/Lists/Streams.v
theories/Lists/PolyList.vo: theories/Lists/PolyList.v theories/Arith/Le.vo
theories/Lists/PolyListSyntax.vo: theories/Lists/PolyListSyntax.v theories/Lists/PolyList.vo
theories/Lists/List.vo: theories/Lists/List.v theories/Arith/Le.vo
theories/Lists/ListSet.vo: theories/Lists/ListSet.v theories/Lists/PolyList.vo
theories/Init/Wf.vo: theories/Init/Wf.v theories/Init/Logic.vo theories/Init/LogicSyntax.vo
theories/Init/Specif.vo: theories/Init/Specif.v theories/Init/Logic.vo theories/Init/LogicSyntax.vo
theories/Init/SpecifSyntax.vo: theories/Init/SpecifSyntax.v theories/Init/LogicSyntax.vo theories/Init/Specif.vo
theories/Init/Prelude.vo: theories/Init/Prelude.v theories/Init/Datatypes.vo theories/Init/DatatypesSyntax.vo theories/Init/Logic.vo theories/Init/LogicSyntax.vo theories/Init/Specif.vo theories/Init/SpecifSyntax.vo theories/Init/Peano.vo theories/Init/Wf.vo
theories/Init/Peano.vo: theories/Init/Peano.v theories/Init/Logic.vo theories/Init/LogicSyntax.vo theories/Init/Datatypes.vo
theories/Init/Logic.vo: theories/Init/Logic.v theories/Init/Datatypes.vo
theories/Init/Logic_Type.vo: theories/Init/Logic_Type.v theories/Init/Logic.vo theories/Init/LogicSyntax.vo
theories/Init/Logic_TypeSyntax.vo: theories/Init/Logic_TypeSyntax.v theories/Init/Logic_Type.vo
theories/Init/LogicSyntax.vo: theories/Init/LogicSyntax.v theories/Init/Logic.vo
theories/Init/Datatypes.vo: theories/Init/Datatypes.v
theories/Init/DatatypesSyntax.vo: theories/Init/DatatypesSyntax.v theories/Init/Datatypes.vo
theories/Bool/Zerob.vo: theories/Bool/Zerob.v theories/Arith/Arith.vo theories/Bool/Bool.vo
theories/Bool/Sumbool.vo: theories/Bool/Sumbool.v
theories/Bool/IfProp.vo: theories/Bool/IfProp.v theories/Bool/Bool.vo
theories/Bool/DecBool.vo: theories/Bool/DecBool.v
theories/Bool/Bool.vo: theories/Bool/Bool.v
theories/Arith/Wf_nat.vo: theories/Arith/Wf_nat.v theories/Arith/Lt.vo
theories/Arith/Plus.vo: theories/Arith/Plus.v theories/Arith/Le.vo theories/Arith/Lt.vo
theories/Arith/Peano_dec.vo: theories/Arith/Peano_dec.v
theories/Arith/Mult.vo: theories/Arith/Mult.v theories/Arith/Plus.vo theories/Arith/Minus.vo
theories/Arith/Min.vo: theories/Arith/Min.v theories/Arith/Arith.vo
theories/Arith/Minus.vo: theories/Arith/Minus.v theories/Arith/Lt.vo theories/Arith/Le.vo
theories/Arith/Lt.vo: theories/Arith/Lt.v theories/Arith/Le.vo
theories/Arith/Le.vo: theories/Arith/Le.v
theories/Arith/Gt.vo: theories/Arith/Gt.v theories/Arith/Le.vo theories/Arith/Lt.vo theories/Arith/Plus.vo
theories/Arith/Even.vo: theories/Arith/Even.v
theories/Arith/Euclid_proof.vo: theories/Arith/Euclid_proof.v theories/Arith/Minus.vo theories/Arith/Euclid_def.vo theories/Arith/Compare_dec.vo theories/Arith/Wf_nat.vo
theories/Arith/Euclid_def.vo: theories/Arith/Euclid_def.v theories/Arith/Mult.vo
theories/Arith/EqNat.vo: theories/Arith/EqNat.v
theories/Arith/Div.vo: theories/Arith/Div.v theories/Arith/Le.vo theories/Arith/Euclid_def.vo theories/Arith/Compare_dec.vo
theories/Arith/Div2.vo: theories/Arith/Div2.v theories/Arith/Lt.vo theories/Arith/Plus.vo theories/Arith/Compare_dec.vo theories/Arith/Even.vo
theories/Arith/Compare.vo: theories/Arith/Compare.v theories/Arith/Arith.vo theories/Arith/Peano_dec.vo theories/Arith/Compare_dec.vo theories/Arith/Wf_nat.vo theories/Arith/Min.vo
theories/Arith/Compare_dec.vo: theories/Arith/Compare_dec.v theories/Arith/Le.vo theories/Arith/Lt.vo
theories/Arith/Between.vo: theories/Arith/Between.v theories/Arith/Le.vo theories/Arith/Lt.vo
theories/Arith/Arith.vo: theories/Arith/Arith.v theories/Arith/Le.vo theories/Arith/Lt.vo theories/Arith/Plus.vo theories/Arith/Gt.vo theories/Arith/Minus.vo theories/Arith/Mult.vo theories/Arith/Between.vo parsing/g_natsyntax.cmo
test-suite/bench/lists-100.vo: test-suite/bench/lists-100.v
test-suite/bench/lists_100.vo: test-suite/bench/lists_100.v
contrib/ring/ZArithRing.vo: contrib/ring/ZArithRing.v contrib/ring/ArithRing.vo theories/Zarith/ZArith.vo theories/Logic/Eqdep_dec.vo
contrib/ring/Ring.vo: contrib/ring/Ring.v theories/Bool/Bool.vo contrib/ring/Ring_theory.vo contrib/ring/Quote.vo contrib/ring/Ring_normalize.vo contrib/ring/Ring_abstract.vo contrib/ring/ring.cmo
contrib/ring/Ring_theory.vo: contrib/ring/Ring_theory.v theories/Bool/Bool.vo
contrib/ring/Ring_normalize.vo: contrib/ring/Ring_normalize.v contrib/ring/Ring_theory.vo contrib/ring/Quote.vo
contrib/ring/Ring_abstract.vo: contrib/ring/Ring_abstract.v contrib/ring/Ring_theory.vo contrib/ring/Quote.vo contrib/ring/Ring_normalize.vo
contrib/ring/Quote.vo: contrib/ring/Quote.v contrib/ring/quote.cmo
contrib/ring/ArithRing.vo: contrib/ring/ArithRing.v contrib/ring/Ring.vo theories/Arith/Arith.vo theories/Logic/Eqdep_dec.vo
contrib/omega/Zpower.vo: contrib/omega/Zpower.v theories/Zarith/ZArith.vo contrib/omega/Omega.vo contrib/omega/Zcomplements.vo
contrib/omega/Zlogarithm.vo: contrib/omega/Zlogarithm.v contrib/omega/Omega.vo contrib/omega/Zcomplements.vo contrib/omega/Zpower.vo
contrib/omega/Zcomplements.vo: contrib/omega/Zcomplements.v theories/Zarith/ZArith.vo contrib/omega/Omega.vo theories/Arith/Wf_nat.vo
contrib/omega/Omega.vo: contrib/omega/Omega.v theories/Zarith/ZArith.vo theories/Arith/Minus.vo contrib/omega/omega.cmo contrib/omega/coq_omega.cmo contrib/omega/OmegaSyntax.vo
contrib/omega/OmegaSyntax.vo: contrib/omega/OmegaSyntax.v
tactics/Tauto.vo: tactics/Tauto.v
tactics/Inv.vo: tactics/Inv.v tactics/Equality.vo
tactics/Equality.vo: tactics/Equality.v
syntax/PPTactic.vo: syntax/PPTactic.v
syntax/PPConstr.vo: syntax/PPConstr.v
syntax/PPCases.vo: syntax/PPCases.v
syntax/MakeBare.vo: syntax/MakeBare.v
states/MakeInitial.vo: states/MakeInitial.v theories/Init/Prelude.vo theories/Init/Logic_Type.vo theories/Init/Logic_TypeSyntax.vo tactics/Equality.vo tactics/Tauto.vo tactics/Inv.vo
