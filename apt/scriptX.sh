url=$1
content=$(wget http://rp.uchicago.edu/$1/floorplans.aspx -q -O -)
# echo $content > temp

IFS=$'\n'
counts=($(echo $content | grep -oP '(?<=count"> ).*?(?=<)'   | while read -r line ; do
    res=$(echo "Processing $line" | tr -dc '0-9')
    if [[ $res -eq '' ]]; then
    	echo "0"
    else
    	echo $res
    fi
done))

names=($(echo $content | grep -oP '(?<=name">).*?(?=\r)'))

arraylength=${#names[@]}

for (( i=0; i<${arraylength}; i++ ));
do
  # echo ${names[$i]} " : " ${counts[$i]}
  if [ ${names[$i]} == "One Bedroom" ]; then
  # if [ ${names[$i]} == "Studio" ]; then
  	if [[ ${counts[$i]} -gt 0 ]]; then
  		echo "${counts[$i]}" >> available.txt
      		echo "$url" >> available.txt
		./sendmail.sh
  	fi
  fi
done

