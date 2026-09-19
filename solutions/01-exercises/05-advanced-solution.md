# Solution: 05 - Advanced / Recovery

Here are the exact commands to complete the Phase 5 exercise.

**1. Check 'git branch'. The branch is gone.**
```bash
git branch
```
*Expected output: Only `* main` is listed.*

**2. Check 'git log'. Your commit is nowhere to be found.**
```bash
git log --oneline
```
*Expected output: Only the "Initial commit" is visible.*

**3. Don't panic. Run 'git reflog'.**
```bash
git reflog
```

**4. Look for the commit hash.**
*Expected output (will look something like this):*
```
a1b2c3d (HEAD -> main) HEAD@{0}: checkout: moving from feature/auth to main
e4f5g6h HEAD@{1}: commit: feat: add authentication logic
a1b2c3d (HEAD -> main) HEAD@{2}: checkout: moving from main to feature/auth
a1b2c3d (HEAD -> main) HEAD@{3}: commit (initial): Initial commit
```
*You need the hash associated with the "commit: feat: add authentication logic". In this example, it's `e4f5g6h`.*

**5. Use 'git checkout -b recovered-auth \<hash\>' to bring it back to life.**
*(Replace `e4f5g6h` with whatever hash your reflog showed).*
```bash
git checkout -b recovered-auth e4f5g6h
```
*(Or the newer syntax: `git switch -c recovered-auth e4f5g6h`)*

**6. Self-check: Run 'git log --oneline' and verify the commit is back!**
```bash
git log --oneline
```
*Expected output:*
```
e4f5g6h (HEAD -> recovered-auth) feat: add authentication logic
a1b2c3d (main) Initial commit
```
*You have successfully recovered a "deleted" branch using the reflog!*
