#!/usr/bin/env bash

# 打印传入值 字体为 黑色
print_black() {
    echo -e "\033[0;30m$1\e[0m"
}

# 打印传入值 字体为 红色
print_red() {
    echo -e "\033[0;31m$1\e[0m"
}

# 打印传入值 字体为 绿色
print_green() {
    echo -e "\033[0;32m$1\e[0m"
}

# 打印传入值 字体为 黄色
print_yellow() {
    echo -e "\033[0;33m$1\e[0m"
}

# 打印传入值 字体为 蓝色
print_blue() {
    echo -e "\033[0;34m$1\e[0m"
}

# 打印传入值 字体为 紫色
print_purple() {
    echo -e "\033[0;35m$1\e[0m"
}

# 打印传入值 字体为 天蓝
print_skyblue() {
    echo -e "\033[0;36m$1\e[0m"
}

# 自定义颜色：第一个参数为 颜色名，第二个参数为 传入值
# 颜色参数为 【 black， red， green， yellow， blue， purple， skyblue 】
# 如果传入未提供的颜色 返回都是白色
print_color() {
    case $1 in
    'black')
        print_black $2
        ;;
    'red')
        print_red $2
        ;;
    'green')
        print_green $2
        ;;
    'yellow')
        print_yellow $2
        ;;
    'blue')
        print_blue $2
        ;;
    'purple')
        print_purple $2
        ;;
    'skyblue')
        print_skyblue $2
        ;;
    *)
        echo $2
        ;;
    esac
}
