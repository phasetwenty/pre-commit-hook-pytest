#!/bin/sh

if ! type py.test >/dev/null 2>&1; then
    >&2 echo "pytest not found on your PATH. Perhaps you need to activate your virtualenv?"
    exit 1
fi

echo "py.test $@"
exit 1