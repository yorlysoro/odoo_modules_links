for i in `ls`
do
    if [ -d $i ]
    then
        echo "Update Module $i"
        cd $i
        git pull origin $1
        cd ..
    fi
done
