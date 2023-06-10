for i in `ls`
do
    if [ -d $i ]
    then
        cd $i
        if [ -e requirements.txt ]
        then
          pip3 install -r requirements.txt
        fi
        cd ..
    fi
done