## Submission type

- [ ] Mathematical solver information
- [x] Lean proof or formalization author information

This is an independent implementation of Ruiliang Li's published construction. Earlier complete formalizations exist, including [Issue #15](https://github.com/TheJustinSunPrize/awards/issues/15). **No first-formalization, priority, candidate-replacement, or award claim is made.** Maintainers may decline this contribution as duplicative.

## Problem

- **JSP-000690:** “Is there a three-uniform, three-chromatic-critical hypergraph with minimum degree at least seven?”
- [Current catalog entry](https://github.com/TheJustinSunPrize/awards/blob/bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2/problems/catalog-0601-0700.md#JSP-000690).
- Historical reference: [Erdős Problem 834](https://www.erdosproblems.com/834), citing Erdős, *Unsolved Problems* (1974), p. 282. That original 1974 page was not directly inspected. The JSP entry explicitly asks the chromatic interpretation.
- Primary mathematical solution: Ruiliang Li, [*On an Erdős–Lovász problem: 3-critical 3-graphs of minimum degree 7*, arXiv:2512.24850v1](https://arxiv.org/html/2512.24850v1), Theorems 1.2 and 4.1; Equation (5), Lemmas 4.2 and 4.4, and Appendix B Tables 1–2.
- This PR changes only JSP-000690's **Lean proof** and **Attribution basis** catalog fields. It preserves the mathematical source and leaves index, eligibility, candidate and award records to maintainers.
- Competition: 52 related records were found in the initial search. Earlier Issue #15 source compiled unchanged under Lean 4.32.0 with `[propext, Quot.sound]` and passed fresh kernel replay. That is a portability check from its advertised Lean 4.24.0, not a reproduction of its original pin. Related [PR #35](https://github.com/TheJustinSunPrize/awards/pull/35) and [Issue #157](https://github.com/TheJustinSunPrize/awards/issues/157) are also disclosed. The [competition report](https://github.com/ljhfafa/jsp-000690-lean/blob/main/verification/COMPETITION.md) records evidence and limits.
- This implementation supplies a short general proper-subhypergraph lemma and a separate full set-valued semantic bridge. These aid review; they do not establish a defect in earlier proofs or a basis for priority replacement.

## Formal statement

- Mathematical review evidence: the primary paper, [mathematical specification](https://github.com/ljhfafa/jsp-000690-lean/blob/16775f11a809a49fcd6822add9895eb104966994/MATHEMATICAL_SPEC.md), independent exhaustive computation, and the correspondence report below. Maintainer mathematical review is pending.
- [Formal statement and proof at selected commit](https://github.com/ljhfafa/jsp-000690-lean/blob/16775f11a809a49fcd6822add9895eb104966994/JSP690/Main.lean).
- Target: **`JSP690.exists_three_uniform_three_chromatic_critical`**.
- Statement origin: **independently proposed statement requiring maintainer review**, not a maintainer-approved reference statement.
- The theorem gives one finite simple hypergraph with exactly three distinct vertices per edge, literal chromatic number three, every proper subhypergraph two-colorable, and every vertex incident with at least seven distinct edges.
- The witness has nine vertices and 22 edges. Paper labels 1–9 become Lean values 0–8. All 512 binary assignments are covered through a proved function-to-tuple completeness lemma. The proof supplies an explicit three-coloring, every edge-deletion and vertex-deletion certificate, and a general argument covering simultaneous arbitrary vertex/edge deletion. It excludes palettes zero and one as well as two.
- Proper coloring is weak hypergraph coloring; deleting a vertex discards whole incident edges. No transversal-critical claim or edge-shrinking interpretation is used.
- The separate semantic harness restates edges as predicates, uses actual retained-vertex subtypes for subgraph colorings, proves exactly three distinct vertices in each edge, and proves seven injectively indexed distinct incident edge sets. `AuditBridge.external_target` derives the entire independent formulation from the submitted theorem without extra hypotheses.

## Proof submission

```json
[
  {
    "repository": "https://github.com/ljhfafa/jsp-000690-lean",
    "branch": "main",
    "commit": "16775f11a809a49fcd6822add9895eb104966994"
  }
]
```

- Source: `JSP690/Main.lean`; theorem `JSP690.exists_three_uniform_three_chromatic_critical`.
- The original personal repository belongs to submitting account **ljhfafa**. The complete proof commit was published on `main`; later reports do not change the proof source or pins.
- Definitions: `JSP690/Definitions.lean`; general arguments: `JSP690/General.lean`; construction: `JSP690/Construction.lean`.
- Verification entry: `verification/Check.lean`. Source data came directly from Li's paper. No earlier Lean implementation was copied into this proof.

## Reproduction

Lean **4.32.0** (`leanprover/lean4:v4.32.0`), bundled core/Std; **Mathlib not used, no external packages**. `lean-toolchain`, `lakefile.toml`, and the empty-package `lake-manifest.json` are pinned at the selected commit.

```sh
git clone https://github.com/ljhfafa/jsp-000690-lean.git
cd jsp-000690-lean
git checkout --detach 16775f11a809a49fcd6822add9895eb104966994
elan toolchain install leanprover/lean4:v4.32.0
lake build
lake env lean verification/Check.lean
python3 verification/python_verify.py
lake env leanchecker -v --fresh JSP690.Main
```

Actual final-target axiom output:

```text
'JSP690.exists_three_uniform_three_chromatic_critical' depends on axioms: [propext, Quot.sound]
```

All computational proof steps use ordinary `decide`; the non-two-colorability proof is a kernel-checked enumeration. No `sorry`, `admit`, custom proof-bypassing axiom, native-evaluation axiom, or hidden premise enters the target. Python is supporting evidence only. [Pinned build instructions](https://github.com/ljhfafa/jsp-000690-lean/blob/16775f11a809a49fcd6822add9895eb104966994/README.md).

## Pre-submission Lean verification

- Method: official `skills/lean-verify` workflow at awards commit `bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2`, executed on **proof commit `16775f11a809a49fcd6822add9895eb104966994`**, on 2026-09-23.
- Result: **technical verification passed**. A clean local clone passed a full build inside a network-disabled, credential-hidden macOS sandbox. Official preflight/prepare/run passed for all 12 proof targets and all nine separate semantic bridge targets; both runs reported `standard_axioms_only` and stable inputs. These mechanical results are distinguished from the explicit semantic review.
- Fresh `leanchecker` replay succeeded for `JSP690.Main` and the separately added semantic bridge. The bridge was an untracked audit harness in the isolated clone; submitted tracked sources were unchanged.
- Main target axioms: `[propext, Quot.sound]`. The external semantic target additionally uses the standard `Classical.choice` axiom.
- Limitations: `leanchecker` uses the original Lean kernel; no separate checker implementation was run. No exact Lean 4.32.0-compatible Lean4Lean ref was found in the checked official history. The semantic review was performed by Codex agents, including an agent that earlier contributed a general-lemma module; it is not independent human or organizer review. The original 1974 page was not directly inspected; the JSP statement and Li's primary paper were inspected.
- [Verification report](https://github.com/ljhfafa/jsp-000690-lean/blob/main/verification/VERIFICATION_REPORT.md), [correspondence](https://github.com/ljhfafa/jsp-000690-lean/blob/main/verification/STATEMENT_CORRESPONDENCE.md), [detailed semantic review](https://github.com/ljhfafa/jsp-000690-lean/blob/main/verification/statement-audit.md), and [audit harness](https://github.com/ljhfafa/jsp-000690-lean/blob/main/verification/AuditBridge.lean). These reports are later additions describing the immutable proof commit above, not a claim that the later documentation commit was the original proof snapshot.

## Attribution

- **Original mathematics: Ruiliang Li.** No mathematical-solver credit or mathematical discovery is claimed by this submitter.
- **Repository owner ljhfafa:** commissioned and directed the project, authorized publication, and owns the original repository. No manual proof authorship is asserted.
- **OpenAI Codex AI agents:** autonomously performed substantially all technical research, implementation, debugging, documentation, and verification under the owner's direction.
- **AI disclosure:** “OpenAI Codex autonomously performed substantially all technical research, implementation, debugging, and verification under the direction of the repository owner.”
- Separate Codex agents supplied computational and statement reviews; no independent human verifier is claimed. Account ownership is not presented as evidence of manual authorship. [Repository history](https://github.com/ljhfafa/jsp-000690-lean/commits/main/) and the [source/AI disclosure](https://github.com/ljhfafa/jsp-000690-lean/blob/16775f11a809a49fcd6822add9895eb104966994/README.md) document the actual roles for maintainer review.

## Submission checklist

- [x] I changed only the relevant catalog's Lean proof information and supporting attribution and supplied the applicable evidence.
- [x] The submitted result fully solves the original chromatic problem at the specified commit, without `sorry`, `admit`, or added unproved assumptions replacing proof steps.
- [x] This is the original repository for the commissioned AI-assisted contribution, owned by the submitting account; the selected commit is contained in the named branch. Statement correspondence, reproduction commands, all axiom dependencies, and the owner's limited role are disclosed. No manual authorship or first-proof priority is claimed.
- [x] This PR contains no Lean source files, archives, binaries, vendored dependencies, or private identity/contact/payment information.
