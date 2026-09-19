# Solution: Scenario 01 - Large File Accident

**The Goal**: Remove `database.sql` from the most recent commit without losing the other changes (`app.js`).

**1. Check the history to see the damage.**
```bash
git log --stat
```
*You will see that the latest commit includes both `app.js` and the massive `database.sql`.*

**2. Remove the file from Git's tracking (staging area), but keep it on your hard drive (optional, if you still need it).**
```bash
git rm --cached database.sql
```
*Note: If you just want to delete it entirely from your computer too, use `git rm database.sql` or standard file deletion.*

**3. Amend the previous commit.**
```bash
git commit --amend --no-edit
```
*Why: `--amend` takes whatever is currently in the staging area and replaces the last commit. Because we just removed `database.sql` from the staging area, the new commit will only contain `app.js`. The `--no-edit` flag just reuses the same commit message.*

**4. Update `.gitignore` so it doesn't happen again.**
```bash
echo "*.sql" > .gitignore
git add .gitignore
git commit -m "Ignore sql files"
```

**5. Verify the history.**
```bash
git log --stat
```
*The large file is now completely gone from the commit history.*
