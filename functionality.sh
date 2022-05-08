#!/usr/bin/env bash

# id 用法: uuid
uuid() {
    C="89ab"

    for ((N = 0; N < 16; ++N)); do
        B="$((RANDOM % 256))"

        case "$N" in
        6) printf '4%x' "$((B % 16))" ;;
        8) printf '%c%x' "${C:$RANDOM%${#C}:1}" "$((B % 16))" ;;

        3 | 5 | 7 | 9)
            printf '%02x-' "$B"
            ;;

        *)
            printf '%02x' "$B"
            ;;
        esac
    done

    printf '\n'
}

# 进度条 用法: bar 1 10
#           ^----- 已经完成的百分比 (0-100).
#             ^--- 字符总长度.
bar() {
    ((elapsed = $1 * $2 / 100))
    # 创建空格表示的进度条
    printf -v prog "%${elapsed}s"
    printf -v total "%$(($2 - elapsed))s"

    printf '%s\r' "[${prog// /-}${total}]"
}

# 在后台运行
bkr() {
    (nohup "$@" &>/dev/null &)
}
