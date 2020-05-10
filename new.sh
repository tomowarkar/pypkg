#!/bin/bash
# @(#) テストファイルとパッケージファイルを一緒に作る
# @(#) Activate:　chmod +x new.sh
# @(#) Usage: ./new.sh hoge

PKG_PATH=src/pkg/
TESTS_PATH=tests/
while (("$#")); do
    [ -d ${PKG_PATH} ] && [ -d ${TESTS_PATH} ] &&
        touch {${PKG_PATH},${TESTS_PATH}test_}$1.py
    shift
done
