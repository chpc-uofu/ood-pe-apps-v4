#!/bin/bash

filepath=$HOME/pe-ondemand/data

> ${filepath}/cluster.txt
for cluster in redwood; do
	> ${filepath}/${cluster}.txt
        echo $cluster >> ${filepath}/cluster.txt
done

for allocation in `/uufs/chpc.utah.edu/sys/bin/myallocation | grep "Account:" | awk '{print $(NF-4) ":" $(NF-2) ":" $NF}'`; do

	cluster=`cut -d: -f1 <<< $allocation`
	cluster=${cluster:7:-5}

	account=`cut -d: -f2 <<< $allocation`
	account=${account:7:-5}

	partition=`cut -d: -f3 <<< $allocation`
	partition=${partition:7:-4}

	echo ${account}:${partition} >> ${filepath}/${cluster}.txt
done
sync
