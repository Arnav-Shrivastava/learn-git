# Task-Oriented Git Cheatsheet

Instead of alphabetical commands, here is how to achieve specific tasks.

## I want to...

### Start a Project
* **Create a new local repo:** `git init`
* **Download an existing repo:** `git clone <url>`
* **Connect local repo to a remote:** `git remote add origin <url>`

### Save My Work
* **See what changed:** `git status`
* **See exact lines changed:** `git diff`
* **Stage specific files:** `git add <file1> <file2>`
* **Stage everything:** `git add .`
* **Commit staged changes:** `git commit -m "Message"`

### Undo Mistakes (Before Pushing)
* **Unstage a file:** `git restore --staged <file>` or `git reset HEAD <file>`
* **Discard unstaged changes:** `git restore <file>` or `git checkout -- <file>`
* **Change the last commit message:** `git commit --amend -m "New message"`
* **Add a forgotten file to the last commit:** `git add <file>`, then `git commit --amend --no-edit`
* **Undo the last commit (keep files):** `git reset --soft HEAD~1`
* **Undo the last commit (delete files):** `git reset --hard HEAD~1` (WARNING: Destructive!)

### Undo Mistakes (After Pushing)
* **Safely undo a pushed commit:** `git revert <commit-hash>`

### Branch and Merge
* **List branches:** `git branch`
* **Create and switch to a new branch:** `git switch -c <branch-name>`
* **Switch to an existing branch:** `git switch <branch-name>`
* **Merge a branch into current branch:** `git merge <branch-name>`
* **Delete a merged branch:** `git branch -d <branch-name>`

### Synchronize with the Team
* **Download latest changes without merging:** `git fetch`
* **Download and merge latest changes:** `git pull`
* **Upload my commits:** `git push`
* **Upload my commits (first time for a branch):** `git push -u origin <branch-name>`

### Manage Messy Work in Progress
* **Save uncommitted work temporarily:** `git stash`
* **Bring back saved work:** `git stash pop`
* **See saved work:** `git stash list`

### Recover from Disasters
* **Find a "deleted" commit or branch:** `git reflog` (Find the hash, then `git switch -c <name> <hash>`)
* **Find which commit broke the code:** `git bisect start`, `git bisect bad`, `git bisect good <working-commit-hash>`
