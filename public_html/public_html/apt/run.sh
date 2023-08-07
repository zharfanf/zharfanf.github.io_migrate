# run this ./run.sh &
# stop: kill -9 $(cat pid)

echo $$ > pid
echo "Process ID: " $$

n=0
./sendmailalive.sh
while [[ true ]]; do
	let "n++"
	urls=("6022-s-drexel-ave"
		"fairfax"
		"6054-56-s-ingleside-ave-920-28-e-61st-st"
		"6051-57-s-drexel-ave-906-14-e-61st-st"
		"6019-s-ingleside-avenue"
		"6044-52-s-ingleside-ave"
		"stein"
		"cloisters"
		"5482-s-greenwood-ave"
		#"5301-23-s-kimbark-ave"
	)
	arraylength=${#urls[@]}
	for (( i=0; i<${arraylength}; i++ ));
	do
		# echo ${urls[i]}
		./script.sh ${urls[i]}
	done
	sleep 40
	
# if [[ $(curl -Is http://bomb.cs.uchicago.edu:15213 | head -1 | wc -l) -gt 0 ]]; 
 # then
   # echo "it's ONline"; 
  # export LC_ALL=en_US.UTF-8;
  #else
   #./sendmaildown.sh
# fi

	if [[ $n -gt 400 ]]; then
		n=0
      	./sendmailalive.sh
	fi
done
