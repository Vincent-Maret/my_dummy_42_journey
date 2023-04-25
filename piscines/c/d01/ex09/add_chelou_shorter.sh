n1=\\\'\?\"\\\"\'\\
n1B5=$(echo $n1 | tr \'\\\\\"\?\! '01234' )

n2='rcrdmddd'
n2B5=$(echo $n2 | tr 'mrdoc' '01234' )

echo "ibase=5;obase=D;$n1B5+$n2B5" | bc | tr '0123456789ABCD' 'gtaio luSnemf' 
