#!/bin/sh

cd source/_posts

for filename in $(ls *.md)
	do
		#标题
	    title=$(grep "title: " $filename | sed -n '1p' | sed -e 's/.*: //g ; s/ /_/g ; s/^_//g ; s/\//-/g ; s/\!/\\!/g')
	    #发文日期
	    time=$(grep "date: " $filename | sed -n '1p' | awk '{printf $2}' )
	    #permalink
	    link=$(grep "permalink: " $filename | sed -n '1p' | awk '{printf $2}' )
	    #新文件名
	    if [ -z "$link" ]; then
	        #newname="$time.$title"
	        newname="$time.$title"
	      else
	        newname="$time.$title.$link"
	    fi
	    #过滤掉名字格式正确的文件
	    if [ "$filename" != "$newname.md" ]; then
	       #开始改名
	       mv $filename $newname.md
	       echo "Rename $filename to $newname.md"
	    fi
done