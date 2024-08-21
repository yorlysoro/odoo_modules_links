for i in `ls`
do
    if [ -d $i ]
    then
        rm -rvf $i
    fi
done