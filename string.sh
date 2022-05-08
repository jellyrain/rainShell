#!/usr/bin/env bash

# 百分号编码字符串
urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for ((i = 0; i < ${#1}; i++)); do
        : "${1:i:1}"
        case "$_" in
        [a-zA-Z0-9.~_-])
            printf '%s' "$_"
            ;;

        *)
            printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}

# 解码用百分比编码的字符串
urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}

# 将字符串转换为大写
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}

# 将字符串转换为小写
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}

# 反转字符串大小写
reverse_case() {
    # Usage: reverse_case "string"
    printf '%s\n' "${1~~}"
}

# 删除字符串前后空格
trim() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}