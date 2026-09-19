# Phase 5: Advanced Git & Recovery

This phase covers the tools that elevate you from a Git user to a Git lifesaver.

## The Ultimate Safety Net: `git reflog`
If you accidentally run `git reset --hard` or delete an unmerged branch, your commits aren't actually gone immediately. 
Git keeps a secret diary of *every single time the HEAD pointer moves* on your local machine, called the **reflog** (Reference Log).

* `git reflog`: Shows this diary. It looks like a normal git log, but it includes actions like checkouts, resets, and commits.
* **How to recover lost work**:
  1. Run `git reflog`.
  2. Find the hash of the commit where your lost work was (e.g., `a1b2c3d`).
  3. Run `git branch recovered-work a1b2c3d` (or `git checkout -b recovered-work a1b2c3d`). 
  Boom. Your "deleted" code is back. Note: The reflog is local-only and expires after 90 days.

## Stealing Commits: `git cherry-pick`
Sometimes a teammate makes a commit on a branch, and you desperately need *just that one commit* on your branch, but you don't want to merge their entire branch.
* `git cherry-pick <commit-hash>`: Takes the changes from a specific commit and applies them as a brand new commit on your current branch.

## Finding Bugs: `git bisect`
Imagine you realize there is a bug on `main`, but it wasn't there a month ago. Hundreds of commits have happened since. How do you find which commit introduced the bug?
`git bisect` does a binary search through your history.

1. `git bisect start` (Starts the wizard)
2. `git bisect bad` (Tells Git the current commit has the bug)
3. `git bisect good <commit-hash>` (Tells Git an older commit that definitely didn't have the bug)
Git will then checkout a commit halfway between. You test the code, and tell Git either `git bisect good` or `git bisect bad`. It repeats the process, cutting the search space in half each time, until it pinpoints the exact commit that broke the code.
* `git bisect reset` (Ends the wizard and returns you to where you were).

## Tags & Releases
Branches move, tags don't. Tags are permanent labels for specific commits, usually used for version numbers (e.g., v1.0.0).
* `git tag` (Lists tags)
* `git tag v1.0.0` (Creates a "lightweight" tag)
* `git tag -a v1.0.0 -m "Release version 1.0.0"` (Creates an "annotated" tag, which includes author info, date, and a message. Best practice for releases).
* `git push origin v1.0.0` (Tags are not pushed by default; you must push them explicitly).

## Submodules vs Subtrees (Conceptual)
How do you include another Git repository inside your Git repository?
* **Submodules**: Creates a pointer to a specific commit in another repo. When someone clones your repo, the submodule folder is empty until they run `git submodule update --init`. It's strict but can be clunky.
* **Subtrees**: Actually copies the files from the other repo into your repo's history. It's easier for people cloning your repo, but slightly harder to push updates back upstream. 

## Git Hooks
Hooks are scripts that Git executes automatically before or after certain events. They live in `.git/hooks/`.
* `pre-commit`: Runs before you can commit. Often used by teams to run code linters or formatters. If the script fails, the commit is blocked.
* `pre-push`: Runs before pushing. Often used to run automated tests.
