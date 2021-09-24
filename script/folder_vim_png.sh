
for i in *.$1;
do
    ~/script/vim_to_html.sh $i;
    wkhtmltoimage $i.html $i.png;
    echo "Removing $i.html";
    rm $i.html;
done;
