# Notes

Scratch file. Its real job is to be the third commit, so the history has
more than one shape of change in it.

## Push checklist

- [x] `git init` and set a local `user.name` / `user.email`
- [x] Commit in stages rather than one giant first commit
- [ ] Create the empty repo on GitHub (no README — we already have one)
- [ ] `git remote add origin git@github.com:<owner>/git-push-test.git`
- [ ] `git push -u origin main`

## Gotchas worth mentioning to the team

- **Create the GitHub repo empty.** If you let GitHub add a README or a
  license, its first commit is unrelated to yours and the push is rejected
  as a non-fast-forward. Recovering means a pull with `--allow-unrelated-histories`,
  which is a confusing first impression.
- **`git push -u`** sets the upstream, so later pushes are a bare `git push`.
- **Check what is staged before the first commit.** `git status --short` and
  `git show :<path>` show what git actually has, which is not always what the
  working tree looks like.
- **Anything committed is permanent once pushed.** Deleting a file in a later
  commit does not remove it from history.

## Shell startup: where exported vars actually get read

Tooling that documents "add this to `~/.zshrc`" does not work on a bash box,
and the failure is quiet — the variable is simply empty.

- **`~/.bashrc` returns early for non-interactive shells.** Ubuntu's stock
  `.bashrc` opens with `case $- in *i*) ;; *) return;; esac`. Anything appended
  to the bottom is skipped for cron jobs, `ssh host command`, and agent-run
  shells. Only interactive terminals reach it.
- **`~/.profile` is the one login shells read.** It sources `.bashrc`, but that
  copy still hits the same early return, so exports need their own line here.
- **Put shared exports in one sourced file.** A single
  `~/.config/<name>.env` referenced from both rc files keeps the value in one
  place, and `chmod 600` keeps secrets out of a world-readable dotfile.
- **Verify both modes, not just the terminal you are sitting in.**
  `bash -lc 'echo $VAR'` covers login/non-interactive; `bash -ic 'echo $VAR'`
  covers interactive. Passing one and failing the other is the common case.
