#!/usr/bin/env bash
set -euo pipefail

# From the repository root, run: bash data-architecture/render-diagram.sh
# Graphviz must be installed; this writes the source PNG and the package-site copy.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$script_dir/.." && pwd)"
mkdir -p "$repo_dir/man/figures"
dot -Gsplines=ortho -Tpng "$script_dir/data-lineage.dot" -o "$script_dir/data-architecture.png"
cp "$script_dir/data-architecture.png" "$repo_dir/man/figures/data-architecture.png"
