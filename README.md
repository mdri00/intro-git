In this tutorial, by groups of two, you play the role of Alice and Bob, two biologists who want to code an ambitious R project to be able to add two integer numbers. Scenarios inspired by real-life collaboration situations allow to present basic and intermediate functionalities of version control with git coupled with sharing with GitHub. The tutorial is voluntarily focused on **collaboration**, meaning that basic git operations that are typically also done in single-user projects are introduced in a collaborative context.

Don't panic.

Start by deciding who plays who (most importantly, decide which computer is Alice's and which one is Bob's). For context, Alice is an experienced ecologist, that has been working for longer than Bob (mirroring a supervisor/student duo). Bob's main project currently is the task of adding two numbers. Because of a lack of available office space in Alice's institute, Alice and Bob do not work in the same building and therefore can't share code in person via USB sticks. The university e-mail server is also broken: they can't share code via email. They HAVE to use GitHub.

Bullet points at the start of sections highlight specific topics covered by the tutorial. Feel free to ask your favorite LLM chatbot about them !

 - :golf: Course of the scenario
 - :computer: Activity to do on your computers
 - :clipboard: Definition or technical explanation

# Scenario 0 : Starting the tutorial

 - `fork`, `clone`
 - inviting collaborators to a project
 
:golf: Bob searched the internet for existing projects and found one project that looks like a good place to start from. It's this tutorial's page !

:computer: Connected to their GitHub account, they `fork` the repository: it creates an identical repository in Bob's personnal account. Bob adds Alice's GitHub account as collaborator to their fork, via Settings > Collaborators > Add people.

:clipboard: With Rstudio, you can `clone` the repository : import the code files and the git project on your personal computer in a dedicated folder.

:computer: File > New Project > Version control > Git: fill in Bob's fork URL and create the project. Alice and Bob clone the project on their two computers.

# Scenario 1 : adding modifications, one person at a time

:golf: Bob (wisely) decides to develop the project step-by-step and starts by writing a function to add 2 to any number. After writing the function, Bob wants to share it with Alice.

## 1a - record changes with git, share them

- create a commit with `git add` and `git commit`
- publish your commits to the remote server via `git push` and import them with `git pull`

:computer: Bob writes the new "add_two" function in, saves the file and adds the change to staging with `git add` (check the "Staged" box in the Rstudio Git panel). Once Bob is satisfied with the update, they can `commit` the changes : click on "commit" in the Git panel, write an informative commit message and click on commit. The changes are now tracked in Bob's local git project.

:computer: Bob shares the commit(s) with Alice : click on `push` to publish the local commits on GitHub. To see the new version, Alice clicks on `pull`. Check that the code on Alice's computer now matches the modifications the Bob `commit`ed and  `push`ed.

:computer: What if Alice wants to add a comment to the new code ? After `pull`ing Bob's changes, Alice can make new changes, for example adding a comment, `add` the file, `commit` the change, and `push` it. Don't forget to also `pull` Alice's changes on Bob's computer !

## 1b - falling back to older versions

- `git log`, `git checkout`

:golf: The next day, Bob realises that there is probably a better solution for the project than to manually write a function for each integer that could possibly be added.

:computer: Bob checks the commit history (also called `git log`, History button in the Git panel), and Bob can click on the commit before the commit where they added the new function. Click on "view file": you can see the file as it was before !

:clipboard: The weird characters next to "view file" are the `commit hash`: they uniquely idendify each commit in the project.

:computer: Bob can copy-paste the old version and paste it in place of the new one, and create a commit that says that Bob falled back to an older version. Don't forget to `push` this change to GitHub and `pull` it to Alice's computer ! 

:clipboard: (Optional) Alternatively, typing `git checkout <hash>` in the terminal allows to restore the working directory to how it was at the specific commit hash. Type `git checkout main` to go back to the current state. Typing `git revert <hash>` in the terminal creates a commits that cancels the changes of the given commit. Reverting several commits at once is possible with `git revert <hash1> <hash2> <hash3>`.

# Scenario 2: adding changes at the same time: working with several branches

:golf: Some time later, Bob is almost done with the project ! They created (at least) two new commits, where Bob created a new function that adds two numbers. They also added lines in main.R to try out some additions.

:computer: Do these changes, create `commit`s, `push` them and `pull` the new version on Alice's computer.

## 2a - create branches and navigate between them

- `branch`, `checkout`

:golf: After a few tests, Bob realises that their function is not very computationally efficient and wants to improve it. However, Alice needs the existing version to stay available on GitHub because she's leaving for a seminar where she wants to show other people how to add integers. She also wants to be able to add more examples to main.R.

:clipboard: Working with alternative versions of the project requires `branches`: a branch is a reference to a commit. You can see the branch you are currently working on in the top-right of the git panel, next to the refresh icon. Alice and Bob were actually on branch main all this time ! While "on branch main", every new commit updates the "main" branch to point to that new commit. 

:computer: Alice and Bob agree that they will work separately on the two files, on two separate branches : Alice creates a branch (git panel > new branch), called "alice-examples". Be sure to tick "Sync branch with remote" so that the new branch is also created on GitHub. Bob creates a branch called "bob-optim" and commits an optimized version of their function there.

:computer: Alice can thus work on their new examples in main.R while using the old version of R/functions.R and `push` them, while Bob can work on their optimisation in R/main.R and `push` them. Take some time to compare the state of the project between Alice's computer, Bob's computer, the "alice-examples", "main" and "bob-optim" branches on GitHub while you commit the changes and push/pull them.

## 2b - reuniting branches locally

- `merge`

:golf: Bob is happy with the optimisation changes and wants to integrate them in the "main" branch so that Alice can benefit from the performance gains.

:computer: On Bob's computer, select the "main" branch with the arrows in the top-right corner of the git panel. Type `git merge bob-optim` in the terminal.

:clipboard: Because there are no other recent commit on the main branch since the "bob-optim" branched out, the merge is "fast-forwarded": "main" is updated to point to the last commit of "bob-optim".

:computer: Bob can `push` from the main branch. Go to the GitHub page : changes that were done on the "bob-optim" branch are now integrated in the new version of the "main" branch ! Alice can pull the new version of the main branch.

## 2c - reuniting branches on the remote server

- compare published branches with `Pull Requests`

:golf: Alice would also like to add their changes to the main branch. However, look at the history on Alice's "alice-examples" branch and compare them to the commit history on branch main: the commits that Bob added are on the main branch, but not on Alice's branch.

:clipboard: Reuniting branches with non-trivial differences is hard. To make sure that reuniting will not erase your collaborator's work, it is better to compare branches **as they are on the server** rather than playing around with other people's work locally and then pushing.

:computer: From Alice's GitHub account, go to the server's "alice-examples" branch and create a pull request to Bob's main branch. GitHub will automatically check that the new examples are not erasing any work done by Bob on the main branch. There even is a comment section so that Bob can provide feedback to Alice's changes and agree to `merge` the changes. Just a heads up: GitHub issues and pull requests in public repositories such as Bob's fork are accessible to anyone with an Internet access, think about what you're posting.

:clipboard: Unlike the fast-forward merge of the previous section, GitHub creates a new commit that unites Alice's branch with the main branch.

:computer: After the PR is merged, Alice and Bob can `pull` the updated main branch and end up with the same version of their two sets of changes on their respective computers.

:golf: If you're done early, feel free to play around a bit more. Here's a challenge: what if Bob and Alice had made changes in the same file instead of having worked separately ? Try it out !

## Bonus - collaborate with the community outside of your team

:golf: Now that Bob's project is working, wouldn't it be great to suggest it as an upgrade to the original repository's maintainer
 ? Alice or Bob can start the discussion by raising an issue in the [issues](https://github.com/jguerber/intro-git/issues) section, or directly create a pull request to my repository's main branch.