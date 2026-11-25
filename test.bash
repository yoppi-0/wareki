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

out=$(echo 2019 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 令和1 ]  || ng "$LINENO"

out=$(echo 2018 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 平成30 ]  || ng "$LINENO"

out=$(echo 1989 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 平成1 ]  || ng "$LINENO"

out=$(echo 1988 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 昭和63 ]  || ng "$LINENO"

out=$(echo 1926 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 昭和1 ]  || ng "$LINENO"

out=$(echo 1925 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 大正14 ]  || ng "$LINENO"

out=$(echo 1912 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 大正1 ]  || ng "$LINENO"

out=$(echo 1911 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 明治44 ]  || ng "$LINENO"

out=$(echo 1868 | ./wareki)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 明治1 ]  || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./wareki)
[ "$?" = 1 ]          || ng "$LINENO"
[ "${out}" = "" ]     || ng "$LINENO"

out=$(echo 1867 | ./wareki)
[ "$?" = 1 ]          || ng "$LINENO"
[ "${out}" = "" ]     || ng "$LINENO"

out=$(echo 20000 | ./wareki)
[ "$?" = 1 ]          || ng "$LINENO"
[ "${out}" = "" ]     || ng "$LINENO"

out=$(echo  | ./wareki)
[ "$?" = 1 ]          || ng "$LINENO"
[ "${out}" = "" ]     || ng "$LINENO"

out=$(echo 2000.5 | ./wareki)
[ "$?" = 1 ]          || ng "$LINENO"
[ "${out}" = "" ]     || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
