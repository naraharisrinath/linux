(
DATE=`date "+%b-%g"` 
DAY_DATE=`date "+%d"`

echo "From:Shine[root@shine.cisco.com]"
echo "To: cdf-managers@cisco.com"
echo "Cc: srnaraha@cisco.com"
echo "MIME-Version: 1.0"
echo "Content-Type: multipart/mixed;"
echo ' boundary="PAA08673.1018277622/shine.cisco.com"'
if [ $DAY_DATE = "05" ]; then

    echo "Subject:CDF Metrics" $DATE

else 
	if [ $DAY_DATE = "07" ]; then
    		echo "Subject:Gentle Reminder CDF Metrics" $DATE
	fi
fi
echo ""
echo "This is a MIME-encapsulated message"
echo ""
echo "--PAA08673.1018277622/shine.cisco.com"
echo "Content-Type: text/html"
echo ""
echo "<HTML>
<BODY bgcolor=white>
<blockquote>
<font color=blue size=4>
<p>
Hi All,<br><br>
Please upload cdf metrics data for the month $DATE.</p>

<p>
Regards,<br>
PGM office</font> </p>

</blockquote>
</body>
</html>"

) | /usr/sbin/sendmail -t

