i=0
line_num=`cat unfamiliar | wc -l`
while [[ "$i" -le "$line_num" ]]
do
	if [ "$1" = "" ]; then i=$[RANDOM % line_num + 1]; else i=$[i+1]; fi
	line=`sed -n "${i}p" unfamiliar`
	word=`echo "$line" | awk -F \! '{print $1}'`
	tran=`echo "$line" | awk -F \! '{print $2}'`
	score1=`echo "$line" | awk -F \! '{print $3}'`
	score2=`echo "$line" | awk -F \! '{print $4}'`
	if [ "$score1" != "0" -a "$score2" != "0" ]; then
		echo -e "$word\t`dic $word | grep "\[.*\]" | head -n 1`\t$tran"
		say $word
		sleep 1
	fi
done
