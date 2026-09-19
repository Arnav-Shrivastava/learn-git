# Phase 2: History & Undoing Things

Once you have commits, you inevitably need to review what changed and undo mistakes. This phase covers the most critical tools for seeing what happened and fixing errors.

## Seeing Changes: `git diff`
`git status` tells you *which* files changed. `git diff` tells you *exactly what lines* changed.

* `git diff`: Shows unstaged changes (Working Directory vs Staging Area).
* `git diff --staged` (or `--cached`): Shows staged changes (Staging Area vs Last Commit).
* `git diff HEAD`: Shows all changes since the last commit (Working Directory + Staging Area vs Last Commit).
* `git diff <commit1> <commit2>`: Compares two specific commits.

## Fixing the Last Commit: `--amend`
If you just made a commit but realized you forgot a file or made a typo in the message:
1. Add the forgotten file: `git add forgotten.txt`
2. Run `git commit --amend -m "New message"`
This *replaces* the last commit with a new one. **Rule**: Never amend commits that you have already pushed to a shared remote (because it rewrites history)!

## Undoing Commits: `reset` vs `revert`

### `git revert <commit-hash>`
* **What it does**: Creates a *brand new commit* that does the exact opposite of the target commit. If the target added a line, the revert deletes that line.
* **When to use**: When you want to undo a mistake that has **already been pushed and shared** with others. It preserves history and doesn't rewrite it.

### `git reset <commit-hash>`
* **What it does**: Moves the branch pointer backward to a previous commit, effectively "erasing" the commits that came after it from the branch's history.
* **When to use**: When you want to undo local commits you **haven't pushed yet**.

There are 3 modes for `reset`:
1. `git reset --soft <commit>`: Moves the branch pointer, but leaves your files and staging area exactly as they were. (Great for squashing commits together).
2. `git reset --mixed <commit>` (Default): Moves the pointer, unstages everything, but keeps the changes in your working directory. (You don't lose work, you just have to `git add` again).
3. `git reset --hard <commit>`: **DANGEROUS.** Moves the pointer, unstages everything, and completely wipes your working directory to match the target commit. Uncommitted changes are lost forever.

## Throwing Away Uncommitted Changes
If you made a mess in your working directory and just want to go back to the last commit:
* `git checkout -- <file>` or `git restore <file>`: Discards unstaged changes in a specific file.
* `git restore --staged <file>`: Unstages a file but keeps the changes in your working directory.

## Stashing: `git stash`
Sometimes you are half-way through a feature, but you need to quickly switch branches to fix a bug. You aren't ready to commit your half-finished work.
* `git stash`: Takes your uncommitted changes (staged and unstaged) and saves them on a temporary clipboard, returning your working directory to a clean state.
* `git stash list`: Shows all your stashes.
* `git stash pop`: Applies the most recent stash and removes it from the stash list.
* `git stash apply`: Applies the stash but keeps it in the stash list.
* `git stash drop`: Deletes a stash.

## Detached HEAD State
Normally, `HEAD` (Git's pointer to where you currently are) points to a *branch* (like `main`).
If you run `git checkout <commit-hash>`, `HEAD` detaches from the branch and points directly to a commit. This is "Detached HEAD state".
* **What it means**: You are looking at the past. You can look around and compile the old code.
* **The danger**: If you make new commits here, they don't belong to any branch. If you switch away, they become "lost" (garbage collected later).
* **How to recover**: To save the work, create a branch right there: `git switch -c new-branch-name`. To just leave, `git switch main`.
