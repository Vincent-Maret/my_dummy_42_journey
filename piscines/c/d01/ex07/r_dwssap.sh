cat /etc/passwd | sed '/#/d' | sed -n 'n;p' | sed -n 's/^\([^:]*\):.*/\1/p' | rev | sed -n "$1,$2p" | tr '\n' ':' | sed 's/:/, /g' | sed 's/, $/./'
