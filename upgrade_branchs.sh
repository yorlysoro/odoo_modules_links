for i in `ls`
do
    if [ -d $i ]
    then
        cd $i
        git pull origin $1
        cd ..
    fi
done
