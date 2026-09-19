# Scenario 2: The Messy Merge

**The Situation:**
You and a teammate were working on the same file (`styles.css`). You were updating the header color on `feature/blue-theme`, and they were updating the footer padding on `main`. 
However, you both accidentally reformatted the middle of the file. You tried to merge, and now Git is screaming about conflicts.

**Your Mission:**
Resolve the merge conflict so that BOTH your new blue header color AND your teammate's new footer padding are kept, and the code isn't broken.

**Instructions:**
1. Run `02-merge-conflict-setup.ps1` to generate the broken repository.
2. `cd` into the practice area.
3. You are currently on the `feature/blue-theme` branch.
4. Try to merge `main` into your branch (`git merge main`).
5. Open `styles.css` and resolve the conflict manually. Keep the `.header { color: blue; }` and `.footer { padding: 50px; }`.
6. Complete the merge.

*(If you get stuck, check `solutions/02-scenarios/02-merge-conflict-solution.md`)*
