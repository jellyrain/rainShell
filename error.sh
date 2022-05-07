#! /bin/bash

source $(
    cd $(dirname $0)
    pwd
)/rainShell/print.sh

# 注意：导入此库后 如需使用 print库 内容 不需要再次导入

# 自动报错：错误为 一个未知错误
function error() {
    if (($? != 0)); then
        echo $(print_red ERROR): An unknown error has occurred
    fi
    exit
}

# 自定义错误：第一个参数为 错误号，第二个参数为 错误描述, 第三个参数为 错误描述的字体颜色（ 默认为 白色 ）
# 颜色参数为 【 black， red， green， yellow， blue， purple， skyblue 】
function custom_error() {
    error_num=$?
    if (($error_num == $1)); then
        if [ -z $3 ]; then
            echo $(print_red ERROR): $2
        else
            echo $(print_red ERROR): $(print_color $3 $2)
        fi
        exit
    else
        if (($error_num != 0)); then
            echo $(print_red ERROR): An unknown error has occurred
            exit
        fi
    fi
}

# 保存版自定义错误：第一个参数为 错误号，第二个参数为 错误描述，第三个参数为 保存路径
# 格式：时间 - - 错误号 ：错误描述
# 不停止 代码，需要停止 请使用 exit 跳出
function error_file() {
    error_num=$?
    if (($error_num == $1)); then
        echo $(date "+%Y/%m/%d %H:%M:%S") - - $1 : $2 >>$3
    else
        echo $(date "+%Y/%m/%d %H:%M:%S") - - unknown_number : An unknown error has occurred >>$3
    fi
}
