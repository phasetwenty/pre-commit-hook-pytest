#!/bin/bash
#
# A hook that runs a test framework has the problem that it's not interested in the filenames. It does want arguments
# from the hook configuration though. So, this lead-in section before running pytest removes the arguments which are
# filenames, and leaves the rest.
#

if ! type py.test >/dev/null 2>&1; then
    >&2 echo "pytest not found on your PATH. Perhaps you need to activate your virtualenv?"
    exit 1
fi

# Separates an array of strings with the first argument
join_by () { local IFS="$1"; shift; echo "$*"; }

kept_args=()
for arg in "$@"; do
    [ -f "$arg" ] || kept_args+=("$arg")
done

py.test $(join_by " " "${kept_args[@]}")
