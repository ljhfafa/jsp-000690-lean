# Progress

## Objective and problem
Independently formalize Li's published construction answering JSP-000690, with
complete chromatic criticality and a reproducible kernel-checked proof.

## Source and rules
Li, arXiv:2512.24850v1. Official rules commit
bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2, read 2026-09-23.

## Competition and selection
Earlier substantive proofs of JSP-000690 exist. A broad investigation of potential
replacements found earlier proofs for the tractable alternatives, and no verified
better opportunity. Retaining the owner's first candidate for an independent,
fully audited technical result; do not claim originality or priority. Official
acceptance and award prospects are separate and may be defeated by earlier sources.

## Architecture
Lean core/Std; finite vertices; canonical sorted edge lists; explicit certificates;
ordinary `decide` and kernel proof terms. No native evaluation trust assumption.
Final target: `JSP690.exists_three_uniform_three_chromatic_critical`.

## Completed
- Initialized independent Git project, pinned official Lean 4.32.0 and empty external-dependency lockfile.
- Transcribed all edges and certificates from the primary paper; independently verified Python enumeration.
- Implemented generic coloring monotonicity, exact chromatic number, and every-proper-subhypergraph bridge.
- Proved all concrete properties and final existence theorem; actual default `lake build` passed (7 jobs).
- Executed `verification/Check.lean`; final theorem axioms `[propext, Quot.sound]`.
- Added mathematical specification, source attribution, and honest AI disclosure.

## Fixed-commit verification and publication
- Complete immutable proof A: 16775f11a809a49fcd6822add9895eb104966994.
- Strict credential-isolated clean clone and full build passed.
- Official audit.py preflight/prepare/run passed: 12 proof targets and 9 semantic
  bridge targets, standard_axioms_only, stable tracked inputs.
- Fresh Lean kernel replay passed for Main (58.56s) and semantic bridge (56.15s).
- Full external semantic formulation proved from A: actual edge sets, three distinct
  vertices, seven distinct incident sets, exact χ3, all proper retained-vertex subgraphs.
- Main axioms [propext, Quot.sound]; semantic bridge also Classical.choice.
- No separate checker implementation run; Lean4Lean exact4.32.0 ref not identified.
- GitHub owner authenticated as ljhfafa; original public repository created and A
  pushed to main: https://github.com/ljhfafa/jsp-000690-lean . Remote SHA confirmed.
- Awards fork https://github.com/ljhfafa/awards created. Catalog-only patch on local
  codex/jsp-000690-independent-lean branch; PR submission next after report checkpoint B.

## Next
Commit verification report/evidence and correspondence as report B; preserve A proof
sources unchanged. Push B, pin report links in the PR, commit and push the catalog-only
branch, create real PR, inspect status, and record actual URL. Do not file an award
claim before merge. Prepared claim is not an assertion of eligibility or priority.

## Git
Proof initial d03ea06; complete proof A 16775f11a809a49fcd6822add9895eb104966994
published on main. Report checkpoint pending. Do not amend or backdate public history.

## Resume
Inspect git status/log, this file, README and Lean tree, then run lake build with the
pinned toolchain. Continue current work; do not restart or discard source.
