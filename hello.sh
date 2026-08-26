#!/usr/bin/env bash
# Prints a greeting. Exists purely so this repo has something executable in it.
set -euo pipefail

who="${1:-world}"

echo "hello, ${who}"
echo "pushed from $(hostname) on $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
