# Phase 1: Git Foundations

Welcome to the foundation of version control!

## What Problem Does Version Control Solve?
Before Git, people managed code versions by copying folders (`project_final`, `project_final_v2`, `project_final_REALLY_FINAL`). This is error-prone, hard to search, and impossible for teams.
Git solves this by tracking the *history* of changes over time, allowing multiple people to collaborate, and providing a safety net to undo mistakes.

## Snapshots vs Diffs
Some older version control systems store a base file and a list of *diffs* (differences) for each version.
Git is fundamentally different. It thinks of its data more like a series of **snapshots**. Every time you commit, Git takes a picture of what all your files look like at that moment. If a file didn't change, Git doesn't store it again; it just links to the previous identical file it already has stored.

## Git's Object Model (Conceptual)
Under the hood, Git is a simple key-value data store.
- **Blob (Binary Large Object)**: Represents the *content* of a file. It doesn't store the filename, just the data.
- **Tree**: Represents a directory. It contains pointers to blobs (files) and other trees (subdirectories), along with their filenames.
- **Commit**: A snapshot of your project. It points to the top-level tree and contains metadata (author, date, commit message) and a pointer to its parent commit(s).
- **Refs (References)**: Pointers to commits. Branches and tags are just refs (labels) pointing to specific commit hashes.

## The Staging Area
In Git, there's a middle-ground between your working directory (the files you are editing) and the repository history (committed snapshots). This is the **Staging Area** (also called the "index").
* **Why it exists**: It allows you to craft commits deliberately. You can edit 10 files, but only add 2 of them to the staging area to make a logical commit, and commit the other 8 later.
* **Using it deliberately**: `git add -p` allows you to stage specific *chunks* (hunks) of a file instead of the whole file. 

---

## Core Commands

### `git init`
Initializes a brand new, empty Git repository in the current directory. It creates a hidden `.git` folder where all the history and objects are stored.

### `git status`
Shows the current state of your working directory and staging area. It tells you which files are modified, untracked, or staged ready for commit.

### `git add <file>`
Moves changes from the working directory to the staging area.
* `git add .` (Add everything in the current directory)
* `git add -p` (Patch mode: interactively choose which chunks to stage)

### `git commit`
Takes a snapshot of the staging area and saves it to history.
* `git commit -m "Message"` (Provide the message directly on the command line)
* `git commit` (Opens your default text editor to write a longer, multi-line message)

### `git log`
Shows the commit history.
* `git log` (Standard view)
* `git log --oneline` (Condensed view, one commit per line. Great for a quick overview)
* `git log --graph` (Draws a text-based graph of branches and merges on the left side)
* `git log --stat` (Shows which files were changed and how many lines were added/removed in each commit)
* `git log --all` (Shows history for all branches, not just the one you are currently on)
* **Pro-tip combo**: `git log --oneline --graph --all`

## Ignoring Files: `.gitignore`
Not everything should be tracked by Git (e.g., compiled code, logs, passwords, node_modules).
Create a file named `.gitignore` in the root of your project to specify patterns.
* `*.log` (Ignore all files ending in .log)
* `build/` (Ignore the entire build directory)
* **Global vs Local**: You can have a global `.gitignore` for your user account (e.g., ignoring `.DS_Store` on Mac globally) so you don't have to add it to every single project.

---

## Common Mistakes / Failure Modes

1. **Committing secrets**: Once you commit a password or API key, it's in the history forever, even if you delete the file and commit again! (We will cover recovery later).
2. **`git add .` blindly**: Many beginners always use `git add .`, which can accidentally include debug code or large temporary files. Use `git status` before adding!
3. **Forgetting to save files**: Git only knows about saved files on your disk. If you type code but don't hit save in your editor, `git add` won't see it.
