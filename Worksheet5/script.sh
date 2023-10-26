#!/bin/bash


mkdir -p "Worksheet5/UnitedStates"

for CATEGORY in "$@"; do

	while IFS= read -r line; do
		IFS=, read -ra arr <<< "$line"

		 if [[ "${arr[4]}" == "$CATEGORY" && "${arr[7]}" == "United States" ]]; then
			echo "$line" >> "Worksheet5/UnitedStates/$CATEGORY.txt"
		fi
	done < GYS.csv

	echo "$CATEGORY: $(wc -l < "Worksheet5/UnitedStates/$CATEGORY.txt")" >> ws5.txt
done
