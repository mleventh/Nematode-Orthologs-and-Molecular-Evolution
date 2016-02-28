#!/usr/bin/bash
 cat 1-1-1.orthologs.txt | while read field1 field2 field3 field4; do 
for x in $field2 $field3; do 
	url="http://rest.ensembl.org/sequence/id/$x?"
 	fd="$x.fasta"
 	#echo “Downloading $x to $fd”
 	 curl $url -H "Content-type:text/plain" > “$fd”
echo $url

done

 done

