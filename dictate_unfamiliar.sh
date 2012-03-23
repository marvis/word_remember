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
	if [[ "$score1" -gt "0" ]];
	then
		say $word; read line; k=0; while [ "$line" != "$word" -a $k -lt 2 ]; do echo $tran ;say $word; read line; k=$[k+1]; done; echo "$word `dic $word | grep "\[.*\]" | head -n 1` $tran";
		if [[ "$k" = "2" ]]
		then 
			score1=$[score1+1]
		elif [[ "$k" = "0" ]]
		then
			score1=$[score1-1]
		fi
	fi
	sed  "${i}s/^.*\$/`echo "$word!$tran!$score1!$score2" | sed 's/\//\\\\\//g'`/" unfamiliar  > .unfamiliar && mv .unfamiliar  unfamiliar
done
