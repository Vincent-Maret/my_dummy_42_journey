#!/opt/homebrew/bin/bash

##################
# n1 from base 5 to 10
##################

declare -A base1
base1["'"]=0
base1["\\"]=1
base1['"']=2
base1["?"]=3
base1["!"]=4

n1=\\\'\?\"\\\"\'\\
n1B10=0

for ((i = 0; i < ${#n1}; i++)); do
  char="${n1:$i:1}"
  digit=${base1[$char]}
  rank=$(( ${#n1} - $i -1 ))
  n1B10=$(($n1B10 + $digit * 5**$rank)) 
done

##################
# n2 from base 5 to 10
##################

declare -A base2
base2['m']=0
base2['r']=1
base2['d']=2
base2["o"]=3
base2["c"]=4

n2='rcrdmddd'
n2B10=0

for ((i = 0; i < ${#n2}; i++)); do
  char="${n2:$i:1}"
  digit=${base2[$char]}
  rank=$(( ${#n2} - $i -1 ))
  n2B10=$(($n2B10 + $digit * 5**$rank)) 
done

##################
# sum of n1 and n2 in base 10
##################

sumB10=$(( $n1B10 + $n2B10 ))

##################
# sum from base 10 to base 13
##################

sumMaxRankB13=0
while [ $(( 13**$sumMaxRankB13 )) -lt $sumB10 ]; do
  sumMaxRankB13=$(( $sumMaxRankB13 + 1 ))
done
sumMaxRankB13=$(( $sumMaxRankB13 - 1 ))

sumB13=''
currentRank=$sumMaxRankB13
rest=$sumB10
while [ $currentRank -ge 0 ]; do
  digitAtCurrentRank=$(( $rest / 13**$currentRank  ))
  sumB13="${sumB13}${digitAtCurrentRank}"
  rest=$(( $rest % 13**$currentRank  ))
  currentRank=$(( $currentRank - 1 ))
done

##################
# from sum in base 13 to sum in custom base 13
##################

declare -A base3
base3['0']='g'
base3['1']='t'
base3['2']='a'
base3["3"]='i'
base3["4"]='o'
base3["5"]=' '
base3["6"]='l'
base3["7"]='u'
base3["8"]='S'
base3["9"]='n'
base3["10"]='e'
base3["11"]='m'
base3["12"]='f'

sumCustomB13=''
for (( i=0; i < ${#sumB13}; i++ )); do
  sumCustomB13="${sumCustomB13}${base3[${sumB13:$i:1}]}"
done

echo $sumCustomB13
