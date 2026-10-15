#!/usr/bin/env bash
set -euo pipefail;
for module in $(find . -type f -name '*.nix'); do nixfmt $module; done;
