import JSP690.Main

/-!
External semantic audit. Edges here are vertex predicates, and subhypergraphs
have arbitrary predicate-valued edge families. No definition below aliases
the submission's coloring or subhypergraph predicates.
-/
namespace AuditBridge

abbrev VertexSet (n : Nat) := Fin n → Prop
abbrev EdgeFamily (n : Nat) := VertexSet n → Prop

def edgeSet {n : Nat} (e : JSP690.Edge n) : VertexSet n := fun v => v ∈ e

def family {n : Nat} (H : JSP690.Hypergraph n) : EdgeFamily n :=
  fun S => ∃ e ∈ H, S = edgeSet e

/-- An edge is not monochromatic if its vertices do not all have equal colors. -/
def Proper {n : Nat} {C : Type} (E : EdgeFamily n) (c : Fin n → C) : Prop :=
  ∀ S, E S → ¬ (∀ v, S v → ∀ w, S w → c v = c w)

def HasColoring {n : Nat} (k : Nat) (E : EdgeFamily n) : Prop :=
  ∃ c : Fin n → Fin k, Proper E c

def RestrictedProper {n : Nat} (W : VertexSet n) (E : EdgeFamily n)
    (c : {v // W v} → Fin 2) : Prop :=
  ∀ S, E S → ¬ (∀ v w : {v // W v}, S v.val → S w.val → c v = c w)

def Critical {n : Nat} (E : EdgeFamily n) : Prop :=
  ∀ (W : VertexSet n) (F : EdgeFamily n),
    (∀ S, F S → E S) →
    (∀ S, F S → ∀ v, S v → W v) →
    ((∃ v, ¬ W v) ∨ ∃ S, E S ∧ ¬ F S) →
    ∃ c : {v // W v} → Fin 2, RestrictedProper W F c

/-- Each conventional edge has exactly three distinct vertices. -/
def ThreeUniform {n : Nat} (E : EdgeFamily n) : Prop :=
  ∀ S, E S → ∃ a b c : Fin n,
    a ≠ b ∧ a ≠ c ∧ b ≠ c ∧ ∀ v, S v ↔ v = a ∨ v = b ∨ v = c

/-- Degree is expressed without a list counter: seven distinct incident sets. -/
def DegreeAtLeastSeven {n : Nat} (E : EdgeFamily n) : Prop :=
  ∀ v, ∃ edges : Fin 7 → VertexSet n,
    (∀ i, E (edges i) ∧ edges i v) ∧
    (∀ i j, edges i = edges j → i = j)

theorem three_uniform_bridge {n : Nat} (H : JSP690.Hypergraph n)
    (hs : JSP690.IsSimple H) (hu : JSP690.IsUniform 3 H) :
    ThreeUniform (family H) := by
  intro S hS
  obtain ⟨e, he, rfl⟩ := hS
  have hlength := hu e he
  have hsort := hs.2 e he
  cases e with
  | nil => simp at hlength
  | cons a t =>
    cases t with
    | nil => simp at hlength
    | cons b t =>
      cases t with
      | nil => simp at hlength
      | cons c t =>
        have ht : t = [] := by simpa using hlength
        subst t
        have hab : a.val < b.val := (List.pairwise_cons.mp hsort).1 b (by simp)
        have hac : a.val < c.val := (List.pairwise_cons.mp hsort).1 c (by simp)
        have hbc : b.val < c.val :=
          (List.pairwise_cons.mp (List.pairwise_cons.mp hsort).2).1 c (by simp)
        refine ⟨a, b, c, ?_, ?_, ?_, ?_⟩
        · intro h; subst b; omega
        · intro h; subst c; omega
        · intro h; subst c; omega
        · intro v; simp [edgeSet]

/-- Canonical sorted edge lists cannot represent the same set differently. -/
theorem sorted_edge_injective {n : Nat} (e f : JSP690.Edge n)
    (he : e.Pairwise (fun v w => v.val < w.val))
    (hf : f.Pairwise (fun v w => v.val < w.val))
    (hset : edgeSet e = edgeSet f) : e = f := by
  have hmem : ∀ v, v ∈ e ↔ v ∈ f := by
    intro v
    exact Iff.of_eq (congrFun hset v)
  clear hset
  induction e generalizing f with
  | nil =>
    cases f with
    | nil => rfl
    | cons b t =>
      have := (hmem b).mpr (by simp)
      simp at this
  | cons a es ih =>
    cases f with
    | nil =>
      have := (hmem a).mp (by simp)
      simp at this
    | cons b fs =>
      have ha : a = b ∨ a ∈ fs := by simpa using (hmem a).mp (by simp)
      have hb : b = a ∨ b ∈ es := by simpa using (hmem b).mpr (by simp)
      have hab : a = b := by
        rcases ha with h | ha
        · exact h
        rcases hb with h | hb
        · exact h.symm
        have hab := (List.pairwise_cons.mp he).1 b hb
        have hba := (List.pairwise_cons.mp hf).1 a ha
        omega
      subst b
      apply congrArg (List.cons a)
      apply ih fs (List.pairwise_cons.mp he).2 (List.pairwise_cons.mp hf).2
      intro v
      constructor
      · intro hv
        have hm : v = a ∨ v ∈ fs := by simpa using (hmem v).mp (by simp [hv])
        rcases hm with h | hm
        · subst v
          have := (List.pairwise_cons.mp he).1 a hv
          omega
        · exact hm
      · intro hv
        have hm : v = a ∨ v ∈ es := by simpa using (hmem v).mpr (by simp [hv])
        rcases hm with h | hm
        · subst v
          have := (List.pairwise_cons.mp hf).1 a hv
          omega
        · exact hm

theorem degree_bridge {n : Nat} (H : JSP690.Hypergraph n)
    (hs : JSP690.IsSimple H) (hd : ∀ v, 7 ≤ JSP690.degree H v) :
    DegreeAtLeastSeven (family H) := by
  intro v
  let incident := H.filter (fun e => decide (v ∈ e))
  have hlength : 7 ≤ incident.length := by
    simpa [JSP690.degree, List.countP_eq_length_filter, incident] using hd v
  have hnodup : incident.Nodup := List.Pairwise.filter _ hs.1
  let incidentEdge : Fin 7 → JSP690.Edge n := fun i => incident[i.val]'(by omega)
  have hincidentEdge (i : Fin 7) : incidentEdge i ∈ H ∧ v ∈ incidentEdge i := by
    have hm : incidentEdge i ∈ incident := List.getElem_mem (by omega)
    simpa [incident] using hm
  refine ⟨fun i => edgeSet (incidentEdge i), ?_, ?_⟩
  · intro i
    exact ⟨⟨incidentEdge i, (hincidentEdge i).1, rfl⟩, (hincidentEdge i).2⟩
  · intro i j h
    have heq : incidentEdge i = incidentEdge j := sorted_edge_injective (incidentEdge i) (incidentEdge j)
      (hs.2 (incidentEdge i) (hincidentEdge i).1) (hs.2 (incidentEdge j) (hincidentEdge j).1) h
    have hij : i.val = j.val := List.getElem_inj hnodup |>.mp heq
    exact Fin.ext hij

theorem proper_iff {n : Nat} {C : Type} (H : JSP690.Hypergraph n)
    (c : Fin n → C) : Proper (family H) c ↔ JSP690.ProperColoring H c := by
  constructor
  · intro h e he
    have hn := h (edgeSet e) ⟨e, he, rfl⟩
    apply Classical.byContradiction
    intro hmissing
    apply hn
    intro v hv w hw
    apply Classical.byContradiction
    intro hne
    exact hmissing ⟨v, hv, w, hw, hne⟩
  · intro h S hS hmono
    obtain ⟨e, he, rfl⟩ := hS
    obtain ⟨v, hv, w, hw, hne⟩ := h e he
    exact hne (hmono v hv w hw)

theorem hasColoring_iff {n : Nat} (k : Nat) (H : JSP690.Hypergraph n) :
    HasColoring k (family H) ↔ JSP690.Colorable k H := by
  constructor
  · intro ⟨c, hc⟩
    exact ⟨c, (proper_iff H c).mp hc⟩
  · intro ⟨c, hc⟩
    exact ⟨c, (proper_iff H c).mpr hc⟩

noncomputable def selected {n : Nat} (H : JSP690.Hypergraph n)
    (F : EdgeFamily n) : JSP690.Hypergraph n := by
  classical
  exact H.filter (fun e => decide (F (edgeSet e)))

theorem mem_selected_iff {n : Nat} (H : JSP690.Hypergraph n)
    (F : EdgeFamily n) (e : JSP690.Edge n) :
    e ∈ selected H F ↔ e ∈ H ∧ F (edgeSet e) := by
  classical
  simp [selected]

/-- Every arbitrary set-valued subfamily is represented by a selected list. -/
theorem family_selected_iff {n : Nat} (H : JSP690.Hypergraph n)
    (F : EdgeFamily n) (hsub : ∀ S, F S → family H S) (S : VertexSet n) :
    family (selected H F) S ↔ F S := by
  constructor
  · intro hS
    obtain ⟨e, he, hSe⟩ := hS
    cases hSe
    exact ((mem_selected_iff H F e).mp he).2
  · intro hS
    obtain ⟨e, he, rfl⟩ := hsub S hS
    exact ⟨e, (mem_selected_iff H F e).mpr ⟨he, hS⟩, rfl⟩

/-- The submission's criticality theorem entails criticality for arbitrary
ordinary edge sets, with colorings on the actual retained vertices. -/
theorem critical_bridge {n : Nat} (H : JSP690.Hypergraph n)
    (hcrit : JSP690.ChromaticCritical H) : Critical (family H) := by
  intro W F hsub hsupport hproper
  have hlistSub : JSP690.IsSubhypergraph H W (selected H F) := by
    constructor
    · intro e he
      exact ((mem_selected_iff H F e).mp he).1
    · intro e he v hv
      exact hsupport (edgeSet e) ((mem_selected_iff H F e).mp he).2 v hv
  have hlistProper : JSP690.IsProperSubhypergraph H W (selected H F) := by
    refine ⟨hlistSub, ?_⟩
    rcases hproper with hvertex | ⟨S, hS, hnot⟩
    · exact Or.inl hvertex
    · obtain ⟨e, he, rfl⟩ := hS
      apply Or.inr
      refine ⟨e, he, ?_⟩
      intro hemem
      exact hnot ((mem_selected_iff H F e).mp hemem).2
  obtain ⟨c, hc⟩ := hcrit W (selected H F) hlistProper
  have hsemantic : Proper F c := by
    intro S hS
    exact (proper_iff (selected H F) c).mpr hc S
      ((family_selected_iff H F hsub S).mpr hS)
  refine ⟨fun v => c v.val, ?_⟩
  intro S hS hmono
  apply hsemantic S hS
  intro v hv w hw
  exact hmono ⟨v, hsupport S hS v hv⟩ ⟨w, hsupport S hS w hw⟩ hv hw

/-- A separately expressed least-color assertion on ordinary edge sets. -/
theorem chromatic_number_bridge {n : Nat} (H : JSP690.Hypergraph n)
    (h : JSP690.ChromaticNumberEq 3 H) :
    HasColoring 3 (family H) ∧ ∀ j, j < 3 → ¬ HasColoring j (family H) := by
  refine ⟨(hasColoring_iff 3 H).mpr h.1, ?_⟩
  intro j hj hjcolor
  exact h.2 j hj ((hasColoring_iff j H).mp hjcolor)

/-- The submitted theorem implies the independently expressed full target. -/
theorem external_target : ∃ (n : Nat) (E : EdgeFamily n),
    ThreeUniform E ∧
    (HasColoring 3 E ∧ ∀ j, j < 3 → ¬ HasColoring j E) ∧
    Critical E ∧ DegreeAtLeastSeven E := by
  obtain ⟨n, H, hs, hu, hc, hcrit, hd⟩ :=
    JSP690.exists_three_uniform_three_chromatic_critical
  exact ⟨n, family H, three_uniform_bridge H hs hu,
    chromatic_number_bridge H hc, critical_bridge H hcrit, degree_bridge H hs hd⟩

#print axioms proper_iff
#print axioms family_selected_iff
#print axioms critical_bridge
#print axioms chromatic_number_bridge
#print axioms sorted_edge_injective
#print axioms three_uniform_bridge
#print axioms degree_bridge
#print axioms external_target

end AuditBridge
