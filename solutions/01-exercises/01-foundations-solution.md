# Solution: 01 - Foundations

Here are the exact commands to complete the Phase 1 exercise.

**1. Initialize a git repository here.**
```bash
git init
```
*Why: This creates the hidden `.git` directory which turns a normal folder into a Git repository.*

**2. Create a file named 'hello.txt' containing the text 'Hello Git!'.**
```bash
echo "Hello Git!" > hello.txt
```

**3. Check the git status.**
```bash
git status
```
*Expected output: It will say "Untracked files:" and list `hello.txt` in red.*

**4. Add the file to the staging area.**
```bash
git add hello.txt
```
*Why: We must stage files before they can be committed. Running `git status` now would show it in green under "Changes to be committed".*

**5. Commit it with the message 'Initial commit'.**
```bash
git commit -m "Initial commit"
```
*Why: This takes the snapshot of the staging area and permanently saves it to the repository's history.*

**6. Create a '.gitignore' file configured to ignore '*.log' files.**
```bash
echo "*.log" > .gitignore
```

**7. Create a file named 'test.log' and run 'git status' to ensure it is ignored.**
```bash
echo "Some log data" > test.log
git status
```
*Expected output: You will see `.gitignore` listed as an untracked file, but `test.log` will **not** appear at all, because Git is ignoring it.*

**8. Add and commit the '.gitignore' file.**
```bash
git add .gitignore
git commit -m "Add gitignore to ignore log files"
```

**9. Run a git log command to view the commit history in a one-line, compact format.**
```bash
git log --oneline
```
*Expected output: Two commits listed, something like:*
```
a1b2c3d Add gitignore to ignore log files
e4f5g6h Initial commit
```

**10. Self-check:** You should see exactly 2 commits in the log.
