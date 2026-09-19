# Phase 3: Branching & Merging

Branching is Git's killer feature. It allows you to diverge from the main line of development and continue to do work without messing with that main line.

## What is a Branch?
In many version control systems, creating a branch means copying all the files into a new folder. This is slow.
In Git, a branch is just a **lightweight movable pointer** to a commit. When you create a branch, Git just creates a new label. That's why branching in Git is nearly instantaneous.

## Creating and Managing Branches

* `git branch`: Lists your local branches. The one with a `*` is where you currently are.
* `git branch <branch-name>`: Creates a new branch pointing to the current commit, but does *not* switch you to it.
* `git switch <branch-name>` (or `git checkout <branch-name>`): Switches to the specified branch.
* `git switch -c <branch-name>` (or `git checkout -b <branch-name>`): Creates the branch AND switches to it in one step.
* `git branch -d <branch-name>`: Deletes a branch safely (prevents deletion if it has unmerged changes).
* `git branch -D <branch-name>`: Force deletes a branch.
* `git branch -m <new-name>`: Renames the current branch.

## Merging
Merging brings the history of a forked branch back together.

### 1. Fast-Forward Merge
If you create a branch from `main`, add commits to it, but `main` has **not** moved forward, Git simply moves the `main` pointer forward to match your branch. This is a fast-forward merge. There is no "merge commit".

### 2. 3-Way Merge
If `main` has moved forward since you created your branch (e.g., a teammate merged their work), Git has to combine the two diverged histories. It uses a "3-way merge" (comparing the two branch tips and their common ancestor) and creates a special **Merge Commit** that has two parents.

*Command:* (Make sure you are on `main` first)
`git merge <feature-branch>`

### Merge Conflicts
If you and your teammate both edited the *same lines in the same file*, Git doesn't know which version to keep. It pauses the merge and says "CONFLICT".
Git modifies the conflicted file to show both versions:
```
<<<<<<< HEAD
This is my code on main
=======
This is the code from the feature branch
>>>>>>> feature-branch
```
**To resolve:**
1. Open the file in your editor.
2. Delete the `<<<<`, `====`, `>>>>` markers.
3. Edit the code to be exactly how it should look.
4. Save, `git add <file>`, and `git commit` to finish the merge.

---

## Rebasing: `git rebase`
Rebasing is an alternative to merging. It solves the same problem (combining work) but does it differently.

Instead of creating a merge commit, `git rebase <base-branch>` takes your branch's commits, temporarily saves them, updates your branch to the tip of `<base-branch>`, and then "replays" your commits one by one on top.
* **Why do it?** It creates a perfectly linear, clean history (no messy merge commits).
* **The Golden Rule**: **Never rebase commits that you have pushed to a shared repository.** Rebasing rewrites history (creates brand new commit hashes). If you rebase shared history, your teammates' repos will break.

### Interactive Rebase: `git rebase -i`
This is a superpower. It lets you modify your local history before sharing it.
`git rebase -i HEAD~3` (rebase the last 3 commits) opens an editor. You can:
* `pick`: keep the commit.
* `reword`: change the commit message.
* `edit`: pause the rebase so you can amend the commit.
* `squash` (or `s`): combine this commit into the previous one. (Great for combining 5 messy "wip" commits into 1 clean commit before a PR).
* `drop`: delete the commit entirely.
