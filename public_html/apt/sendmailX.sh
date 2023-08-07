mailbody="Open https://people.cs.uchicago.edu/~daniar/apt/check.html"
echo "From: daniar.h.k@gmail.com" > /tmp/mailtest
echo "To: daniar@uchicago.edu" >> /tmp/mailtest
echo "Subject: [Important] One Bedroom Apt Available NOW" >> /tmp/mailtest
echo "" >> /tmp/mailtest
echo $mailbody >> /tmp/mailtest
cat /tmp/mailtest | /usr/sbin/sendmail -t	