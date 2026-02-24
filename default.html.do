basename=$(basename $2)
redo-ifchange "posts/$basename.md"

POST="posts/$basename.md"
# POST="../posts/$2.md"

DATE=$(./post-date.sh "$POST")
TITLE=$(./post-title.sh "$POST")
tail -n +5 "$POST" | cmark-gfm -e footnotes --unsafe --to html > html.temp
cat head.html header.html post_preamble.html html.temp post_postamble.html footer.html | sed -e "s/%PAGE-TITLE%/$TITLE/g" -e "s/%POST-DATE%/$DATE/g" -f site-variables.sed
rm html.temp
