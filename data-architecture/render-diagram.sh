#!/usr/bin/env bash
set -euo pipefail

# From the repository root, run: bash data-architecture/render-diagram.sh
# Graphviz must be installed; this converts the DOT source to the PNG used above.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
dot -Gsplines=ortho -Tpng "$script_dir/data-lineage.dot" -o "$script_dir/data-architecture.png"
