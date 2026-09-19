# Scenario 1: The Large File Accident

**The Situation:**
You accidentally committed a 50MB database dump (`database.sql`) to your repository. You realized it immediately after committing, before you pushed to the remote.
Even if you delete the file and make a new commit, Git still stores that 50MB file in its history forever, bloating the repository size for everyone who clones it.

**Your Mission:**
Remove `database.sql` from the most recent commit completely, as if it never happened.

**Instructions:**
1. Run the `setup.ps1` script in this folder to generate the broken repository in `learn-git/practice-areas/scenario-01/`.
2. Navigate to that directory in your terminal.
3. Run `git log --stat` to see the giant file in the latest commit.
4. Figure out how to remove the file from history. (Hint: `git rm --cached` and `git commit --amend`).
5. Verify the file is gone from the commit history using `git log --stat`.

*(If you get stuck, check `solutions/02-scenarios/01-large-file-solution.md`)*

---
*Note on deep history: If the large file was committed 100 commits ago and pushed, `git commit --amend` won't work. You would need to use advanced tools like `git filter-repo` or the BFG Repo-Cleaner to rewrite your entire history, followed by a force push.*
