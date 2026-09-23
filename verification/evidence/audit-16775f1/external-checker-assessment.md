# External-checker compatibility assessment

No independently implemented checker or comparator was executed in this run. The completed `leanchecker --fresh` checks use Lean’s own kernel; the independently expressed semantic bridge is not an external-checker certificate.

On 2026-09-23, no installed `lean4lean`, `lean4export`, or comparator executable was located in the checked tool and workspace paths. We inspected the official `digama0/lean4lean` repository, its latest 12 toolchain-changing commits, all API-returned tags, and all API-returned branches. No exact Lean 4.32.0 pin was located in that evidence. The nearest main-line pins were:

- `095c0a947ab870a5dcf0797725a4caec66624285`: Lean 4.31.0.
- `779c51fdea49c57c60f8039703605faae126b17f`: Lean 4.32.2.
- `5518bf83860bab48e8d53f1f447cdd6c50c30c3f`: Lean 4.33.0-rc2.

The returned master branch tip was `8223d223ed98661882e95d9d6a7126df7097cd76`. No toolchain pin was changed, no checker was forced onto a different-version artifact, and compatibility is not inferred merely from the nearby version numbers. This is a documented uncompleted verification level, not evidence of a mathematical defect. Other compatible revisions may exist outside the searched refs/history.

Sources: [official lean4lean](https://github.com/digama0/lean4lean), [toolchain history](https://api.github.com/repos/digama0/lean4lean/commits?path=lean-toolchain&per_page=12), [tags](https://api.github.com/repos/digama0/lean4lean/tags?per_page=100), [branches](https://api.github.com/repos/digama0/lean4lean/branches?per_page=100). Raw API metadata is retained with this assessment. The project's own README notes that its Lean implementation is derived from the C++ kernel and may share implementation bugs.
