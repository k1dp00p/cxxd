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

xxd -p $1 | fold -w 2 |
{
   counter=0
   while read hex; do
      echo -en "\033[48;5;$((16#$hex))m  \033[m"
      ((counter++))
      if [ $((counter % 16)) == 0 ]; then
         echo ""
      fi
   done
   if [ $((counter % 16)) != 0 ]; then
      echo ""
   fi
}
