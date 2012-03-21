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
	ind=1
	word1=`echo "$line" | awk -F \! '{print $1}'`
	tran1=`echo "$line" | awk -F \! '{print $2}'`
	word2=`echo "$line" | awk -F \! '{print $3}'`
	tran2=`echo "$line" | awk -F \! '{print $4}'`
	word3=`echo "$line" | awk -F \! '{print $5}'`
	tran3=`echo "$line" | awk -F \! '{print $6}'`

	if [ "$word1" = "" ]; then word1=$pword1 ; tran1="$ptran1 $tran1"; else if [ "$pword1" != "" ]; then echo -n "$pword1"; say $pword1; sleep 1; echo -e "\t$ptran1"; fi fi
	if [ "$word2" = "" ]; then word2=$pword2 ; tran2="$ptran2 $tran2"; else if [ "$pword2" != "" ]; then echo -n "$pword2"; say $pword2; sleep 1; echo -e "\t$ptran2"; fi fi
	if [ "$word3" = "" ]; then word3=$pword3 ; tran3="$ptran3 $tran3"; else if [ "$pword3" != "" ]; then echo -n "$pword3"; say $pword3; sleep 1; echo -e "\t$ptran3"; fi fi

	pword1="$word1"
	ptran1="$tran1"
	pword2="$word2"
	ptran2="$tran2"
	pword3="$word3"
	ptran3="$tran3"
done

# March 19, line 53 : accessory
