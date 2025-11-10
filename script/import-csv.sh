mysqlimport --columns=`head -n 1 "$1"` --ignore-lines=1 $2 $3 "$1" -p
echo $1
