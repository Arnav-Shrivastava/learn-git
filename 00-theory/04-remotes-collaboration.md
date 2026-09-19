# Phase 4: Remotes & Collaboration

Git is a *distributed* version control system. Every developer has a full, complete copy of the repository on their machine. "Remotes" are just other copies of the repository hosted elsewhere (like GitHub, GitLab, or even a shared network drive) that you synchronize with.

## Managing Remotes
* `git remote -v`: Lists the URLs of the remotes you are connected to. Usually, the default remote is called `origin`.
* `git remote add <name> <url>`: Connects your local repo to a new remote.

## Fetch vs. Pull (Crucial Distinction)

### `git fetch`
* **What it does**: Downloads all the new commits, branches, and tags from the remote repository to your local machine, **but does NOT touch your working files**.
* **Why it's safe**: It updates your "remote-tracking branches" (like `origin/main`), allowing you to inspect what your teammates did before integrating it. You can run `git log origin/main` to see their commits.

### `git pull`
* **What it does**: `git fetch` + `git merge`. It downloads the new data AND immediately tries to merge it into your current branch.
* **The danger**: If you have local changes and you `git pull`, Git will create a merge commit (or trigger a conflict) right away in your working directory.
* **Pro-tip**: Many developers prefer `git pull --rebase`. Instead of a messy merge commit, it fetches the remote changes and replays your local, unpushed commits on top of them.

## Pushing Changes: `git push`
Once you have made local commits, you upload them to the remote so others can see them.
* `git push <remote> <branch>` (e.g., `git push origin main`): Pushes your commits.
* `git push -u origin <branch>`: The `-u` (upstream) flag links your local branch to the remote branch, so in the future, you can just type `git push`.

### The Danger of Force Pushing
If you rewrite history locally (e.g., using `git rebase` or `git commit --amend`), your local history will no longer align with the remote history. Git will block your `git push` and say "Updates were rejected because the tip of your current branch is behind".

You *can* force it to overwrite the remote history:
* `git push --force` (or `-f`): Destroys whatever is on the remote and replaces it with your local version. **WARNING**: If a teammate pushed code while you were working, you just deleted their code permanently.
* `git push --force-with-lease`: The safer alternative. It only allows the force push if no one else has pushed new commits to the remote since you last fetched. **Always use this instead of --force.**

## Code Review & Pull Request (PR) Workflow
In professional environments, you rarely push directly to `main`.
1. **Branch**: `git switch -c feature/new-login`
2. **Commit**: Work and make commits.
3. **Push**: `git push -u origin feature/new-login`
4. **Pull Request**: Open a PR on GitHub/GitLab. This is a request asking the maintainers to pull your branch into `main`.
5. **Review**: Teammates review your code, leave comments, and you push more commits to address them.
6. **Merge**: Once approved, the branch is merged into `main` (often squashed into a single commit).

## Commit Message Conventions
"Fixed bug" is a terrible commit message. In a team, explain **why** you made the change, not just what changed.
A popular standard is **Conventional Commits**:
* `feat: add user login page` (New feature)
* `fix: prevent crash on empty input` (Bug fix)
* `docs: update readme with setup instructions` (Documentation)
* `refactor: extract date formatter to utils` (Code change that neither fixes a bug nor adds a feature)
