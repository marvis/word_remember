i=0
count=0
line_num=`cat unfamiliar | wc -l`
while [[ "$i" -le "$line_num" && $count -lt 100 ]]
do
	if [ "$1" = "" ]; then i=$[RANDOM % line_num + 1]; else i=$[i+1]; fi
	line=`sed -n "${i}p" unfamiliar`
	word=`echo "$line" | awk -F \! '{print $1}'`
	tran=`echo "$line" | awk -F \! '{print $2}'`
	score1=`echo "$line" | awk -F \! '{print $3}'`
	score2=`echo "$line" | awk -F \! '{print $4}'`
	if [ "$score1" != "0" ]; then
		count=$[count+1]
		echo -e "$word\t`dic $word | grep "\[.*\]" | head -n 1`\t$tran"
		say $word
		sleep 1
	fi
done
