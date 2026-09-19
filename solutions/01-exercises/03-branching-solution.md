# Solution: 03 - Branching

Here are the exact commands to complete the Phase 3 exercise.

**1. Create a new branch called 'feature-header' and switch to it.**
```bash
git switch -c feature-header
```

**2. Edit 'index.html'. Change '\<h1\>Welcome\</h1\>' to '\<h1\>Welcome to Git\</h1\>'.**
*(Open `index.html` in your editor and make the change)*

**3. Add and commit this change with message 'Update header'.**
```bash
git add index.html
git commit -m "Update header"
```

**4. Switch back to the 'main' branch.**
```bash
git switch main
```
*Notice how if you look at the file now, it says `<h1>Welcome</h1>` again! Your other changes are safely on the feature branch.*

**5. Edit 'index.html' again. Change '\<h1\>Welcome\</h1\>' to '\<h1\>Hello World\</h1\>'.**
*(Open `index.html` in your editor and make the change)*

**6. Add and commit this change with message 'Change header to Hello World'.**
```bash
git add index.html
git commit -m "Change header to Hello World"
```

**7. Now, try to merge 'feature-header' into 'main'.**
```bash
git merge feature-header
```
*Expected output: "CONFLICT (content): Merge conflict in index.html. Automatic merge failed; fix conflicts and then commit the result."*

**8. You will get a CONFLICT! Open 'index.html' in your text editor.**
*Inside `index.html`, you will see something like this:*
```html
<html>
<body>
<<<<<<< HEAD
  <h1>Hello World</h1>
=======
  <h1>Welcome to Git</h1>
>>>>>>> feature-header
</body>
</html>
```

**9. Resolve the conflict manually.**
*Edit the file to look like this (remove the markers and pick the text you want):*
```html
<html>
<body>
  <h1>Hello World to Git</h1>
</body>
</html>
```

**10. Add 'index.html' to the staging area and run 'git commit' to finalize the merge.**
```bash
git add index.html
git commit -m "Merge feature-header and resolve conflict"
```

**11. Self-check: Run 'git log --graph --oneline' to see the branching and merging visually.**
```bash
git log --graph --oneline
```
*Expected output: A visual graph showing the two branches splitting from the initial commit and joining back together at the merge commit.*
