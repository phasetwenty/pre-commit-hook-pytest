#!/bin/sh

if ! type py.test 2>/dev/null; then
    >&2 echo "pytest not found on your PATH. Perhaps you need to activate your virtualenv?"
    exit 1
fi

py.test "$@"
