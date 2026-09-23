import JSP690.Construction

/-! # Complete affirmative answer to JSP-000690 -/
namespace JSP690

/-- There is a finite simple three-uniform hypergraph whose chromatic number
is exactly three, every proper subhypergraph is two-colorable, and every
vertex has degree at least seven. -/
theorem exists_three_uniform_three_chromatic_critical :
    ∃ (n : Nat) (H : Hypergraph n),
      IsSimple H ∧ IsUniform 3 H ∧ ChromaticNumberEq 3 H ∧
      ChromaticCritical H ∧ (∀ v : Fin n, 7 ≤ degree H v) :=
  ⟨9, construction, construction_simple, construction_uniform,
    construction_chromatic_number, construction_critical, construction_min_degree⟩

end JSP690
