num=3
until [ $num -gt 30 ]; do  # 3 * 10 = 30
    echo "$num кратно 3"
    num=$((num + 3))
done