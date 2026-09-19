# Solution: 04 - Remotes & Collaboration

Here are the exact commands to complete the Phase 4 exercise.

**1. First, check your local log. You will only see the initial commit.**
```bash
git log --oneline
```

**2. See what your teammate did WITHOUT modifying files. Run 'git fetch origin'.**
```bash
git fetch origin
```
*Expected output: Text indicating that it unpacked objects and updated the `origin/main` branch pointer.*

**3. Run 'git log origin/main --oneline' to view the teammate's commits.**
```bash
git log origin/main --oneline
```
*Expected output: You will see the "feat: add data fetching" commit that your teammate pushed.*

**4. Check your 'app.js' file. Notice it has NOT changed yet.**
```bash
cat app.js
```
*Expected output: Just `console.log('App started');`*

**5. Now, bring those changes into your local branch by running 'git pull origin main'.**
```bash
git pull origin main
```
*Why: Because we didn't have any divergent local commits, this results in a fast-forward merge.*

**6. Check 'app.js' again. The new code is here.**
```bash
cat app.js
```

**7. Add a new line to 'app.js'.**
*(Open `app.js` in your editor and add `console.log('Done');`)*

**8. Stage and commit it using a Conventional Commit message.**
```bash
git add app.js
git commit -m "feat: add done message"
```

**9. Push your changes back to the remote.**
```bash
git push origin main
```
*(Or simply `git push` if the upstream is already set)*

**10. Self-check: Run 'git log --oneline' to verify your commit is at the top.**
```bash
git log --oneline
```
*Expected output: Your new "feat" commit is at the top of the history, followed by the teammate's commit, followed by the initial commit.*
