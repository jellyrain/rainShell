#! /bin/bash

# 判断字符串是否符合正则表达式：符合返回 true 否则返回 false
function test() {
    if [ -z $(echo $2 | grep -oP $1) ]; then
        echo false
    else
        echo true
    fi
}

# 搜索所有符合条件的字符串：第一个参数为 正则表达式，第二个参数为 字符串
function match() {
    echo $(echo $2 | grep -oP $1)
}

# 字符串替换：第一个参数为 正则表达式, 第二个参数为 替换的值，第三个参数为 被字符串
function replace() {
    echo $(echo $3 | sed -r "s/$1/$2/"g)
}

# 分割字符串：第一个参数为 正则表达式，第二个参数为 字符串
function split() {
    echo $(replace $1 ' ' $2)
}
