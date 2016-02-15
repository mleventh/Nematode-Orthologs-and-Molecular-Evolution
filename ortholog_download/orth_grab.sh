#!/usr/bin/bash
cat full_orthologs.txt | while read id; do 
	url=”http://rest.ensembl.org/sequence/id/$id?”
	filepath=”$id.fasta”
	echo “Downloading $id to $filepath”
curl ‘$url’ -H 'Content-type:text/plain' > “$filepath” 

