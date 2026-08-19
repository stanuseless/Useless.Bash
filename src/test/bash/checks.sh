#!/usr/local/bin/bash

if [[ $# -ne 1 ]]; then
 echo 'Wrong arguments!' >&2; exit 1; fi

BUILD_VARIANT="$1"

if [[ ! -d "${asserts}" ]]; then
 echo 'No asserts!' >&2; exit 1
elif [[ ! -d "${mocks}" ]]; then
 echo 'No mocks!' >&2; exit 1
fi

TESTS='src/test/bash'

case "${BUILD_VARIANT}" in
 'unstable');;
 'release')
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

  . ${TESTS}/check_coverage.sh
  . ${TESTS}/check_license.sh
 ;;
 '') echo 'No build variant!' >&2; exit 1;;
 *) echo "Build variant \"${BUILD_VARIANT}\" is not supported!" >&2; exit 1;;
esac

. ${TESTS}/check_readme.sh

echo 'All tests passed.'
