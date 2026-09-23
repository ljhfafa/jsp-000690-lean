# Award claim preparation — JSP-000690

**LOCAL DRAFT ONLY. NOT SUBMITTED. DO NOT FILE NOW.** Contribution [PR #4233](https://github.com/TheJustinSunPrize/awards/pull/4233) has been opened but has not merged. The public original repository is https://github.com/ljhfafa/jsp-000690-lean and the authenticated submitting account is ljhfafa. An earlier complete Lean proof in [Issue #15](https://github.com/TheJustinSunPrize/awards/issues/15) has been successfully replayed. This project makes no priority or award-entitlement claim. A later independent proof does not by itself establish entitlement to the formalization award.

Prepared from the official [claim form](https://github.com/TheJustinSunPrize/awards/blob/bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2/.github/ISSUE_TEMPLATE/claim-award.yml), [contribution rules](https://github.com/TheJustinSunPrize/awards/blob/bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2/CONTRIBUTING.md), and [award process](https://github.com/TheJustinSunPrize/awards/blob/bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2/docs/award-process.md), read on 2026-09-23. The current live rules and records must be checked again before any future action.

## Status and conditions

The rules require a merged contribution PR for a Lean claim; a pending PR or a proof repository URL cannot replace it. The recorded-solver exception does not apply to this Lean contribution. Even a merged PR is not award approval. Maintainers must resolve contribution attribution and the known prior proof, verify the proof and underlying mathematics, register any accepted candidate, conduct the applicable public review, and obtain written recipient confirmation.

This file is retained for preparation only. Do not submit it unless maintainers have accepted and recorded this applicant's own contribution in the appropriate role and a corresponding contribution PR has merged. If the earlier accepted source means this contribution is not eligible for an award, do not turn this draft into a competing priority claim. No claim issue or identity email has been sent as part of preparing this file.

## Future form fields — incomplete

| Official form field | Draft value / required completion |
| --- | --- |
| Suggested issue title | `[Award claim] JSP-000690` — only if the conditions above are met |
| Problem link | [JSP-000690 catalog entry](https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0601-0700.md#JSP-000690) |
| Merged submission PR | [PR #4233](https://github.com/TheJustinSunPrize/awards/pull/4233) — **OPEN, NOT MERGED; not yet usable as a merged-PR claim prerequisite** |
| Contribution being claimed | **Lean formalization only**, conditional on maintainer acceptance and accurate contributor attribution; not mathematical solution |
| Original Lean proof repository | [ljhfafa/jsp-000690-lean](https://github.com/ljhfafa/jsp-000690-lean); must be the original repository actually accepted and recorded by maintainers |
| Applicant GitHub account | [ljhfafa](https://github.com/ljhfafa); apply only for the applicant's own documented role, never on behalf of another contributor |
| Follow-up contact email | **NOT PROVIDED**; the applicant must choose an address authorized for public posting in the form |
| Identity verification method | **PENDING_APPLICANT_METHOD**; any public note should name the method only, with private evidence sent through the official email process |
| Related claim issue for this applicant | **PENDING_FRESH_DUPLICATE_CHECK**; update an existing claim if one exists |
| Public review start / end | **NOT STARTED / NOT APPLICABLE**; no dates should be inferred from a proof commit or future PR date |

## Contribution evidence and attribution clarification

The underlying mathematics is Ruiliang Li's [arXiv:2512.24850v1](https://arxiv.org/html/2512.24850v1), particularly Definition 2.1, equation (5), Lemmas 4.2–4.4 and Appendix B. No mathematical discovery by this applicant is claimed.

The prospective proof reference is branch `main`, full commit **`16775f11a809a49fcd6822add9895eb104966994`**, file `JSP690/Main.lean`, target **`JSP690.exists_three_uniform_three_chromatic_critical`**. Its independently proposed statement requires maintainer review. It includes all proper subhypergraphs through a general deletion-to-subhypergraph lemma; that explicit correspondence is a documentation and review feature, not an allegation that earlier proofs omitted it. The recorded local target axiom audit is **`[propext, Quot.sound]`**. The fixed-commit [verification report](VERIFICATION_REPORT.md) records successful clean build, official target checks and kernel replay. It is a technical self-verification, not organizer approval.

OpenAI Codex AI agents performed substantially all research, implementation, debugging and verification under the repository owner's direction. The owner commissioned and directed the work. The applicant's actual role and public credit must be reviewed; repository ownership or uploading AI-generated code alone is not presented as proof of qualifying authorship. Supply public attribution evidence and resolve any bot, shared-account or commit-author mismatch. Do not assert human manual proof authorship. Source construction data were transcribed from Li's paper, without copying an earlier Lean implementation.

Public evidence: [repository history](https://github.com/ljhfafa/jsp-000690-lean/commits/main/) and [AI/role disclosure](https://github.com/ljhfafa/jsp-000690-lean/blob/16775f11a809a49fcd6822add9895eb104966994/README.md). The accepted catalog record and merged PR do not yet exist. This is a personal repository, not an organization repository.

## Related claims, attribution questions and conflicts

Known earlier work includes [Issue #15](https://github.com/TheJustinSunPrize/awards/issues/15), [PR #35](https://github.com/TheJustinSunPrize/awards/pull/35), and [Issue #157](https://github.com/TheJustinSunPrize/awards/issues/157). A successful unchanged-source replay of Issue #15 under Lean 4.32.0 returned exit status 0 and axioms `[propext, Quot.sound]`; the audited source SHA-256 is `b774101a4cfbf9715a2823fe87fe8208981adbbdc4f2f244ff8428190d8a547e`. This establishes substantive prior complete work for our competition assessment; no priority challenge is proposed. We do not use issue opening time alone as the completion time of its current contents.

The prospective applicant makes no claim to replace an earlier valid source on priority grounds. **PENDING:** refresh current candidate/award/PR records, identify any actual overlapping claim, provide the public competition-audit link, and disclose any relevant professional relationship known to the applicant. Do not enter “None” while these checks are outstanding.

## Applicant declarations — intentionally unasserted

- [ ] Required merged contribution PR exists and is linked.
- [ ] The applicant is applying for their own accepted contribution using their own GitHub account.
- [ ] The catalog and public evidence support the applicant's accurately described role, including AI disclosure and any attribution discrepancies.
- [ ] The accepted original repository URL and any necessary organization contribution evidence are supplied.
- [ ] The applicant understands and will complete the required identity email step after a permitted claim is opened.
- [ ] Related claims and conflicts have been disclosed; contribution and identity checks remain subject to maintainer verification.

## Later private correspondence

If a valid claim is eventually opened, the official process requires an identity-verification email from the chosen public follow-up address to `thejustinsunprize@hejustinsun.com`, linking the claim and merged PR. This draft does not authorize or send that email. Keep identity documents, payment network/address, and medal delivery information out of public repository files and issues. Public review starts only with the maintainer's candidate publication; payment requires all remaining review and written confirmation steps.
