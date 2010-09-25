#!/bin/sh -ex

docs="README"

for i in $docs
do
	asciidoc -o $i.html $i
done

echo "okay?"
read junk

for i in $docs
do
	html2wiki --encoding UTF-8 --dialect MoinMoin $i.html >$i.wiki
	sed -i '3i[[PageOutline]]\n' $i.wiki
	sed -i 's/\&gt;/>/g' $i.wiki
	kwrite --encoding UTF-8 $i.wiki
done
