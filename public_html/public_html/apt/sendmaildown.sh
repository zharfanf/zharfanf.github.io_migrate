sleep 2
mailbody="SERVER bomblab is DOWN!!"
echo "From: daniar.h.k@gmail.com" > /tmp/mailtest
echo "To: daniar@uchicago.edu" >> /tmp/mailtest
echo "Subject: [Apt Bot-Bomblab] DOWN DOWN $((1 + RANDOM % 1000))" >> /tmp/mailtest
echo "" >> /tmp/mailtest
echo $mailbody >> /tmp/mailtest
cat /tmp/mailtest | /usr/sbin/sendmail -t	
