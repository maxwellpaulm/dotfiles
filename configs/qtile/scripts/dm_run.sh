#!/usr/bin/env bash
# Description: The standard dmenu_run command with flags and a prompt.

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

export _JAVA_AWT_WM_NONREPARENTING=1
exec $(dmenu_path | dmenu -l 80 -p 'Run: ' "$@")

