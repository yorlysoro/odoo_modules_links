read -p 'Branch: ' branch

for i in `cat oca_modules_odoo12.txt`
do
    git clone --depth=1 --single-branch --branch=$branch $i
done

for i in `ls`
do
    if [ -d $i ]
    then
        mv -v $i $branch-$i-oca
    fi
done
