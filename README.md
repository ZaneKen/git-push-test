# git-push-test

Throwaway repo used to demonstrate that we can create a local repository,
commit to it, and push it to GitHub from a workstation.

Nothing here is real. No customer data, no internal hostnames, no credentials —
the contents are deliberately meaningless so this can be shown to anyone.

## What this demonstrates

1. `git init` on a local directory
2. Committing in stages, so `git log` shows real history
3. Adding a GitHub remote over SSH
4. `git push -u origin main`

## Layout

```
README.md        this file
hello.sh         a script that prints a greeting
data/sample.csv  a few rows of invented data
notes.md         scratch notes
```

## Try it

```sh
./hello.sh
./hello.sh "your name"
```

## Verifying the push worked

```sh
git log --oneline --graph      # local history
git remote -v                  # where it points
git status                     # should say "up to date with origin/main"
```
