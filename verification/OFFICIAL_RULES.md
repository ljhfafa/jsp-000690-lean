# Official rules snapshot — 2026-09-23

Repository: https://github.com/TheJustinSunPrize/awards

Commit: `bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2` (main at initial clone).

Official website: https://www.hejustinsun.com/prize, read on the same date.

## Documents read

README.md; CONTRIBUTING.md; docs/award-process.md; docs/verification.md;
docs/attribution.md; docs/problem-bank-sources.md; .github/PULL_REQUEST_TEMPLATE.md;
.github/ISSUE_TEMPLATE/claim-award.yml; problem-bank reading conventions and catalog;
candidates/README.md; awards/README.md; skills/lean-verify/SKILL.md;
all five references (input-routing, reproduction, automation, statement-audit,
report-template) and assets/targets.example.json.

## Operational conclusions

- Only complete solutions and formalizations of the original problem qualify.
- Mathematical correctness review is distinct from Lean checking; registration of
  the mathematical solver is not a prerequisite for Lean submission.
- Proof source must be in the submitter's original personal/organization repository,
  with branch, full SHA, theorem, source, pinned build and all axiom dependencies.
- Awards PR changes only the relevant catalog solver/Lean/attribution/publication
  fields. Maintainers reconcile index and eligibility fields. No Lean source in awards.
- Earlier PR creation is not decisive. Verified complete selected proof commits and
  independently checkable public history matter. No timestamp manipulation.
- Self-check reports are optional but must accurately identify the checked proof
  commit. Evidence can be committed later without pretending the newer commit was checked.
- The official lean-verify workflow distinguishes semantic correspondence, clean
  builds, axiom audits, kernel replay and independent external checking. Native
  evaluation has additional trust, not automatic equivalence to kernel checking.
- Prefer kernel-checked proofs with only standard foundational axioms. No proof
  substitutes, weakened statements, missing cases, or unproved premises.
- A Lean claim requires the contribution PR to have merged. Do not submit early.
- Applicant identity email, public review, written confirmation and maintainer award
  decision remain separate; submission/merge does not establish any award.
- Private contacts, identity and payment material must remain out of public records.
- Credit original mathematics separately; disclose Codex's autonomous technical role.

## Candidate at initial snapshot

JSP-000690, catalog-0601-0700.md, lines 1523–1538, says Solved / Lean proof No.
Source: Ruiliang Li, arXiv:2512.24850 (2025). This is not evidence of absence of
pending or external formalizations. Competition investigation is complete; see COMPETITION.md. Earlier complete proofs exist.

## Verification skill

The user explicitly required this skill and its dependencies. Its verification
workflow is being applied to fixed proof snapshots; implementation and submission
are independently authorized by the user's broader request. The skill's default
read-only verification scope does not prohibit that separate implementation work.

## Final rule revision recheck
GitHub commits/main API rechecked during final preparation on 2026-09-23; SHA bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2. Same as the rules snapshot above.
