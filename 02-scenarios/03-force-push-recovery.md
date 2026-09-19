# Scenario 3: The Force Push Disaster

**The Situation:**
Your teammate "Alice" worked hard on a feature and pushed it to `main` on the remote server. 
Meanwhile, you rebased your local `main` branch to clean up some of your own commits. When you tried to push, Git rejected it. So, you used `git push --force`. 
Alice is now yelling because her commits are completely gone from the remote server.

**Your Mission:**
Use your local knowledge (the reflog) to find Alice's lost commit, combine it with your work, and push it back safely to restore peace.

**Instructions:**
1. Run `03-force-push-setup.ps1` to generate the scenario.
2. `cd` into the practice area.
3. Check `git log --oneline --all`. Alice's commit ("feat: Alice's awesome feature") is not on `main`. 
4. Check your `git reflog`. Find the hash of Alice's commit (it was the tip of `origin/main` before you forced the update).
5. Recover her commit onto a temporary branch, merge it into `main`, and push it normally.

*(If you get stuck, check `solutions/02-scenarios/03-force-push-recovery-solution.md`)*
