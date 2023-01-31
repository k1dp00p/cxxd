#!/usr/bin/env bash

#            ///
#           (0<0)
#           (   )
#  _   __    "_"       ___   ___
# | | /_ |   | |      / _ \ / _ \
# | | _| | __| |_ __ | | | | | | |_ __
# | |/ / |/ _` | '_ \| | | | | | | '_ \
# |   <| | (_| | |_) | |_| | |_| | |_) |
# |_|\_\_|\__,_| .__/ \___/ \___/| .__/
#              | |               | |
#              |_|               |_|

help()
{
   echo "usage:"
   echo "   $ ./cxxd.sh [-n bytes] file"
   echo "options:"
   echo "   -h          print this help"
   echo "   -n bytes    display n bytes per line (default 16)"
}

######## handling options
while getopts :hn: option; do
   case $option in
      h | \?)  help
               exit;;
      n     )  n=$OPTARG
               # accepts only positive integers except 0, including 08, 001, etc.
               if echo "$n" | grep -vq "^[0-9]*[1-9][0-9]*$"; then
                  help
                  exit
               fi;;
   esac
done
shift $((OPTIND-1)) # now $1 points to file
n=${n:-16}

######## main
xxd -p -c $n $1 | fold -w 2 |
{
   counter=0
   while read hex; do
      echo -en "\033[48;5;$((16#$hex))m  \033[m"
      ((counter++))
      if [ $((counter % 10#$n)) == 0 ]; then # 10#$n can handle 08, 001, etc.
         echo ""
      fi
   done
   if [ $((counter % 10#$n)) != 0 ]; then
      echo ""
   fi
}
