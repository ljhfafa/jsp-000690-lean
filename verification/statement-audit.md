# Specification and external semantic audit

Date: 2026-09-23. Reviewed proof commit:
`16775f11a809a49fcd6822add9895eb104966994` (proof A).
Scope: all five submitted Lean source files, including the final construction
and existence theorem, plus the separately added `verification/AuditBridge.lean`.

This is an internal second-pass AI review, not an independent human or prize
organizer assessment. The reviewing agent previously implemented
`JSP690/General.lean`. The audit harness independently states its semantic
predicates and challenges the final theorem, but it is not an independently
authored solution of the original mathematical problem.

**Conclusion:** no substantive specification weakening or proof gap was found.
The final theorem includes all required properties for one common witness.
A separate Lean theorem, `AuditBridge.external_target`, successfully derives
the entire target using ordinary predicate-valued edge sets and arbitrary
set-valued subgraphs. This review makes no novelty, priority, or prize-eligibility
claim. Earlier complete public formalizations are documented in `COMPETITION.md`.

## Required conjunction and construction

The final existence theorem asserts, for the same `n` and `H`:

1. `IsSimple H`.
2. `IsUniform 3 H`.
3. `ChromaticNumberEq 3 H`.
4. `ChromaticCritical H`.
5. `∀ v, 7 ≤ degree H v`.

`IsUniform 3 H` by itself states list length three, so it does not by itself
exclude repeated vertices. `ChromaticCritical H` by itself states the proper
subhypergraph condition, so it does not by itself assert that the original
hypergraph has chromatic number three. `Main.lean` supplies the full conjunction
and avoids both possible specification mistakes.

The final witness has nine vertices and 22 listed edges. The construction
module checks simplicity, uniformity, and degree lower bounds with ordinary
`decide`. It also exports exact degrees: vertex zero has degree ten and each
of the other eight vertices has degree seven. The final theorem references
this same construction for every conjunct.

## Edge sets, simplicity, and degree

An edge list is interpreted as the ordinary set of its members. Pairwise
strictly increasing `Fin n` values imply that its vertices are distinct.
The external harness proves `three_uniform_bridge`: sortedness together with
list length three gives exactly three pairwise distinct vertices whose equality
disjunction describes the corresponding set.

Increasing lists are canonical representatives of their vertex sets. This is
now machine-checked by `sorted_edge_injective`, which proves that two sorted
lists with equal member predicates are equal. Thus `H.Nodup`, combined with
sorted edges, excludes duplicate *sets*, not merely duplicate textual lists.
The outer list's order has no effect on coloring or incidence.

`degree H v` counts edge-list entries containing `v`. The external
`degree_bridge` does not leave this correspondence as an informal assertion.
It selects seven entries from the incident-edge list, uses its no-duplicates
property to distinguish the entries, and uses canonical-edge injectivity to
distinguish their underlying sets. Its conclusion is seven pairwise distinct
incident edge sets. It uses no degree counter in that conclusion.

Every finite simple hypergraph admits a list representation after relabeling
vertices by `Fin n`; the audit does not claim to formalize this universal
relabeling fact. The target is an existence statement, so the relevant checked
obligation is that the submitted witness yields a conventional hypergraph
with the asserted properties. The full external theorem establishes this.

## Coloring and chromatic number

`ProperColoring H c` requires an edge to contain vertices with different
colors. This is weak hypergraph coloring; it does not demand three different
colors on every triple. Differing colors already force the chosen vertices
to be different.

The harness independently defines proper coloring as the absence of an edge
on which all vertex colors agree. `proper_iff` proves its equivalence with the
submission's witness-pair definition, for any color type. `hasColoring_iff`
then transports arbitrary palette sizes.

The project definition `Colorable k H` quantifies over every function
`Fin n → Fin k`. The finite non-two-colorability argument does not restrict
this definition to a subset of functions. `tupleColor_complete` takes an
arbitrary `Fin 9 → Fin 2` coloring and proves it equals its nine-coordinate
representation. The coordinate case split exhausts all nine vertices;
`no_tuple_coloring` quantifies over all nine `Fin 2` coordinates. The final
`construction_not_two_colorable` applies that completeness theorem before
using the exhaustive failure proof.

`ChromaticNumberEq 3 H` asserts three-colorability and excludes every smaller
natural palette, including zero and one. `colorable_of_le` embeds `Fin a`
into `Fin b` by preserving the underlying value, including the vacuous
`a = 0` case. `chromaticNumberEq_three` uses this for every `j < 3`.
`chromatic_number_bridge` transports the literal least-color assertion to
the independently defined set-valued coloring predicate.

## Every proper subhypergraph

`IsSubhypergraph H W F` requires each retained edge to belong to the original
family and each vertex of every retained edge to belong to `W`. It removes
whole edges; it does not replace edges by intersections with `W`. Traces,
contractions, and minors are different operations.

Properness means either some original vertex is absent or some original edge
is absent. These are precisely the two ways an ordinary subhypergraph of this
fixed finite vertex set can be proper. If a vertex is missing, all retained
edges avoid that vertex; if an edge is missing, every retained edge differs
from it. `chromaticCritical_of_deletions` proves those inclusions and applies
colorability monotonicity. Hence the final theorem covers simultaneous
removal of any number of vertices and edges, including empty subhypergraphs.
It is not restricted to the deletion certificates individually.

The construction explicitly checks one certificate for every original edge
and every original vertex. `edge_certificates_checked` quantifies over all
members of the actual construction. Its proper-coloring conclusion is for
deletion of that quantified edge, so the later proof's disregard of the
certificate pair's first-component equality does not introduce a gap.
`vertex_certificates_checked` directly quantifies over all nine vertices.

Allowing the list `F` to reorder or repeat retained edges does not weaken
criticality: those encodings impose the same constraints. Reordering or
repeating edges alone does not make a graph proper, because properness checks
actual missing vertices or missing edges.

The external harness goes beyond this list argument. Its edge family is an
arbitrary predicate on vertex predicates. `family_selected_iff` proves that
every arbitrary subfamily of the witness's edge sets is represented by a
selection from its original edge list. This uses classical decidability to
select the finite subfamily; it assumes no computable presentation of the
user's predicates.

`critical_bridge` then quantifies over arbitrary retained-vertex predicates
and arbitrary set-valued edge subfamilies, checks the usual containment,
support, and properness conditions, and produces a two-coloring on the actual
retained-vertex subtype `{v // W v}`. Thus the bridge tests both the set/list
boundary and the ambient/retained-vertex boundary.

The reverse extension of a subtype coloring to ambient vertices requires a
nonempty palette, which `Fin 2` supplies. No unrestricted claim is made for
palette zero: an empty retained vertex set can admit an empty coloring even
when the ambient type cannot. The bridge uses only restriction of the
provided ambient two-coloring, so this boundary is harmless here.

Together with chromatic number three, two-colorability of every proper
subhypergraph gives the required strict decrease of chromatic number. It
does not demand chromatic number exactly two for the empty subhypergraph.

## Actual external challenge and validation

`verification/AuditBridge.lean` imports the final `JSP690.Main` and defines:

- Edges as predicates `Fin n → Prop`.
- Edge families as predicates on these vertex predicates.
- Three-uniformity by three distinct vertices describing the edge exactly.
- Degree at least seven by seven injectively indexed incident edge sets.
- Proper coloring by the prohibition of monochromatic edges.
- Criticality for every proper arbitrary set-valued subgraph, with colors on
  its retained vertices.

Its `external_target` derives the complete conjunction directly from
`JSP690.exists_three_uniform_three_chromatic_critical`. None of its target
predicates aliases the project's coloring, degree, or subgraph predicates.
There are no additional hypotheses in `external_target`.

Actual command, run from the proof repository with the official Lean binary
directory first on `PATH`:

```text
lake env lean verification/AuditBridge.lean
```

Result: exit status **0**, under Lean 4.32.0, release commit
`8c9756b28d64dab099da31a4c09229a9e6a2ef35`, arm64-apple-darwin24.6.0.
This command elaborated and kernel-checked the new harness against the local
built project modules. It is not itself a claim of a clean rebuild from a new
checkout; the separate reproduction report records that stronger check.

Actual axiom output:

| Declaration | Axioms |
|---|---|
| `AuditBridge.proper_iff` | `propext`, `Classical.choice`, `Quot.sound` |
| `AuditBridge.family_selected_iff` | `propext`, `Classical.choice`, `Quot.sound` |
| `AuditBridge.critical_bridge` | `propext`, `Classical.choice`, `Quot.sound` |
| `AuditBridge.chromatic_number_bridge` | `propext`, `Classical.choice`, `Quot.sound` |
| `AuditBridge.sorted_edge_injective` | `propext`, `Quot.sound` |
| `AuditBridge.three_uniform_bridge` | `propext`, `Quot.sound` |
| `AuditBridge.degree_bridge` | `propext`, `Quot.sound` |
| `AuditBridge.external_target` | `propext`, `Classical.choice`, `Quot.sound` |

The submitted generic module was also actually built with
`lake build +JSP690.General`. Its three monotonicity/palette lemmas use no
axioms, and its chromatic-number and criticality lemmas use only `propext`
and `Quot.sound`.

Source review of all submitted Lean files and the harness found no `sorry`,
`admit`, custom `axiom`, `native_decide`, `unsafe`, `run_cmd`, or `run_tac`.
The construction's increased recursion bound and unlimited heartbeat setting
permit the ordinary exhaustive `decide` proof to elaborate; they do not add an
axiom or bypass kernel checking. Failed intermediate harness drafts were fixed
before the successful run; no unsuccessful draft is represented as validation.
No separately run mutation/negative-control test is claimed.

## Audited source identities

SHA-256 hashes at review completion:

```text
254f1897c014dc62bfc0656db3fd3f3ddba57aded53fd2206097e9be1732e183  JSP690.lean
3e09061bed18bed691d297582c3893c1e723c2c98dfcb2463446c98ca9f4e572  JSP690/Definitions.lean
53009cd81968b76cbd5953c5c5b65e4bcd285ee948d0a728db83304aad859064  JSP690/General.lean
637855ce2ae072ac618f1b87dbae0019eed63cb91930923a15cb907d709b6cb7  JSP690/Construction.lean
8d0c489fb07e7a9a3fcfb57e0fc46405b945588c57af2b533227abba987a9997  JSP690/Main.lean
f9cd54adccb1e807a00d1819e49d71942e3978ddbf2cbe91acf90649b32a7072  verification/AuditBridge.lean
```

The audit added the harness and this report without editing proof-A source
files. Organizer acceptance and first-formalization priority remain external
questions that successful kernel verification alone cannot establish.
