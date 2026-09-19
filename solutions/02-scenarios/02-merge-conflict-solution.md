# Solution: Scenario 02 - The Messy Merge

**1. Attempt the merge.**
```bash
git merge main
```
*Expected output: CONFLICT (content): Merge conflict in styles.css*

**2. Open `styles.css` in your editor.**
*It will look something like this:*
```css
<<<<<<< HEAD
.header { color: blue; }
.body { margin: 0px; }
=======
.header { color: black; }
.body { margin: 0; display: flex; }
.footer { padding: 50px; }
>>>>>>> main
```

**3. Manually resolve the conflict.**
*Edit the file to keep your blue header, their flex body, and their 50px footer. Remove the Git markers.*
```css
.header { color: blue; }
.body { margin: 0; display: flex; }
.footer { padding: 50px; }
```

**4. Stage the resolved file.**
```bash
git add styles.css
```

**5. Complete the merge.**
```bash
git commit
```
*An editor will pop up with the default merge message. Save and close it.*
