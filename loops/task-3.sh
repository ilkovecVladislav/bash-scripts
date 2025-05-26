num=1
count=0  

while [ $count -lt 10 ]; do
    if [ $((num % 3)) -eq 0 ]; then
        echo "$num кратно 3"
        count=$((count + 1))
    fi
    num=$((num + 1))
done