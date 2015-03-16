#!/bin/bash                                                                                                   
for file
	do
	if [ ! -e "$file" ]
		then
		continue
	fi
	
	extension="${file##*.}"
	basename="${file%.*}"
	
	if [ "${extension}" = "mkv" ] ; then
		outputname="${basename}_remuxed.mkv"
	else
		outputname="${basename}.mkv"
	fi

	if [ ! -e "${outputname}" ] ; then
		mkvmerge "${file}" -o "${outputname}"
    else
		echo "Filename already exists"
		today=`date +%Y-%m-%d.%H.%M.%S`
		newname="${basename}_-_${today}.mkv"
		echo "Renaming to ${newname}"
		mkvmerge "${file}" -o "${newname}"
		
    fi
    
done
