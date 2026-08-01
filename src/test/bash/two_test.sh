#!/usr/local/bin/bash
SCRIPT='src/main/bash/two.sh'

echo "Running test for \"${SCRIPT}\"..."

. $asserts/files/execs.sh "${SCRIPT}"

if ! /usr/local/bin/bash -n "${SCRIPT}"; then
 echo "\"${SCRIPT}\" has invalid syntax!" >&2; exit 1; fi

STDOUT="$(mktemp)"
STDERR="$(mktemp)"

#

:> "${STDOUT}"
:> "${STDERR}"
useless='src/main/bash' \
 "${SCRIPT}" > "${STDOUT}" 2> "${STDERR}"
. $asserts/ints/eq.sh "${SCRIPT}" "$?" 0
. $asserts/files/equals.sh "${STDOUT}" '2'
. $asserts/files/empty.sh "${STDERR}"

#

rm "${STDOUT}"
rm "${STDERR}"
