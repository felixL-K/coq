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

val declare_scheme : Libobject.locality -> (string list * Sorts.family option * bool) -> (inductive * Constant.t) -> unit
val lookup_scheme : (string list * Sorts.family option * bool) -> inductive -> Constant.t
val all_schemes : unit -> Constant.t Sorts.Map.t Indmap.t
