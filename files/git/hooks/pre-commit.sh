#!/bin/sh

# ===============================================================================================
# GIT HOOK - Run tasks before commit is created
# ===============================================================================================
# FILE:           pre-commit.sh
# USAGE:          N/A
# LICENSE:        MIT
# ===============================================================================================
# CAPITAN:        Andrés Bretón ~ dev@andresbreton.com
# REPO:           https://github.com/bretonics/
# ===============================================================================================

# Exit early if running in CI environments
if [ -n "$CI" ]; then exit 0; fi

# Run tasks against staged files
echo "\nStaged files: \n$(git diff --name-only --staged)\n"
npx lint-staged
