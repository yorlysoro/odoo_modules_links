for i in `ls`
do
    if [ -d $i ]
    then
        echo "Update Module $i"
        cd $i
        git reset --hard
        branch=$(git rev-parse --abbrev-ref HEAD)
        git pull origin $branch
        cd ..
    fi
done
