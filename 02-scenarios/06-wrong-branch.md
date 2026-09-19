# Scenario 6: Committed to the Wrong Branch

**The Situation:**
You were supposed to be building the new login page on a branch called `feature/login`. You got to work, wrote the code, and committed it. 
Then you looked at your terminal and realized you were on `main` the whole time! 

**Your Mission:**
Move that latest commit off of `main` and onto a new branch called `feature/login`, returning `main` to its previous clean state.

**Instructions:**
1. Run `06-wrong-branch-setup.ps1` to generate the scenario.
2. `cd` into the practice area.
3. Check `git log --oneline`. You will see "Add login page logic" at the top of `main`.
4. Create a new branch called `feature/login` pointing to your current location (but don't switch to it yet).
5. Reset `main` back one commit to remove the login changes from it.
6. Switch to `feature/login`.
7. Verify that `main` no longer has the commit, but `feature/login` does.

*(If you get stuck, check `solutions/02-scenarios/06-wrong-branch-solution.md`)*
