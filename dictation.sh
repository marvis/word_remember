i=`cat progress`
echo "i=$i"
pword1=""
ptran1=""
pword2=""
ptran2=""
pword3=""
ptran3=""
j=$i
file=$1
if [ "$#" = "0" ]; then file=words; fi
if [ ! -e $file -o -z $file ]; then file=words; fi
if [ $file = "words" ];
then
	while [ $i -lt $[j+30] ]
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

		if [ "$word1" = "" ]; then word1=$pword1 ; tran1="$ptran1 $tran1"; else if [ "$pword1" != "" ]; then say $pword1; read line; k1=0; while [ "$line" != "$pword1" -a $k1 -lt 3 ]; do echo $ptran1 ;say $pword1; read line; k1=$[k1+1]; done; echo -n "$pword1"; echo -e "\t$ptran1"; fi fi
		if [ "$word2" = "" ]; then word2=$pword2 ; tran2="$ptran2 $tran2"; else if [ "$pword2" != "" ]; then say $pword2; read line; k2=0; while [ "$line" != "$pword2" -a $k2 -lt 3 ]; do echo $ptran2 ;say $pword2; read line; k2=$[k2+1]; done; echo -n "$pword2"; echo -e "\t$ptran2"; fi fi
		if [ "$word3" = "" ]; then word3=$pword3 ; tran3="$ptran3 $tran3"; else if [ "$pword3" != "" ]; then say $pword3; read line; k3=0; while [ "$line" != "$pword3" -a $k3 -lt 3 ]; do echo $ptran3 ;say $pword3; read line; k3=$[k3+1]; done; echo -n "$pword3"; echo -e "\t$ptran3"; fi fi
		if [[ $k1 -gt "0" ]]; then echo "$k1!$pword1!$ptran1" >> unfamiliar; fi
		if [[ $k2 -gt "0" ]]; then echo "$k2!$pword2!$ptran2" >> unfamiliar; fi
		if [[ $k3 -gt "0" ]]; then echo "$k3!$pword3!$ptran3" >> unfamiliar; fi
		pword1="$word1"
		ptran1="$tran1"
		pword2="$word2"
		ptran2="$tran2"
		pword3="$word3"
		ptran3="$tran3"
	done

	if [ "$pword1" != "" ]; then say $pword1; read line; k1=0; while [ "$line" != "$pword1" -a $k1 -lt 3 ]; do echo $ptran1 ;say $pword1; read line; k1=$[k1+1]; done; echo -n "$pword1"; echo -e "\t$ptran1"; fi
	if [ "$pword2" != "" ]; then say $pword2; read line; k2=0; while [ "$line" != "$pword2" -a $k2 -lt 3 ]; do echo $ptran2 ;say $pword2; read line; k2=$[k2+1]; done; echo -n "$pword2"; echo -e "\t$ptran2"; fi
	if [ "$pword3" != "" ]; then say $pword3; read line; k3=0; while [ "$line" != "$pword3" -a $k3 -lt 3 ]; do echo $ptran3 ;say $pword3; read line; k3=$[k3+1]; done; echo -n "$pword3"; echo -e "\t$ptran3"; fi

	if [[ $k1 -gt "0" ]]; then echo "$k1!$pword1!$ptran1" >> unfamiliar; fi
	if [[ $k2 -gt "0" ]]; then echo "$k2!$pword2!$ptran2" >> unfamiliar; fi
	if [[ $k3 -gt "0" ]]; then echo "$k3!$pword3!$ptran3" >> unfamiliar; fi

	echo $i > progress
else
	while read line
	do :
	done < unfamiliar
fi
# March 19, line 53 : accessory
