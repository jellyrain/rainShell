#! /bin/bash

# 绝对值：abs 1
function abs() {
    if (($1 >= 0)); then
        return $1
    else
        return $((-$1))
    fi
}

# 最大值：max 1 2
function max() {
    if (($1 > $2)); then
        echo $1
    else
        echo $2
    fi
}

# 最小值：min 1 2
function min() {
    if (($1 < $2)); then
        echo $1
    else
        echo $2
    fi
}

# 四舍五入：第二个参数为保留小数位
function round() {
    if [ -z $2 ]; then
        printf "%.0f\n" $1
    else
        printf "%.$2f\n" $1
    fi
}

# 向下取整：第二个参数为保留小数位
function floor() {
    if [ -z $2 ]; then
        echo "scale=0;$1/1" | bc -l
    else
        echo "scale=$2;$1/1" | bc -l
    fi
}

# 向上取整：第二个参数为保留小数位
function ceil() {
    f=$(floor $1 $2)

    if [ -z $2 ]; then
        echo $(($f + 1))
    else
        if (($(echo "$f < $1" | bc) == 1)); then
            echo "scale=$2;$1/1 + 1/($((10 ** $2)))" | bc -l
        else
            echo $f
        fi
    fi
}

# 幂运算：第一个参数为底数、第二个参数为幂的指数值
function pow() {
    echo $(($1 ** $2))
}

# 平方根：第二个参数为保留小数位
function sqrt() {
    if [ -z $2 ]; then
        echo "scale=0;sqrt($1)" | bc -l
    else
        echo "scale=$2;sqrt($1)" | bc -l
    fi
}

# 随机数：random 10 40 随机数 10 - 40 如果 $2 比 $1 小 就 换位 计算
function random() {
    if (($1 > $2)); then
        echo $(($RANDOM % $1 + $2))
    else
        echo $(($RANDOM % $2 + $1))
    fi
}

# 累加器：第一个参数是累加多少次，第二个参数是初始值（默认为 0），第三个参数是累加量（默认为 1）
function accumulate() {
    if [ -z $2 ]; then
        t1=0
    else
        t1=$2
    fi

    if [ -z $3 ]; then
        t2=1
    else
        t2=$3
    fi

    for i in $(seq $1); do
        let t1+=t2
    done

    echo $t1
}
