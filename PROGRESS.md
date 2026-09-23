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

## Completed verification and publication
- Complete proof A: 16775f11a809a49fcd6822add9895eb104966994.
- Report B: 6bf387b9a8ff779090453aaad181170fcd782f43.
- Credential-isolated clean clone and full build passed; official audit.py checked
  12 proof targets and 9 semantic bridge targets, standard_axioms_only, stable inputs.
- Fresh replay passed: Main 58.56s; AuditBridge 56.15s. Main axioms propext/Quot.sound;
  bridge additionally Classical.choice. All 164 retained evidence hashes verified.
- Independent predicate-edge semantics derives exactly3 distinct vertices, 7 distinct
  incident sets, exactχ3 and every proper subgraph on actual retained vertices.
- No independent external checker run; exact Lean4Lean4.32.0 compatibility absent.
- Public original repository: https://github.com/ljhfafa/jsp-000690-lean , branch main.
- Proof A and report B pushed. GitHub API confirmed A is ancestor of public main.
- Awards catalog-only commit: eafd63361cef854bcf9bd1ff18ad79f893c6d6b9,
  branch codex/jsp-000690-independent-lean on ljhfafa/awards.
- Official PR created: https://github.com/TheJustinSunPrize/awards/pull/4233 .
  No claim issue has been filed. PR not yet merged at creation.
- Intermittent Git network timeout resolved with a verified GitHub IP for that
  command only; TLS verification remained enabled. No global network setting changed.

## Next allowed action
Await maintainer review. Respond to concrete review requests against the fixed proof.
If and only if the contribution PR is merged and current rules/attribution/priority
permit a claim, refresh records and complete the prepared claim. Any owner-only
identity, contact, payment, tax or legal action remains unfilled. Do not claim an
award, eligibility or first-formalization priority from successful technical checks.

## Git and recovery
Proof A and report B are immutable published checkpoints. This later checkpoint records
actual submission status and complete PR text, leaving all proof sources and pins
unchanged. Preserve original timestamps and public history; never amend for priority.

## Resume
Inspect git status/log, this file, README and Lean tree, then run lake build with the
pinned toolchain. Continue current work; do not restart or discard source.
