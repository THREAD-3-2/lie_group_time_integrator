# Workshop

Question policy:
- please just ask (at the end of a section/sentence if you have a question that pertains to it)
- if you prefer not to ask directly, you may write in the chat

Three contexts:
- general information
- example project: https://github.com/THREAD-3-2/example_gni_project
- your own (test) project to be created

Sometimes we will copy pieces from the example project.


## 12:00 - 12:10 GitHub organization 

https://github.com/THREAD-3-2


### Organization members

https://github.com/orgs/THREAD-3-2/people

- make sure you belong to the organization
- perhaps adjust display name of your own profile?!


### Create your repository

- choose a (meaningful) name
- add `README.md`, `.gitignore`, `LICENSE`
- about (description)
- settings (features)


## 12:10 - 12:30 Introduction to Git

GitHub is a hosting service for Git repositories.
Git is a decentralized version-controlled "file system".


### Essential Git concepts

- repository
    - a folder with a `.git` subfolder which contains the data structures of Git
    - related non-Git concept: a repository/project on GitHub/GitLab (central copy of a Git repository + extras)
- remote
    - (typically one) central copy of the repository
    - default name: `origin`
- most important data structures
    - tree (represents items of a folder)
        - every folder (except for the main folder) has a parent folder (trees form a tree data structure)
    - blob (represents the data of files)
    - commit (represents a snapshot of the main folder including all subfolders and files)
        - every commit (except for the root commit) has a parent commit (commits form a tree data structure)
    - tag (represents a reference to a commit)
        - automatic tags (e.g. HEAD refers to the latest commit)
        - manual tags (typically refer to distinguished 'versions')
- working directory
    - the regular files in your project folder (excluding the `.git` folder)
- staging area / index
    - list of files (or hunks) which will go into a new commit
    - commit is actually not exactly a snapshot of your working directory
    - you control what you want to commit
    - `.gitignore` file
- branch
    - a repository/project may be developed along different lines simultaneously
    - therefore it may have a diverging commit history (commits can form a tree rather than merely a linked list)
    - a branch is an automatic tag referring to some leaf node in the commit tree
    - good practice to keep `main` branch in a working state and to use 'feature branches' for development
- merge
    - integrate commits from another branch (into the currently active branch)
    - fast forward merge (if the branch to be integrated is simply a continuation, no diverging commits)
- optional: rebase
    - allows you to make a diverging history linear by automatically rewriting the commit history (of a feature branch to be merged)
    - allows you to clean up your commit history (squash and reword)
    - rebase -> fast forward merge


## Essentials Git commands

- clone (a repository from a remote)
    `git clone git@github.com:THREAD-3-2/example_gni_project.git`
    `git clone https://github.com/THREAD-3-2/example_gni_project.git`
- add (stage files or hunks)
    `git add .` or
    `git add -p`
- commit (staged)
    `git commit -m "initial commit"
- diff (compare commits, index, working directory)
    `git diff`
- push (current branch to `origin`)
    `git push`
- pull (new commits on current branch from `origin`)
    `git pull`
- (create a new) branch
    `git branch feature_branch`
- switch (to the given branch)
   `git switch feature_branch` 
- merge (given branch into current branch)
    `git merge feature_branch`
- rebase (current branch on top of given branch)
    `git rebase main`


- `man git-diff` (view manual for `git diff`)


# Environment

- Unix-like: Linux or macOS or Windows Subsystem for Linux 2
- VisualStudioCode (embedded terminal window, Git integration)

Me:
- Linux or macOS
- terminal first (rather than IDE first)
- Zsh + Oh My Zsh (rather than Bash, today I try not to use aliases)
- tmux terminal multiplexer and NeoVim editor (rather than VS Code)


## 12:30 - 12:40 Structure of the example project 

https://github.com/THREAD-3-2/example_gni_project

```sh
cd ~/git/MarkusLohmayer/
git clone git@github.com:THREAD-3-2/example_gni_project.git
cd example_gni_project
```

```sh
cd ~/git/MarkusLohmayer/
git clone git@github.com:THREAD-3-2/foo-bar.git
cd foo-bar
```


### High-level overview

- repository contains
    - Python (and/or MATLAB) source code
    - source files for documentation
    - automated tests
- GitHub workflows
    - builds documentation
    - runs automated tests
- GitHub Pages
    - hosts documentation (HTML output)


### Overview of main folder

- `.github/workflows` (define automated workflows, continuous integration)
- `docs` (configuration and source files for documentation)
- `example_gni_project` (Python package folder)
- `matlab_src` (MATLAB code folder, just call it `src` for a pure MATLAB project)
- `tests`, `mypy.ini` (automated tests, optional)
- `.gitignore`, `LICENSE`, `README.md` (must have)
- `requirements.txt` (Pyhon packages required for development and continuous integration)
- `setup.py`, `setup.cfg` (needed to define a Python package)


### Python virtual environment and requirements file

```sh
cat requirements.txt
python
python3
which python3
python3 -m venv venv
. ./venv/bin/activate
which python
which pip
pip install ipython
pip install -r requirements.txt
```


# 12:40 - 13:20 Introduction to Sphinx documentation generator

https://www.sphinx-doc.org


```sh
sphinx-quickstart 
cd docs
make html
```

```sh
cp ../../example_gni_project/docs/conf.py .
git diff
```

https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html

```sh
cp ../../example_gni_project/docs/index.rst .
git diff
```


# 13:20 - 13:50 Continuous Integration and GitHub Pages

```sh
mkdir -p .github/workflows
cd .github/workflows
rm -r .github/workflows
take .github/workflows
cp ../../example_gni_project/.github/workflows/main.yml
```


## actions

https://github.com/actions/checkout

https://github.com/actions/setup-python

https://github.com/JamesIves/github-pages-deploy-action


## GitHub Pages

branch: `gh-pages`

```sh
git fetch origin gh-pages
git switch gp-pages
touch .nojekyll
git add .nojekyll
git commit -m "add .nojekyll file"
git push
```

## badges in Readme

- workflow status badge
    Actions / pick workflow / ... / Create status badge
- badge as link to docs
    https://img.shields.io/badge/docs-green.svg)


# 13:50 - 14:10 Documenting MATLAB code

https://github.com/sphinx-contrib/matlabdomain


## Other languages

Fortran domain for Sphinx:
https://github.com/VACUMM/sphinx-fortran

Julia: 
https://github.com/JuliaDocs/Documenter.jl


# 14:10 - 14:30 Q&A 


