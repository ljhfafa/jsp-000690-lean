import JSP690.Definitions

/-!
# General coloring and criticality lemmas

These arguments are independent of the particular finite construction.
-/
namespace JSP690

/-- Restricting the edge family preserves a proper coloring. -/
theorem properColoring_mono {n : Nat} {C : Type}
    {H F : Hypergraph n} {c : Fin n → C}
    (hFH : ∀ e ∈ F, e ∈ H) (hc : ProperColoring H c) :
    ProperColoring F c := by
  intro e he
  exact hc e (hFH e he)

/-- An edge subfamily is colorable whenever the original family is. -/
theorem colorable_mono {n k : Nat} {H F : Hypergraph n}
    (hFH : ∀ e ∈ F, e ∈ H) (hH : Colorable k H) :
    Colorable k F := by
  obtain ⟨c, hc⟩ := hH
  exact ⟨c, properColoring_mono hFH hc⟩

/-- A coloring remains proper when its colors are included in a larger palette.
This also covers the empty palette. -/
theorem colorable_of_le {n a b : Nat} {H : Hypergraph n}
    (hab : a ≤ b) (hH : Colorable a H) : Colorable b H := by
  obtain ⟨c, hc⟩ := hH
  let d : Fin n → Fin b := fun v =>
    ⟨(c v).val, Nat.lt_of_lt_of_le (c v).isLt hab⟩
  refine ⟨d, ?_⟩
  intro e he
  obtain ⟨v, hv, w, hw, hne⟩ := hc e he
  refine ⟨v, hv, w, hw, ?_⟩
  intro h
  apply hne
  apply Fin.ext
  exact congrArg (fun x : Fin b => x.val) h

/-- Three-colorability and failure of two-colorability establish the literal
least chromatic number, including exclusion of zero and one color. -/
theorem chromaticNumberEq_three {n : Nat} {H : Hypergraph n}
    (hthree : Colorable 3 H) (htwo : ¬ Colorable 2 H) :
    ChromaticNumberEq 3 H := by
  refine ⟨hthree, ?_⟩
  intro j hj hcolor
  exact htwo (colorable_of_le (by omega) hcolor)

/-- Deletion certificates cover every proper subhypergraph, even when both
vertices and edges are removed. -/
theorem chromaticCritical_of_deletions {n : Nat} {H : Hypergraph n}
    (hedge : ∀ e ∈ H, Colorable 2 (deleteEdge H e))
    (hvertex : ∀ v, Colorable 2 (deleteVertex H v)) :
    ChromaticCritical H := by
  intro W F hproper
  obtain ⟨⟨hFH, hW⟩, hmissing⟩ := hproper
  rcases hmissing with ⟨v, hv⟩ | ⟨e, he, heF⟩
  · apply colorable_mono (H := deleteVertex H v) ?_ (hvertex v)
    intro e he
    have hve : v ∉ e := by
      intro hmem
      exact hv (hW e he v hmem)
    simp [deleteVertex, List.mem_filter, hFH e he, hve]
  · apply colorable_mono (H := deleteEdge H e) ?_ (hedge e he)
    intro f hf
    have hfe : f ≠ e := by
      intro h
      subst f
      exact heF hf
    simp [deleteEdge, List.mem_filter, hFH f hf, hfe]

end JSP690
