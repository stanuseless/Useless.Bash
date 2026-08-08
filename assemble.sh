#!/usr/local/bin/bash

if [[ $# -ne 1 ]]; then
 echo 'Wrong arguments!' >&2; exit 1; fi

REP_OWNER='stanuseless'
REP_NAME='Useless.Bash'
VERSION='0.4.1'

BUILD_TYPE="$1"
case "${BUILD_TYPE}" in
 'unstable') VERSION_NAME="${VERSION}-UNSTABLE";;
 '') echo 'No build type!' >&2; exit 1;;
 *) echo "Build type \"${BUILD_TYPE}\" is not supported!" >&2; exit 1;;
esac

if [[ -d 'build' ]]; then
 echo 'Build dir exists!' >&2; exit 1; fi

mkdir 'build'
mkdir -p 'build/yml'
SUBJECT='build/yml/metadata.yml'
echo "repository:
 owner: '${REP_OWNER}'
 name: '${REP_NAME}'
version: '${VERSION_NAME}'" > "${SUBJECT}"

if [[ ! -s 'LICENSE' ]]; then
 echo 'No license!' >&2; exit 1; fi

if [[ ! -s 'README.md' ]]; then
 echo 'No readme!' >&2; exit 1; fi

mkdir -p 'build/zip'
SUBJECT="build/zip/${REP_NAME}-${VERSION_NAME}.zip"
zip -Xqr9 "${SUBJECT}" 'src/main/bash' 'LICENSE' 'README.md'
if [[ $? -ne 0 ]]; then
 echo 'Zip error!' >&2; exit 1; fi
