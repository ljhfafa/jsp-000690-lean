# JSP-000690: a complete Lean formalization

> Is there a three-uniform, three-chromatic-critical hypergraph with minimum degree at least seven?

**Yes, in the chromatic sense specified by the JSP catalog.** This repository independently formalizes Ruiliang Li's explicit 9-vertex, 22-edge construction in Lean. It proves simplicity, three-uniformity, chromatic number exactly three, two-colorability of every proper subhypergraph (allowing vertex and edge removal together), and minimum degree seven.

The original mathematics is due to **Ruiliang Li**, *On an Erdős–Lovász problem: 3-critical 3-graphs of minimum degree 7*, [arXiv:2512.24850v1](https://arxiv.org/html/2512.24850v1): Equation (5), Lemmas 4.2 and 4.4, and Appendix B Tables 1 and 2. This does not claim the different transversal-critical interpretation of the historical problem.

## Formal result

- Target: `JSP690.exists_three_uniform_three_chromatic_critical`
- Source: [`JSP690/Main.lean`](JSP690/Main.lean)
- Definitions: [`JSP690/Definitions.lean`](JSP690/Definitions.lean)
- Construction and certificates: [`JSP690/Construction.lean`](JSP690/Construction.lean)
- Full specification: [`MATHEMATICAL_SPEC.md`](MATHEMATICAL_SPEC.md)

```lean
∃ (n : Nat) (H : JSP690.Hypergraph n),
  JSP690.IsSimple H ∧ JSP690.IsUniform 3 H ∧
  JSP690.ChromaticNumberEq 3 H ∧ JSP690.ChromaticCritical H ∧
  (∀ v : Fin n, 7 ≤ JSP690.degree H v)
```

## Reproduce

Pinned toolchain: **Lean 4.32.0**, including its bundled `Std` library. **Mathlib: not used. External dependencies: none.** `lean-toolchain` and `lake-manifest.json` are committed.

In a fresh checkout, with the pinned Lean toolchain installed:

```sh
lake build
lake env lean verification/Check.lean
python3 verification/python_verify.py
lake env leanchecker -v --fresh JSP690.Main
```

All finite certificates and all 512 binary assignments are checked with ordinary `decide`, producing proof terms checked by Lean's kernel. `tupleColor_complete` proves that every binary coloring is covered. General lemmas transfer deletion certificates to every proper subhypergraph. No native computation is trusted as a proof.

The fixed proof commit is **`16775f11a809a49fcd6822add9895eb104966994`**. Its actual axiom audit returned **`[propext, Quot.sound]`**. There are no additional assumptions or proof-bypassing axioms. Python is supporting evidence only.

**Technical verification passed:** credential-isolated clean build, official `lean-verify` automation for 12 proof targets, 9 separately expressed semantic bridge targets, and fresh kernel replay of both the main proof and bridge. The bridge adds only the standard `Classical.choice` axiom. This is a self-verification result, not prize-organizer approval. A separate checker implementation was not run: no exact Lean 4.32.0-compatible release/ref was identified in the checked Lean4Lean history. Fresh `leanchecker` replay uses Lean's original kernel.

- [Full verification report](verification/VERIFICATION_REPORT.md)
- [Statement correspondence](verification/STATEMENT_CORRESPONDENCE.md)
- [Detailed semantic review](verification/statement-audit.md)
- [Independent set-valued challenge](verification/AuditBridge.lean)
- [Competition audit](verification/COMPETITION.md)

Reports and the challenge were added after proof commit A. The submitted proof sources and toolchain pins remain unchanged.

## Competition and attribution

Earlier complete public formalizations of JSP-000690 exist. This repository makes **no first-formalization, priority, acceptance, or award claim**. The catalog's earlier “Lean proof: No” label was not treated as evidence that no competing proof existed. Broad research found no verified better unoccupied finite candidate; this project retains the owner's original candidate as an independently auditable technical contribution.

**AI disclosure:** OpenAI Codex autonomously performed substantially all technical research, implementation, debugging, and verification under the direction of the repository owner. Repository owner [ljhfafa](https://github.com/ljhfafa) commissioned and directed the project. No manual proof authorship or mathematical discovery by the owner is claimed. The source construction and certificates were transcribed from Li's paper, and no earlier Lean proof was copied into this implementation. Separate Codex agents provided mathematical and statement reviews; they are not independent human reviewers.

Public submission and any later award remain subject to the official rules and maintainer review. A claim must not be filed before the contribution PR is merged.
