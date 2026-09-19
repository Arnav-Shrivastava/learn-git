# Scenario 4: The Detached HEAD Panic

**The Situation:**
You wanted to see how the code looked yesterday, so you ran `git checkout <old-commit-hash>`. Git warned you about a "detached HEAD", but you ignored it.
You started coding, wrote a brilliant new algorithm, and even staged the files. But now you realize you aren't on any branch! If you switch back to `main` now, Git might garbage collect your brilliant algorithm because it doesn't belong to any branch.

**Your Mission:**
Save your uncommitted (but staged) work by putting it safely on a new branch.

**Instructions:**
1. Run `04-detached-head-setup.ps1` to generate the scenario.
2. `cd` into the practice area.
3. Run `git status`. You will see you are in a "detached HEAD" state, and you have changes to be committed.
4. Save your work by creating a new branch right where you are.
5. Commit your changes to that new branch.

*(If you get stuck, check `solutions/02-scenarios/04-detached-head-solution.md`)*
