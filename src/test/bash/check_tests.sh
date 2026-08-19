#!/usr/local/bin/bash

TESTS='src/test/bash'

while IFS= read -r -d '' TEST_PATH; do
 if [[ "${TEST_PATH}" == "${TESTS}/checks.sh" \
  || "${TEST_PATH}" =~ ^${TESTS}/check_.+\.sh$ \
  || "${TEST_PATH}" =~ ^${TESTS}/mocks/.+$ \
  ]]; then continue
 elif [[ -L "${TEST_PATH}" || ! -f "${TEST_PATH}" \
  || ! -s "${TEST_PATH}" || ! -x "${TEST_PATH}" \
  || ! "${TEST_PATH}" =~ ^${TESTS}/.+_test\.sh$ \
  ]] || ! /usr/local/bin/bash -n "${TEST_PATH}"; then
  echo "\"${TEST_PATH}\" is not supported!" >&2; exit 1
 fi
 "${TEST_PATH}" || exit 1
done < <(find "${TESTS}" -depth -type f -print0)
