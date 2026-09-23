# Mathematical specification for JSP-000690

This document fixes the mathematical meaning of the statement and its correspondence with `JSP690/Definitions.lean` and `JSP690/General.lean`. It documents a formalization of an existing construction; it makes no claim of mathematical discovery or first formalization.

## Target and source

The [official JSP-000690 entry](https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0601-0700.md#JSP-000690) asks for a three-uniform, three-chromatic-critical hypergraph of minimum degree at least seven. Its cited solution is Ruiliang Li, *On an Erdős–Lovász problem: 3-critical 3-graphs of minimum degree 7*, [arXiv:2512.24850v1](https://arxiv.org/html/2512.24850v1), posted 31 December 2025.

The source locations used are:

| Mathematical data or convention | Source location |
| --- | --- |
| Weak coloring, edge and induced vertex deletion | Sections 2.1–2.2 |
| Chromatic criticality | Definition 2.1 |
| Positive existence result | Theorems 1.2 and 4.1 |
| All 22 edges on nine vertices | Equation (5), Appendix A |
| Degree sequence | Lemma 4.2 |
| No proper 2-coloring | Lemma 4.3 |
| A proper 3-coloring | Lemma 4.4 |
| Edge-deletion color certificates | Proposition 4.5; Appendix B.1, Table 1 |
| Vertex-deletion color certificates | Proposition 4.6; Appendix B.2, Table 2 |

The formal target is the existence of a finite nonempty vertex set and an edge family `H` satisfying the conjunction

```text
IsSimple H
IsUniform 3 H
ChromaticNumberEq 3 H
ChromaticCritical H
∀ v, 7 ≤ degree H v.
```

Our witness has nine vertices. `ChromaticCritical` is deliberately the proper-subhypergraph clause alone; the separate `ChromaticNumberEq 3 H` conjunct is necessary to express three-chromatic criticality.

## Representation and exact semantics

The vertex type is `Fin n`. An edge is a `List (Fin n)` and a hypergraph is a list of edges. `IsSimple` requires that no edge is repeated and that each edge's vertex values are strictly increasing. Therefore each list represents an unambiguous finite set, with no repeated vertices. It does **not** require two edges to intersect in at most one vertex; that different property is sometimes called linearity. `IsUniform 3 H` requires every edge list to have length three. In conjunction with `IsSimple`, each edge therefore contains exactly three distinct vertices and is nonempty.

`degree H v` counts entries of the edge list that contain `v`. Since `H` has no repeated edges, this is precisely the usual number of incident edges. Thus `∀ v, 7 ≤ degree H v` asserts minimum degree at least seven and also excludes isolated vertices.

`ProperColoring H c` says that each edge contains two vertices assigned different colors. This is weak proper hypergraph coloring: it forbids a monochromatic edge and does not require three different colors within each triple. `Colorable k H` asserts such a coloring into `Fin k`.

`ChromaticNumberEq 3 H` asserts three-colorability and non-colorability with every smaller natural-number palette. The general theorem `chromaticNumberEq_three` obtains this from three-colorability and failure of two-colorability. Its proof uses `colorable_of_le` to include a smaller palette into `Fin 2`; it explicitly covers the possibilities zero and one, rather than silently treating “not 2-colorable” as the definition of chromatic number three.

## All proper subhypergraphs

For a vertex predicate `W : Fin n → Prop` and an edge family `F`, `IsSubhypergraph H W F` requires every edge of `F` to be an original edge of `H`, with all its vertices in `W`. `IsProperSubhypergraph` additionally requires that some vertex is absent from `W` or some original edge is absent from `F`. Edges are retained whole; removing a vertex never shortens an incident edge.

`ChromaticCritical H` quantifies over **every** such proper subhypergraph, not only subhypergraphs obtained by one deletion. This includes deletion of multiple vertices, multiple edges, or both. The representation also admits repeated copies of a retained edge in `F`; this harmless extra generality does not change colorability and therefore does not weaken the assertion for ordinary simple subhypergraphs.

Colorings are functions on the ambient `Fin n`, even for a subhypergraph on `W`. This is equivalent to the ordinary coloring of the retained vertices with two colors: restriction gives one direction; extension by color zero outside `W` gives the other. Every edge is contained in `W`, so outside colors are irrelevant.

`deleteEdge H e` filters out `e`. `deleteVertex H v` filters out every edge containing `v`. The theorem `chromaticCritical_of_deletions` proves the full proper-subhypergraph condition from all single-edge and single-vertex certificates:

1. If a vertex `v` is missing, no retained edge contains it. Every edge of `F` is consequently in `deleteVertex H v`.
2. Otherwise a missing edge `e` supplies `F ⊆ deleteEdge H e`.
3. `colorable_mono`, proved using `properColoring_mono`, restricts the relevant certificate to `F`.

This is an actual general proof of the universal subhypergraph condition. It does not rely on a finite test of only some subhypergraphs. With positive degree, edge criticality also implies vertex criticality by choosing an incident edge and restricting its deletion coloring; the project nevertheless verifies both source certificate families explicitly.

## Labels and construction data

The paper and [verification/construction.json](verification/construction.json) use labels **1 through 9**. Lean's `Fin 9` uses values **0 through 8**. The correspondence is exactly

```text
source label i  ↔  Lean vertex with value i - 1.
```

The same subtraction must be applied to every vertex of every edge and every coloring class. Source edge `123`, for example, becomes Lean edge `[0,1,2]`; it must not become `[1,2,3]`. Edge order is the order in equation (5). The source degree sequence becomes `(10,7,7,7,7,7,7,7,7)` in Lean vertex order 0 through 8.

All source edges are:

```text
123 129 138 146 148 149 157 158 159 167
236 237 249 259 267 348 358 367 468 469 578 579
```

The source three-color classes are `{1,2,4,5}`, `{3,6,8,9}`, and `{7}`. Equivalently, the Lean classes are `{0,1,3,4}`, `{2,5,7,8}`, and `{6}`. Palette labels themselves can be shifted from the paper's 1,2,3 to `Fin 3` values 0,1,2 without affecting properness. For the binary certificates, the JSON's `blue_vertices` receive one and every other retained vertex receives zero.

## Transversal ambiguity and scope boundary

The [Erdős Problem 834 page](https://www.erdosproblems.com/834) distinguishes chromatic criticality from the historical hitting-set interpretation, and identifies the older source as *Unsolved Problems* (1974), pp. 278–297, specifically p. 282. That original page has not been directly inspected here; we do not invent an exact original definition.

The alternative interpretation requires transversal number three and a decrease after every edge deletion. Li's Theorem 1.1 gives a negative degree result for that different question. This project's positive construction addresses the **chromatic** question named by JSP-000690. In fact our independent enumeration finds transversal number five for this witness. No transversal theorem is claimed as part of the Lean target.

## Independent Python verification and provenance

The construction and 31 deletion certificates were transcribed directly from Li's paper. [verification/python_verify.py](verification/python_verify.py) was independently written in standard Python using integer masks for vertex subsets. It does not import earlier Lean submissions and does not execute or copy the paper's Appendix C verifier. The paper remains the mathematical source; independent computation supplies an additional check rather than a new mathematical discovery.

The actual verification command, run from the proof repository on 2026-09-23, was:

```sh
python3 verification/python_verify.py > verification/python-results.txt
```

It exited successfully under Python 3.11.9. The [recorded output](verification/python-results.txt) reports:

- Nine vertices, 22 distinct triples, the degree sequence above and incidence sum 66.
- All 512 full binary colorings tested, with zero proper colorings.
- The source proper three-coloring verified.
- All 22 source edge certificates and all nine source vertex certificates verified; exhaustive coloring counts after each deletion are also recorded.
- All 511 proper induced vertex subhypergraphs checked through 19,171 binary colorings. This extra check does not claim enumeration of arbitrary edge subsets.

The checker raises explicit exceptions for failed checks, so `python -O` does not suppress them. Python success is **not** a substitute for Lean kernel verification; the Lean build and axiom audit must be reported separately by the project.

SHA-256 hashes from the actual verified files:

| File | SHA-256 |
| --- | --- |
| `verification/construction.json` | `f53f519bdededc113db0b3b100f2636867d04355696bbfe697de3c17dbc560c8` |
| `verification/python_verify.py` | `fc882a961ae3663261b74aecc67ecc2cf514bcd941facfc9e584109fa818fc8d` |
| `verification/python-results.txt` | `e0e7a0e1c960e62f448c6a9a4fe9bb2148091ccb20949787b6c92b8ad410b794` |

The definitions examined for this document had SHA-256 `3e09061bed18bed691d297582c3893c1e723c2c98dfcb2463446c98ca9f4e572` (`Definitions.lean`) and `53009cd81968b76cbd5953c5c5b65e4bcd285ee948d0a728db83304aad859064` (`General.lean`). Recompute hashes if those files change.

OpenAI Codex AI agents performed the source research, transcription, independent Python implementation, and this specification under the repository owner's direction. The owner's role was commissioning and directing the work; no manual proof authorship or mathematical discovery is attributed to the owner. Earlier public formalizations were considered for competition assessment, but their Lean code was not used to produce the data, checker, or mathematical specification documented here.
