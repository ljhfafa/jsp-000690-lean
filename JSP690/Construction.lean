import JSP690.General

/-!
# Li's explicit construction
Vertices 0–8 here correspond to vertices 1–9 in arXiv:2512.24850v1.
The edge list is Equation (5); certificates are Tables 1 and 2.
All finite computations below produce ordinary kernel-checked proof terms.
-/
namespace JSP690

abbrev Vertex := Fin 9

def construction : Hypergraph 9 :=
  [[0, 1, 2],
   [0, 1, 8],
   [0, 2, 7],
   [0, 3, 5],
   [0, 3, 7],
   [0, 3, 8],
   [0, 4, 6],
   [0, 4, 7],
   [0, 4, 8],
   [0, 5, 6],
   [1, 2, 5],
   [1, 2, 6],
   [1, 3, 8],
   [1, 4, 8],
   [1, 5, 6],
   [2, 3, 7],
   [2, 4, 7],
   [2, 5, 6],
   [3, 5, 7],
   [3, 5, 8],
   [4, 6, 7],
   [4, 6, 8]]

theorem construction_simple : IsSimple construction := by
  unfold IsSimple
  decide

theorem construction_uniform : IsUniform 3 construction := by
  unfold IsUniform
  decide

theorem construction_degrees :
    ∀ v : Vertex, degree construction v = if v = 0 then 10 else 7 := by decide

theorem construction_min_degree : ∀ v : Vertex, 7 ≤ degree construction v := by decide

/-- A binary coloring specified by its blue vertices. -/
def binaryColor (blue : List Vertex) (v : Vertex) : Fin 2 :=
  if v ∈ blue then 1 else 0

/-- The three color classes from Lemma 4.4. -/
def threeColor (v : Vertex) : Fin 3 :=
  if v ∈ [0, 1, 3, 4] then 0 else if v = 6 then 2 else 1

theorem construction_three_colorable : Colorable 3 construction :=
  ⟨threeColor, by unfold ProperColoring; decide⟩

/-- Exhaustive nine-coordinate representation of an arbitrary coloring. -/
def tupleColor (x0 x1 x2 x3 x4 x5 x6 x7 x8 : Fin 2) (v : Vertex) : Fin 2 :=
  match v.val with
  | 0 => x0 | 1 => x1 | 2 => x2 | 3 => x3 | 4 => x4
  | 5 => x5 | 6 => x6 | 7 => x7 | _ => x8

theorem tupleColor_complete (c : Vertex → Fin 2) :
    tupleColor (c 0) (c 1) (c 2) (c 3) (c 4) (c 5) (c 6) (c 7) (c 8) = c := by
  funext v
  obtain ⟨v, hv⟩ := v
  have h : v = 0 ∨ v = 1 ∨ v = 2 ∨ v = 3 ∨ v = 4 ∨ v = 5 ∨ v = 6 ∨ v = 7 ∨ v = 8 := by omega
  rcases h with h | h | h | h | h | h | h | h | h <;> subst v <;> rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- All 2^9 assignments fail; no restriction on binary colorings is assumed. -/
theorem no_tuple_coloring : ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Fin 2,
    ¬ ProperColoring construction (tupleColor x0 x1 x2 x3 x4 x5 x6 x7 x8) := by
  unfold ProperColoring
  decide

theorem construction_not_two_colorable : ¬ Colorable 2 construction := by
  rintro ⟨c, hc⟩
  have h := no_tuple_coloring (c 0) (c 1) (c 2) (c 3) (c 4) (c 5) (c 6) (c 7) (c 8)
  rw [tupleColor_complete] at h
  exact h hc

/-- Table 1, preserving the same ordering as the edge list. -/
def edgeCertificates : List (Edge 9 × List Vertex) :=
  [([0, 1, 2], [5, 6, 7, 8]),
   ([0, 1, 8], [2, 3, 4, 5]),
   ([0, 2, 7], [1, 3, 4, 5]),
   ([0, 3, 5], [1, 6, 7, 8]),
   ([0, 3, 7], [2, 4, 5, 8]),
   ([0, 3, 8], [1, 4, 5, 7]),
   ([0, 4, 6], [1, 5, 7, 8]),
   ([0, 4, 7], [2, 3, 6, 8]),
   ([0, 4, 8], [1, 3, 6, 7]),
   ([0, 5, 6], [1, 2, 3, 4]),
   ([1, 2, 5], [0, 6, 7, 8]),
   ([1, 2, 6], [0, 5, 7, 8]),
   ([1, 3, 8], [0, 2, 4, 5]),
   ([1, 4, 8], [0, 2, 3, 6]),
   ([1, 5, 6], [0, 2, 3, 4]),
   ([2, 3, 7], [0, 1, 4, 5]),
   ([2, 4, 7], [0, 1, 3, 6]),
   ([2, 5, 6], [0, 1, 3, 4]),
   ([3, 5, 7], [0, 2, 6, 8]),
   ([3, 5, 8], [0, 1, 6, 7]),
   ([4, 6, 7], [0, 2, 5, 8]),
   ([4, 6, 8], [0, 1, 5, 7])]

/-- Each edge has an explicitly checked deletion certificate. -/
theorem edge_certificates_checked :
    ∀ e ∈ construction, ∃ cert ∈ edgeCertificates,
      cert.1 = e ∧ ProperColoring (deleteEdge construction e) (binaryColor cert.2) := by
  unfold ProperColoring
  decide

theorem construction_edge_critical :
    ∀ e ∈ construction, Colorable 2 (deleteEdge construction e) := by
  intro e he
  obtain ⟨cert, _, _, hc⟩ := edge_certificates_checked e he
  exact ⟨binaryColor cert.2, hc⟩

/-- Table 2; the color assigned to the deleted vertex is immaterial. -/
def vertexCertificate (v : Vertex) : List Vertex :=
  match v.val with
  | 0 => [1, 2, 3, 4]
  | 1 => [0, 2, 3, 4]
  | 2 => [0, 1, 3, 4]
  | 3 => [0, 1, 4, 5]
  | 4 => [0, 1, 3, 6]
  | 5 => [0, 1, 3, 4]
  | 6 => [0, 1, 3, 4]
  | 7 => [0, 1, 3, 6]
  | _ => [0, 1, 5, 7]

theorem vertex_certificates_checked : ∀ v : Vertex,
    ProperColoring (deleteVertex construction v) (binaryColor (vertexCertificate v)) := by
  unfold ProperColoring
  decide

theorem construction_vertex_critical :
    ∀ v : Vertex, Colorable 2 (deleteVertex construction v) := by
  intro v
  exact ⟨binaryColor (vertexCertificate v), vertex_certificates_checked v⟩

theorem construction_chromatic_number : ChromaticNumberEq 3 construction :=
  chromaticNumberEq_three construction_three_colorable construction_not_two_colorable

theorem construction_critical : ChromaticCritical construction :=
  chromaticCritical_of_deletions construction_edge_critical construction_vertex_critical

end JSP690
