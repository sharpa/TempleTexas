#!/bin/bash
tail -n +2 data/treatments.csv | cut -f 1 -d ',' - | sed "s/\"//g" > .tmp
while read sample
do
	echo $sample
	wget 'http://metagenomics.anl.gov/metagenomics.cgi?page=MetagenomeOverview&metagenome='$sample'&action=chart_export&name=organism_order_hits&file=download.'$sample'.organism_order_hits' -O data/organism_order_hits.$sample'.tsv' -q &
done < .tmp
rm .tmp