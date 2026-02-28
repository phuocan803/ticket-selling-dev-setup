#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting full environment setup & verification..."
"$SCRIPT_DIR/install-all.sh"
"$SCRIPT_DIR/verify.sh"
