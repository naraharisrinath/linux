(
echo "From:root@shine.cisco.com"
echo "To: lab_primes_cdf@cisco.com"
echo "Cc: cdf-managers@cisco.com hdcruz@cisco.com dishivas@cisco.com hakutty@cisco.com pgmoffice@cisco.com"
echo "MIME-Version: 1.0"
echo "Content-Type: multipart/mixed;"
echo ' boundary="PAA08673.1018277622/shine.cisco.com"'
echo "Subject: Weekend Power Shutdown"
echo ""
echo "This is a MIME-encapsulated message"
echo ""
echo "--PAA08673.1018277622/shine.cisco.com"
echo "Content-Type: text/html"
echo ""
echo "<HTML>
<BODY bgcolor=white>
<blockquote>
<font color=blue>Hi Team,
<p>
Kindly shutdown all <font bold> NON CRITICAL</font> devices during this Weekend and also shutdown the <font color=red>CRITICAL</font> devices which are not necessary during this weekend.</p>
<p> 
Please contact us for any assistance for shutting down the devices.</p>

<p>Requesting all PM's to ensure a lab prime has been nomionated in lab_primes_cdf mailer list for the lab operations & co-ordinate with labadmin. </p>

<p>
Thanks & Regards<br>
Lab Team</font> </p>
<font color=grey size=2>

<p> ************************************************************************************************************************</p>
<p>This is an auto generated mail.  Please do not respond to this mail, contact lab admins (hdcruz, dishivas & hakutty)for any assistance.</p>
<p>*************************************************************************************************************************</p>
</font>

</blockquote>
</body>
</html>"
echo "--PAA08673.1018277622/shine.cisco.com"
) | /usr/sbin/sendmail -t  

