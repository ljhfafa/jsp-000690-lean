# Competition investigation — JSP-000690

Research date: 2026-09-23 (Asia/Shanghai). Public GitHub API inspection, not organizer verification.
Official catalog snapshot: `bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2`.

## Decision

**JSP-000690 has real earlier competition.** There are many earlier public formalizations; the complete source from Issue #15 has now been independently compiled with unchanged source bytes (details below). Switching was initially recommended, but the investigated alternatives are also occupied. If JSP-000690 is retained as the most feasible engineering target, it must be described as an additional independently implemented formalization, with no firstness or prize-entitlement claim. The catalog still says `Lean proof: No`; it is stale as a competition indicator. We do not adjudicate firstness or prize entitlement.

The public query [`repo:TheJustinSunPrize/awards "JSP-000690"`](https://github.com/TheJustinSunPrize/awards/issues?q=repo%3ATheJustinSunPrize%2Fawards+%22JSP-000690%22) returned 52 issue/PR records, including unrelated entries which mention this target in their bodies. No returned PR had a non-null `merged_at`; this is not a blanket claim that all competing work was rejected.

## Concrete earlier evidence

1. [Issue #15](https://github.com/TheJustinSunPrize/awards/issues/15), opened **2026-09-16T09:32:21Z**, contains a full standalone Lean source in its body. It defines a 9-vertex / 22-edge simple hypergraph, 3-colorability, all-function non-2-colorability with an explicit completeness lemma, edge and vertex deletion certificates, and degree vector. Source-level inspection found a genuine target, not a trivial numerical lemma. It reports Lean 4.24.0, `[propext, Quot.sound]`, no native computation, and compilation. Source hash is `b774101a4cfbf9715a2823fe87fe8208981adbbdc4f2f244ff8428190d8a547e`. Its exact code block was subsequently independently compiled unchanged under Lean 4.32.0 with exit 0 and only `[propext, Quot.sound]`; see the audit below. The current body may have been edited after opening; issue opening is not proven completion time.
2. [PR #21](https://github.com/TheJustinSunPrize/awards/pull/21), opened **2026-09-16T09:57:15Z**, currently closed and unmerged, points to [paradoxSCH/awards source](https://github.com/paradoxSCH/awards/blob/e47dce2e02a606da2130feeef563c86b42265a54/submissions/jsp-000690/Main.lean), commit `e47dce2e02a606da2130feeef563c86b42265a54`. It reports stronger proper-subhypergraph coverage, Lean 4.34.0 clean compilation and bundled checker replay. Its closed status does not establish mathematical invalidity.
3. [PR #35](https://github.com/TheJustinSunPrize/awards/pull/35), opened **2026-09-16T10:55:07Z**, currently closed and unmerged, cites [superpilot69's source](https://github.com/superpilot69/awards/tree/5e762a0fbb6cc3a45426c9528d8d3dab15f4e75e/submissions/jsp-000690), commit `5e762a0fbb6cc3a45426c9528d8d3dab15f4e75e`. It explicitly covers arbitrary proper subhypergraphs and reports nine axiom audits `[propext, Quot.sound]`.
4. [Issue #126](https://github.com/TheJustinSunPrize/awards/issues/126), opened **2026-09-16T15:42:38Z**, links `solivansprvill-droid/jsp-000690-lean` at `90b20d653bc4e074d833ff7c3fcfc92736d68e22`. **Important evidence correction:** although other claimants call it complete, its own body says the kernel check was NOT yet performed. It must not be treated as verified just because it is early.
5. [Issue #157](https://github.com/TheJustinSunPrize/awards/issues/157), opened **2026-09-16T17:16:39Z**, links [aqin1996/jsp-000690-lean](https://github.com/aqin1996/jsp-000690-lean) at `15db3d478f4312ac7b26fc8ee966eac99c4566a4`. It reports Lean core-only 4.34.0, full finite proof with surjective coloring decoding, clean build, standard axioms only, and explicitly concedes earlier public work.
6. [Issue #704](https://github.com/TheJustinSunPrize/awards/issues/704), opened **2026-09-17T12:39:00Z**, points to [homelymole95/jsp-000690-chromatic-lean](https://github.com/homelymole95/jsp-000690-chromatic-lean) at `4dc3c7ebce6bb7fbdff6575c14a77c1e068d18e5`, with Mathlib and audit claims.
7. [PR #1383](https://github.com/TheJustinSunPrize/awards/pull/1383) and [PR #4071](https://github.com/TheJustinSunPrize/awards/pull/4071) register an existing [plby/lean-proofs Erdős 834 development](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos834.lean). The latter lists supporting lemmas, so its body alone does not prove the main result; source must be audited before recognizing it as complete.

## Complete API match list

| Item | Created UTC | State | Title |
|---|---|---|---|
| [#15](https://github.com/TheJustinSunPrize/awards/issues/15) | 2026-09-16T09:32:21Z | open | [Problem] JSP-000690: Lean verification of Li’s 9-vertex chromatic-critical hypergraph |
| [#21](https://github.com/TheJustinSunPrize/awards/pull/21) | 2026-09-16T09:57:15Z | closed | JSP-000690: submit Lean proof of the chromatic-critical hypergraph construction |
| [#35](https://github.com/TheJustinSunPrize/awards/pull/35) | 2026-09-16T10:55:07Z | closed | JSP-000690: submit Lean formalization of the 3-critical hypergraph construction |
| [#39](https://github.com/TheJustinSunPrize/awards/pull/39) | 2026-09-16T11:40:48Z | closed | JSP-000690: catalog Lean evidence and formalization attribution |
| [#40](https://github.com/TheJustinSunPrize/awards/pull/40) | 2026-09-16T11:46:42Z | closed | docs: register existing Lean evidence for 78 catalog records |
| [#41](https://github.com/TheJustinSunPrize/awards/pull/41) | 2026-09-16T11:48:26Z | closed | JSP-000622: catalog Lean evidence and formalization attribution |
| [#95](https://github.com/TheJustinSunPrize/awards/pull/95) | 2026-09-16T14:50:10Z | closed | JSP-000692: catalog Lean evidence and formalization attribution |
| [#126](https://github.com/TheJustinSunPrize/awards/issues/126) | 2026-09-16T15:42:38Z | open | [Recipient] JSP-000690 Lean formalization of Li 3-critical 3-graph |
| [#133](https://github.com/TheJustinSunPrize/awards/pull/133) | 2026-09-16T15:54:26Z | closed | JSP-001007: catalog Lean evidence and formalization attribution |
| [#144](https://github.com/TheJustinSunPrize/awards/pull/144) | 2026-09-16T16:23:03Z | closed | JSP-000936, JSP-000937, JSP-000958: migrate existing submission to catalog-only Lean references |
| [#157](https://github.com/TheJustinSunPrize/awards/issues/157) | 2026-09-16T17:16:39Z | open | [Recipient] JSP-000690 — Lean 4 formalization (RECIPIENT-JSP-000690-B) |
| [#427](https://github.com/TheJustinSunPrize/awards/pull/427) | 2026-09-17T03:18:36Z | open | Add observation candidate jsp-000690-critical-3chromatic-hypergraph |
| [#458](https://github.com/TheJustinSunPrize/awards/pull/458) | 2026-09-17T04:17:27Z | open | JSP-000078: catalog Lean evidence and formalization attribution |
| [#498](https://github.com/TheJustinSunPrize/awards/pull/498) | 2026-09-17T05:33:08Z | open | JSP-000883: catalog reference draft pending original-problem scope review |
| [#697](https://github.com/TheJustinSunPrize/awards/issues/697) | 2026-09-17T12:29:57Z | open | [Correction] JSP-000690 Lean proof and claim eligibility |
| [#704](https://github.com/TheJustinSunPrize/awards/issues/704) | 2026-09-17T12:39:00Z | open | [Recipient] JSP-000690 formalization — RECIPIENT-JSP-000690-A |
| [#717](https://github.com/TheJustinSunPrize/awards/pull/717) | 2026-09-17T13:07:19Z | open | docs(problems): add Lean proof attribution for JSP-000690 |
| [#737](https://github.com/TheJustinSunPrize/awards/pull/737) | 2026-09-17T13:25:23Z | open | JSP-000690: complete Lean proof (attributed verification) |
| [#747](https://github.com/TheJustinSunPrize/awards/pull/747) | 2026-09-17T13:46:59Z | open | JSP-000690: kernel-checked critical hypergraph certificates |
| [#794](https://github.com/TheJustinSunPrize/awards/pull/794) | 2026-09-17T15:10:49Z | open | Add JSP-000690 chromatic observation candidate (under verification) |
| [#823](https://github.com/TheJustinSunPrize/awards/pull/823) | 2026-09-17T16:46:36Z | open | JSP-000690: Lean proof of the 3-critical 3-graph with minimum degree 7 |
| [#842](https://github.com/TheJustinSunPrize/awards/pull/842) | 2026-09-17T17:42:49Z | open | JSP-000690: complete chromatic Lean proof with exhaustive kernel certificates |
| [#845](https://github.com/TheJustinSunPrize/awards/pull/845) | 2026-09-17T17:49:36Z | open | JSP-000690: independent standalone Lean 4 formalization (zero imports, no Mathlib, axiom footprint [propext] only) |
| [#879](https://github.com/TheJustinSunPrize/awards/pull/879) | 2026-09-17T20:42:57Z | open | JSP-000690: credit Ruiliang Li and record a Lean formalization |
| [#880](https://github.com/TheJustinSunPrize/awards/issues/880) | 2026-09-17T20:43:05Z | open | [Award claim] JSP-000690 — Lean formalization |
| [#882](https://github.com/TheJustinSunPrize/awards/issues/882) | 2026-09-17T20:43:40Z | closed | [Correction] JSP-000690: state whether the record covers one or both readings of "3-critical" |
| [#1017](https://github.com/TheJustinSunPrize/awards/issues/1017) | 2026-09-18T03:54:43Z | open | [Correction] Pattern report: catalog-flip PRs whose formalized statements do not entail the catalogued theorems (JSP-000840 #836, JSP-000216 #1004, batch #997-#1009) |
| [#1023](https://github.com/TheJustinSunPrize/awards/issues/1023) | 2026-09-18T04:38:04Z | open | [Award claim] JSP-000690: Lean formalization contribution |
| [#1032](https://github.com/TheJustinSunPrize/awards/issues/1032) | 2026-09-18T05:04:19Z | closed | [Correction] JSP-000768: description is a different (and trivially false) question; answer and source missing |
| [#1066](https://github.com/TheJustinSunPrize/awards/issues/1066) | 2026-09-18T06:13:39Z | open | [Award claim] JSP-000690 — Lean formalization |
| [#1097](https://github.com/TheJustinSunPrize/awards/pull/1097) | 2026-09-18T07:21:17Z | open | JSP-000690: regular 21-edge witness and complete chromatic proof |
| [#1099](https://github.com/TheJustinSunPrize/awards/pull/1099) | 2026-09-18T07:23:43Z | open | feat(catalog): record Lean formalization for JSP-000690 |
| [#1113](https://github.com/TheJustinSunPrize/awards/issues/1113) | 2026-09-18T08:05:45Z | open | [Award claim] JSP-000690: KunHcz regular critical hypergraph formalization |
| [#1152](https://github.com/TheJustinSunPrize/awards/pull/1152) | 2026-09-18T09:57:53Z | open | JSP-000690: record complete Lean formalization of Li's hypergraph |
| [#1292](https://github.com/TheJustinSunPrize/awards/issues/1292) | 2026-09-18T16:28:34Z | open | [Award claim] JSP-000690 — Lean formalization |
| [#1383](https://github.com/TheJustinSunPrize/awards/pull/1383) | 2026-09-18T17:32:59Z | open | JSP-000690: record existing Lean formalization (plby/lean-proofs) |
| [#1609](https://github.com/TheJustinSunPrize/awards/pull/1609) | 2026-09-19T01:28:54Z | open | JSP-000690: record the Lean formalization of Erdős #834 (Li's 9-vertex critically 3-chromatic 3-uniform hypergraph of minimum degree 7) |
| [#1610](https://github.com/TheJustinSunPrize/awards/issues/1610) | 2026-09-19T01:29:22Z | open | [Award claim] JSP-000690 — Lean formalization |
| [#1613](https://github.com/TheJustinSunPrize/awards/pull/1613) | 2026-09-19T02:10:14Z | open | JSP-000690: record the Lean formalization of both readings of Erdős #834 (supersedes #1609) |
| [#1614](https://github.com/TheJustinSunPrize/awards/issues/1614) | 2026-09-19T02:10:35Z | open | [Award claim] JSP-000690 — Lean formalization (transversal reading) |
| [#1868](https://github.com/TheJustinSunPrize/awards/issues/1868) | 2026-09-19T11:38:48Z | open | [Award claim] JSP-000690 — CN-F90 independent Lean formalization |
| [#1895](https://github.com/TheJustinSunPrize/awards/pull/1895) | 2026-09-19T11:44:46Z | open | catalog: record independent Lean formalization for JSP-000690 (@CN-F90) |
| [#1947](https://github.com/TheJustinSunPrize/awards/pull/1947) | 2026-09-19T14:27:11Z | open | Record Lean formalization for JSP-000690 |
| [#2007](https://github.com/TheJustinSunPrize/awards/pull/2007) | 2026-09-20T02:39:50Z | closed | catalog: record Lean formalization for JSP-000690 |
| [#2044](https://github.com/TheJustinSunPrize/awards/issues/2044) | 2026-09-20T02:45:58Z | open | [Question] Solver-first registration for historically-solved entries (JSP-000840 / JSP-000690) |
| [#2108](https://github.com/TheJustinSunPrize/awards/pull/2108) | 2026-09-20T05:26:09Z | open | JSP-000690: register Lean proof of the chromatic-critical hypergraph construction |
| [#2185](https://github.com/TheJustinSunPrize/awards/pull/2185) | 2026-09-20T09:10:24Z | open | catalog: record Lean formalization for JSP-000690 (Erdős 690) |
| [#2186](https://github.com/TheJustinSunPrize/awards/issues/2186) | 2026-09-20T09:10:43Z | open | [Award claim] JSP-000690 — zjukop3 Lean formalization |
| [#2545](https://github.com/TheJustinSunPrize/awards/pull/2545) | 2026-09-21T06:42:45Z | open | JSP-000690: complete chromatic formalization with global size bounds |
| [#2878](https://github.com/TheJustinSunPrize/awards/pull/2878) | 2026-09-22T00:39:07Z | closed | JSP-000690: register Lean formalization |
| [#3828](https://github.com/TheJustinSunPrize/awards/pull/3828) | 2026-09-22T15:43:14Z | open | JSP-000690: add Lean 4 formalization (3-uniform critically 3-chromatic 3-graph with minimum degree 7) |
| [#4071](https://github.com/TheJustinSunPrize/awards/pull/4071) | 2026-09-23T04:09:22Z | open | JSP-000690: register Lean formalization (plby/lean-proofs) |

## Search limitations and broad-scan warning

- GitHub public API search is public, query-dependent, and subject to rate limits. It cannot prove absence of an unindexed external proof, unpublished work, or a submission using another title.
- Generic web search of the exact JSP ID yielded mostly irrelevant results; it is much weaker than direct GitHub API results.
- `gh` was initially absent and unauthenticated code search unavailable. Public network API access was performed through approved read-only Python requests.
- A recent broad issue scan fetched 1,000 records (#3182–#4181, 2026-09-22/23); pagination past 1,000 returned HTTP 422. Date-filtered searches covered all 2026-09-16/17 and portions of later dates before throttling; targeted exact-ID searches supplemented them.
- Recent bulk PRs mention hundreds of problem IDs but often reference only `two_prime`, `three_prime`, `mod3_N` or isolated supporting lemmas. Such mentions are **not evidence of a complete formalization**. Competition must be assessed on the actual theorem and source correspondence.
- No private contact, identity, or payment details are retained in this report.


## Alternative-candidate triage (updated same day)

The catalog is severely stale: many Solved/Lean-No entries have earlier substantive public proofs, and hundreds of recent superficial registrations are mixed with those real proofs. A partial map of 2,813 unique issue/PR records was assembled, covering all 2026-09-16/17, part of 09-18, and the latest 1,000 records from 09-22/23, plus targeted exact-ID searches. Public search rate limits prevented uninterrupted full enumeration. A title-only absence on this map is not relied upon as proof of absence.

| Candidate | Substantive earlier evidence | Assessment |
|---|---|---|
| JSP-000513 / Erdős 632 | [#97](https://github.com/TheJustinSunPrize/awards/pull/97), [#99](https://github.com/TheJustinSunPrize/awards/pull/99), [#1038](https://github.com/TheJustinSunPrize/awards/pull/1038), and existing plby proof registered in #16 | Complete 4-choosable/not-(8:2)-choosable finite construction already implemented; #99 reports 89 theorem audits, 17 modules, fresh kernel replay and CI. Avoid duplicate investment. |
| JSP-000250 / Erdős 294 | [#354](https://github.com/TheJustinSunPrize/awards/pull/354), [#802](https://github.com/TheJustinSunPrize/awards/pull/802) | Full asymptotic two-sided unit-fraction denominator bounds, not a finite example. Existing lower proof has 75-module closure. |
| JSP-000264 / Erdős 318 | [#105](https://github.com/TheJustinSunPrize/awards/pull/105) | Larsen square-reciprocal theorem newly formalized, other variants reused from earlier plby. Coverage must distinguish separate versions, but no easy untouched subquestion identified. |
| JSP-000399 / Erdős 494 | [#23](https://github.com/TheJustinSunPrize/awards/pull/23), [#127](https://github.com/TheJustinSunPrize/awards/pull/127), [#345](https://github.com/TheJustinSunPrize/awards/pull/345), [#630](https://github.com/TheJustinSunPrize/awards/pull/630) | Finite counterexamples and two Selfridge–Straus positive criteria are occupied. Full eventual uniqueness remains a possible gap but requires Ridout's p-adic Roth theorem; impractical here. #695's finite counterexample is not full classification. |
| JSP-000641 / Erdős 781 | [#29](https://github.com/TheJustinSunPrize/awards/issues/29), [#1193](https://github.com/TheJustinSunPrize/awards/pull/1193) | Earlier full cubic-order theorem, independently reported local reproduction. A finite quadratic-threshold disproof is not a replacement for full result. |
| JSP-000746 / Erdős 895 | [#18](https://github.com/TheJustinSunPrize/awards/issues/18), [#165](https://github.com/TheJustinSunPrize/awards/pull/165), [#402](https://github.com/TheJustinSunPrize/awards/pull/402), [#1156](https://github.com/TheJustinSunPrize/awards/pull/1156), [#1164](https://github.com/TheJustinSunPrize/awards/pull/1164) | Full 18-point SAT/RUP proof, all larger n and integer-graph transport already exist. Exact threshold and even a minimum-edge 17-point obstruction have earlier implementations. |
| JSP-000415 / Erdős 518 | [#89](https://github.com/TheJustinSunPrize/awards/issues/89), [#2800](https://github.com/TheJustinSunPrize/awards/pull/2800) | Focused search corrected a false gap from the partial map. Existing plby all-n proof was compiled/replayed over 36 modules; #2800 is a separate sufficiently-large-n implementation. |
| JSP-000575 | [#16](https://github.com/TheJustinSunPrize/awards/issues/16), [#1238](https://github.com/TheJustinSunPrize/awards/pull/1238) | Existing-proof verification packet. #3888 merely checks C6 and does not prove the original general theorem, but its weakness does not erase earlier complete work. |
| JSP-000493 | [#44](https://github.com/TheJustinSunPrize/awards/issues/44), [#1260](https://github.com/TheJustinSunPrize/awards/pull/1260) | Existing-proof verification packet; not an established gap. |
| JSP-000797 | [#1330](https://github.com/TheJustinSunPrize/awards/pull/1330) | Existing plby source is linked and needs source-level scope audit. #1175 references an unrelated repeated-distance existence theorem, so that particular PR is not valid full evidence. |
| JSP-000679 | [#1278](https://github.com/TheJustinSunPrize/awards/pull/1278) | Existing plby source is linked and needs source-level audit. |
| JSP-000817 / Erdős 984 | [#1077](https://github.com/TheJustinSunPrize/awards/pull/1077) | Cites existing Hunter-solution formalization in plby; not an established gap. |
| JSP-000622 | [#41](https://github.com/TheJustinSunPrize/awards/pull/41), [#332](https://github.com/TheJustinSunPrize/awards/pull/332) | Exact z(20)=6 work already public, with extensive finite classifier/certificate evidence. Scope review remains necessary but it is strongly occupied. |

No alternative is presently certified as both realistically elementary and free of an earlier full formalization. A correct final report must disclose this rather than infer novelty from the catalog's Lean-No flag.


## Independent source and kernel audit of Issue #15

The complete Lean code block in [Issue #15](https://github.com/TheJustinSunPrize/awards/issues/15) was extracted with LF newlines and a final newline. It is **5,826 bytes**, SHA-256 **`b774101a4cfbf9715a2823fe87fe8208981adbbdc4f2f244ff8428190d8a547e`**, matching the hash printed in that issue. The issue was created 2026-09-16T09:32:21Z and last updated 2026-09-18T07:59:42Z. The creation timestamp alone is not asserted as the time these exact bytes first appeared.

The entire source was read before compilation. It imports only bundled `Std`; it contains no `sorry`, `admit`, custom `axiom`, `unsafe`, `native_decide`, `run_tac`, or `run_cmd`. It contains ordinary definitions, lemmas, core tactics, finite reduction and a final axiom command. No project scripts, package hooks or external solver were executed.

Actual command on 2026-09-23:

```text
/Users/jiahongli/workspace/justinsun/tools/lean-4.32.0-darwin_aarch64/bin/lean /private/tmp/jsp-competition/Issue15.lean
```

Actual exit status: **0**. Actual output:

```text
'JSP000690.exists_critical_min_degree_seven' depends on axioms: [propext, Quot.sound]
```

This first reproduction used Codex's default process sandbox without an escalation. It is **not claimed as an explicit network-disabled, credential-hidden run**. The original source specifies Lean 4.24.0, while this unchanged-source reproduction used the locally verified official **Lean 4.32.0** distribution, commit `8c9756b28d64dab099da31a4c09229a9e6a2ef35`; it is therefore a successful current-toolchain replay, not a reproduction of the original pinned toolchain. A subsequent credential-isolated macOS sandbox rerun succeeded (1.54 seconds), and explicit `leanchecker -v --fresh Issue15` kernel replay also succeeded (51.97 seconds). The sandbox rejected outside-file reads, source writes and network connections. Both checks still used Lean 4.32.0, not the originally advertised 4.24.0. Logs and command/limit metadata are preserved under `competition-evidence/`; this replay uses the same Lean kernel, not an independent implementation.

A separate Python audit parsed the edge and coloring lists from those exact source bytes and independently checked all 512 two-colorings. Actual results:

- 9 vertices; 22 distinct edges; every triple has strictly increasing coordinates and three distinct vertices.
- Degrees `[10, 7, 7, 7, 7, 7, 7, 7, 7]`.
- Zero proper two-colorings; the explicit three-coloring is proper.
- All 22 edge-deletion and all 9 vertex-deletion certificate obligations pass.

Statement assessment:

- `Simple H` combines `H.Nodup` with strictly increasing tuple coordinates. This is a faithful simple three-uniform hypergraph encoding: distinct ordered triples correspond uniquely to three-element vertex subsets.
- `Proper H c` requires that no edge be monochromatic; it is ordinary weak hypergraph coloring.
- `color_complete` proves that every function `Fin 9 → Bool` equals one of the enumerated nine-bit functions. Thus non-2-colorability is universal, not a finite sample with a missing representation bridge.
- `Critical3 H` includes a proper `Fin 3` coloring, no proper Boolean coloring, and proper Boolean colorings after every individual edge/vertex deletion. The target bundles this with the minimum degree statement.
- Vertex deletion retains an isolated coordinate in the ambient `Fin 9` function domain; restricting the coloring to the remaining subtype gives the standard vertex-deleted hypergraph coloring. Conversely such a coloring extends arbitrarily to the removed coordinate. There is no lost edge constraint.
- The source does **not explicitly export a theorem quantified over every arbitrary proper subhypergraph**. Nevertheless its edge/vertex criticality entails that property by coloring monotonicity: any proper subhypergraph either omits a vertex or omits an edge, so it is contained in one of the certified deletions. The minimum degree property rules out isolated vertices in the original graph. This is an unexported general bridge, not a mathematical weakness invalidating the witness.
- The standalone result is therefore credible earlier full evidence for the catalog's chromatic reading. No decision about organizer acceptance, earliest worldwide priority, current submission formatting or award eligibility is made here.

Issue #126 is weaker evidence: its own unchanged body explicitly says the kernel check had not yet been performed. We do not adopt other submitters' descriptions of #126 as verified.


Further exact-ID checks also found earlier sources for JSP-000267 (#1267, plby Erdős 321), JSP-000359 (#34, #1087, #2208), JSP-000397 (#44, Erdős 491), JSP-000644 (#19, #1277), JSP-000704 (#1279, Erdős 851), JSP-000711 (#70, Erdős 858), JSP-000870 (#24, #772), JSP-000476 (#1471), JSP-000437 (#44), and JSP-000460 (#44). The broad scan was stopped after this repeated result, rather than spending indefinitely on duplicate candidate selection. Targeted searches of JSP-000589 and JSP-000364 were throttled and did not complete.

Direct inspection of pinned plby entry files confirmed that the public target signatures for Erdős 957 (JSP-000797), Erdős 823 (JSP-000679), Erdős 321 (JSP-000267), and Erdős 851 (JSP-000704) express substantive full-result conclusions rather than unrelated finite examples. Their dependency closures were **not rebuilt** here, so this is scope evidence, not a kernel audit of those developments.

## Final pre-submission refresh
On 2026-09-23, authenticated GitHub search `repo:TheJustinSunPrize/awards "JSP-000690" in:title,body` returned 50 items, with `incomplete_results=false`; all 50 were fetched. The initial multi-query collection contained 52 related records, so these are different search scopes, not a claimed disappearance of two proofs. This refresh includes open PR #4071 and #3828 and closed #2878. It does not change the substantive conclusion: earlier complete formalizations exist. The exact query and compact public record snapshot are in `final-competition-search.json`.
