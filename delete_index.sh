#!/bin/bash
while read line
do
    export NAME=$(echo $line | awk '{print $1}')
    export HOSTS=$(echo $line | awk '{print $2}')
    export AUTH=$(echo $line | awk '{print $3}')
    echo "===========NAME: $NAME ===========HOST: $HOSTS ==========="
    curator --config curator-config.yml curator-action-delete-90days-ago-indices.yml
done < ElasticSearch_List.txt