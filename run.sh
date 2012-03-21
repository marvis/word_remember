#i=0
i=52
pword1=""
ptran1=""
pword2=""
ptran2=""
pword3=""
ptran3=""

while [ 1 ]
do 
	i=$[i+1]
	line=`sed -n "${i}p" words`
	echo $line | sed 's/!/	/g'
	ind=1
	word1=`echo "$line" | awk -F \! '{print $1}'`
	tran1=`echo "$line" | awk -F \! '{print $2}'`
	word2=`echo "$line" | awk -F \! '{print $3}'`
	tran2=`echo "$line" | awk -F \! '{print $4}'`
	word3=`echo "$line" | awk -F \! '{print $5}'`
	tran3=`echo "$line" | awk -F \! '{print $6}'`

	if [ "$word1" = "" ]; then word1=$pword1;fi
	if [ "$word2" = "" ]; then word2=$pword2; fi
	if [ "$word3" = "" ]; then word3=$pword3; fi

	if [ "$word1" != "" ]; then echo $word1; say $word1; sleep 0.5; fi
	if [ "$word2" != "" ]; then echo $word2; say $word2; sleep 0.5; fi
	if [ "$word3" != "" ]; then echo $word3; say $word3; sleep 0.5; fi
	clear

	pword1="$word1"
	ptran1="$tran1"
	pword2="$word2"
	ptran2="$tran2"
	pword3="$word3"
	ptran3="$tran3"
done

# March 19, line 53 : accessory
