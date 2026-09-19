# Scenario 5: The Messy Commit

**The Situation:**
You got carried away coding. You added a new database schema (`db.sql`) AND you updated the UI styling (`styles.css`). You committed them both in a single commit with the message "Stuff".
Your team leader rejected your Pull Request. They told you: "UI changes and Database changes must be in separate commits!"

**Your Mission:**
Split that one giant messy commit into two clean commits without losing any of the code.

**Instructions:**
1. Run `05-split-commit-setup.ps1` to generate the scenario.
2. `cd` into the practice area.
3. Check `git log --oneline`. You will see the messy commit at the top.
4. "Undo" the commit in a way that keeps the file changes in your working directory (Hint: `git reset --mixed`).
5. Stage and commit `db.sql` separately.
6. Stage and commit `styles.css` separately.
7. Check `git log --oneline` to ensure you now have two clean commits.

*(If you get stuck, check `solutions/02-scenarios/05-split-commit-solution.md`)*
