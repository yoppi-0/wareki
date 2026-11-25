#!/bin/bash
# SPDX-FileCopyrightText: 2026 yoppi-0
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目のテスト失敗
    res=1
}

res=0

### NORMAL INPUT ###
out=$(echo 2026 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 令和8 ]  || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./wareki)
[ "$?" = 1 ]          || ng "$LINENO"
[ "${out}" = "" ]     || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
