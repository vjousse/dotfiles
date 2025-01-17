#!/bin/bash
NERD_FONTS="$( fc-list : family | cut -f1 -d',' | grep Nerd | sort | uniq)"

while read -r font
do
  echo "OUTPUTING $font"
  for range in $(fc-match --format='%{charset}\n' "$font"); do
      for n in $(seq "0x${range%-*}" "0x${range#*-}"); do
          printf "%04x\n" " $n"
      done
  done | while read -r n_hex; do
      count=$((count + 1))
      printf "$font | %-5s \U$n_hex\n" "$n_hex"
      # [ $((count % 10)) = 0 ] && printf "\n"
  done
  printf "\n"
  printf "END OUTPUTING $font"
done <<< $NERD_FONTS
