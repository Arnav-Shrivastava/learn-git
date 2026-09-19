# Solution: Scenario 05 - The Messy Commit

**1. Undo the commit but keep the files.**
```bash
git reset --mixed HEAD~1
```
*(Note: `--mixed` is the default, so `git reset HEAD~1` does the exact same thing).*

*Why: This moves the branch pointer back one commit (erasing the "Stuff" commit from history), and unstages the files, but leaves `db.sql` and `styles.css` exactly as they are in your working directory.*

**2. Stage and commit the database change.**
```bash
git add db.sql
git commit -m "feat: add user database schema"
```

**3. Stage and commit the UI change.**
```bash
git add styles.css
git commit -m "style: add red background"
```

**4. Verify the clean history.**
```bash
git log --oneline
```
*Expected output: You should see your two new, descriptive commits on top of the initial commit.*
