
j=$1
mkdir old new
for i in $(seq -w $1 2 $2 );
do
  left=$i.jpg;
  right=$(printf %03d $(expr $i + 1)).jpg

  echo $j
  name=$(printf %03d $j).jpg
  # echo $name
  convert +append "$left" "$right" new/$name
  mv $left $right old/
  j=$(expr $j + 1)
done

