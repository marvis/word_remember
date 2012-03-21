i=1
while [ "1" ]
do 
	line=`sed -n "${i}p" unfamiliar`
	word=`echo "$line" | awk -F \! '{print $1}'`
	tran=`echo "$line" | awk -F \! '{print $2}'`
	score=`echo "$line" | awk -F \! '{print $3}'`
	if [[ $score -gt "0" ]];
	then
		say $word; read line; k=0; while [ "$line" != "$word" -a $k -lt 2 ]; do echo $tran ;say $word; read line; k=$[k+1]; done; echo "$word `dic $word | grep "\[.*\]" | head -n 1` $tran";
	fi
	if [[ "$k" = "2" ]]
	then 
		score=$[score+1]
	elif [[ "$k" = "0" ]]
	then
		score=$[score-1]
	fi
	sed  "${i}s/^.*\$/$word!$tran!$score/" unfamiliar  > .unfamiliar && mv .unfamiliar  unfamiliar
	i=$[i+1]
done
