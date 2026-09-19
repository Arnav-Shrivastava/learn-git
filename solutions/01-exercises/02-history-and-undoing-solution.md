# Solution: 02 - History & Undoing

Here are the exact commands to complete the Phase 2 exercise.

**1. Run 'git log --oneline' to see the 3 commits.**
```bash
git log --oneline
```
*Note: Make a note of the hash for the second commit ("Add version 2 feature"), as you will need it later.*

**2. You have unstaged changes in app.txt. View the exact line changes using diff.**
```bash
git diff
```
*Expected output: You will see a `+` next to "WIP code for version 4...".*

**3. You realize you need to fix a bug immediately but aren't ready to commit the WIP code. Stash your changes.**
```bash
git stash
```
*Why: This safely tucks away your WIP code so you can work on a clean slate.*

**4. Check that your working directory is clean using 'git status'.**
```bash
git status
```
*Expected output: "nothing to commit, working tree clean"*

**5. We need to undo the last commit ('Add version 3 with a bug'). We haven't pushed it, so we can rewrite history. Use 'git reset --hard' to go back one commit.**

First, look at the log again:
```bash
git log --oneline
```
Find the hash of the "Add version 2 feature" commit (e.g., `abc1234`). 
Alternatively, `HEAD~1` means "one commit before HEAD".

```bash
git reset --hard HEAD~1
```
*Why: `reset --hard` moves the branch pointer back and forcibly updates the working directory to match that old commit. The "Version 3" mistake is erased.*

**6. Check 'git log --oneline' to verify the mistake commit is gone.**
```bash
git log --oneline
```
*Expected output: Only two commits remain.*

**7. Now that the bug is 'fixed', pop your stashed changes back into your working directory.**
```bash
git stash pop
```
*Why: This applies the changes we stashed earlier and removes them from the stash list. You might see a warning about auto-merging depending on Git's mood, but it should succeed.*

**8. Self-check:**
```bash
cat app.txt
```
*Expected output:*
```
Version 1
Version 2
WIP code for version 4...
```
