# Solution: Scenario 06 - Committed to the Wrong Branch

**1. Create the new branch where you are right now.**
```bash
git branch feature/login
```
*Why: A branch is just a sticky note. You just placed a sticky note called `feature/login` on the current commit ("Add login page logic"). You haven't moved yet.*

**2. Reset 'main' back one commit.**
```bash
git reset --hard HEAD~1
```
*Why: You are still on `main`. This command rips the `main` pointer backward by one commit, and forcibly updates your working directory to match. The "Add login page logic" commit is now gone from `main`.*

**3. Switch to the new branch.**
```bash
git switch feature/login
```
*Because we created this branch pointer in step 1 before we reset `main`, the commit wasn't lost! It's safely living on this branch.*

**4. Verify the fix.**
```bash
git log --oneline --all --graph
```
*Expected output: You will see `main` pointing to the Initial commit, and `feature/login` pointing to the new login commit ahead of it.*
