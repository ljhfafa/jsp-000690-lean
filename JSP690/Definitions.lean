import Std

/-!
# Finite simple hypergraphs and the precise target property

An edge is its increasingly ordered list of vertices. `IsSimple` checks this
canonical set representation and excludes duplicate edges. A subhypergraph may
remove vertices and whole edges; it never shrinks an edge.
-/
namespace JSP690

abbrev Edge (n : Nat) := List (Fin n)
abbrev Hypergraph (n : Nat) := List (Edge n)

/-- Canonical finite edge sets, with no repeated vertices or edges. -/
def IsSimple {n : Nat} (H : Hypergraph n) : Prop :=
  H.Nodup ∧ ∀ e ∈ H, e.Pairwise (fun v w => v.val < w.val)

/-- Every edge has exactly `r` distinct vertices when `H` is simple. -/
def IsUniform {n : Nat} (r : Nat) (H : Hypergraph n) : Prop :=
  ∀ e ∈ H, e.length = r

/-- Number of incident edges, counted once when `H` is simple. -/
def degree {n : Nat} (H : Hypergraph n) (v : Fin n) : Nat :=
  H.countP (fun e => decide (v ∈ e))

/-- Weak hypergraph coloring: each edge contains two different colors. -/
def ProperColoring {n : Nat} {C : Type} (H : Hypergraph n) (c : Fin n → C) : Prop :=
  ∀ e ∈ H, ∃ v ∈ e, ∃ w ∈ e, c v ≠ c w

def Colorable {n : Nat} (k : Nat) (H : Hypergraph n) : Prop :=
  ∃ c : Fin n → Fin k, ProperColoring H c

/-- Literal least-color formulation, including zero and one color. -/
def ChromaticNumberEq {n : Nat} (k : Nat) (H : Hypergraph n) : Prop :=
  Colorable k H ∧ ∀ j, j < k → ¬ Colorable j H

/-- A subhypergraph with vertex set `W` and edge family `F`. -/
def IsSubhypergraph {n : Nat} (H : Hypergraph n) (W : Fin n → Prop)
    (F : Hypergraph n) : Prop :=
  (∀ e ∈ F, e ∈ H) ∧ (∀ e ∈ F, ∀ v ∈ e, W v)

/-- Proper means a vertex or an original edge is missing. -/
def IsProperSubhypergraph {n : Nat} (H : Hypergraph n) (W : Fin n → Prop)
    (F : Hypergraph n) : Prop :=
  IsSubhypergraph H W F ∧ ((∃ v, ¬ W v) ∨ ∃ e ∈ H, e ∉ F)

/-- Every proper subhypergraph is colorable with two colors. Colors outside
its vertex set are irrelevant; extending them does not change this property. -/
def ChromaticCritical {n : Nat} (H : Hypergraph n) : Prop :=
  ∀ (W : Fin n → Prop) (F : Hypergraph n),
    IsProperSubhypergraph H W F → Colorable 2 F

def deleteEdge {n : Nat} (H : Hypergraph n) (e : Edge n) : Hypergraph n :=
  H.filter (fun f => decide (f ≠ e))

/-- Vertex deletion removes all incident edges, preserving the other edges. -/
def deleteVertex {n : Nat} (H : Hypergraph n) (v : Fin n) : Hypergraph n :=
  H.filter (fun e => decide (v ∉ e))

end JSP690
