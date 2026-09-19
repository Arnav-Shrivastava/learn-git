# Solution: Scenario 03 - The Force Push Disaster

**1. Check the damage.**
```bash
git log --oneline
```
*You only see "Your awesome feature" and "Initial commit". Alice's work is gone.*

**2. Find Alice's commit in the reflog.**
```bash
git reflog
```
*Look for the line where you originally pulled her code, something like:*
`abc1234 HEAD@{2}: pull origin main: Fast-forward`
*Or look for the commit message "feat: Alice's awesome feature". Note the hash (e.g., `abc1234`).*

**3. Recover her commit by creating a branch pointing to it.**
```bash
git branch alices-work abc1234
```

**4. Merge her work back into main.**
```bash
git merge alices-work
```
*(An editor will pop up for the merge commit message. Save and close it).*

**5. Push the combined work back to the remote (safely this time).**
```bash
git push origin main
```
*Peace is restored.*
