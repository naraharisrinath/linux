#!/bin/sh 
#set -vx
BACKUP_DIR="/home/pg-bkp"
cisco="cisco_email_id"
PGHOST="/tmp"
PGUSER="postgres"
export PGPASSWORD="mechanical79"

#Logic to fetch IDs of wipro-cisco employees whose infosec trng incomplete
/opt/PostgreSQL/9.0/bin/psql -h sparkle -U postgres -d MDB -c "SELECT 
master_database.$cisco || '@cisco.com' FROM mdb.master_database
   JOIN mdb.training_2 ON master_database.wipro_emp_no = training_2.emp_no
WHERE master_database.attrition = 'No' AND
    master_database.$cisco IS NOT NULL AND training_2.cisco_infosec IS NULL AND master_database.Non_CDO_Status = 'No';" > $BACKUP_DIR/email_list

echo -e "\nRegards,\nPGM Office" >> $BACKUP_DIR/tmp

#Remove blank lines
sed -i '/^$/d' $BACKUP_DIR/email_list

#Remove first 2 header lines
sed -i 1,2d $BACKUP_DIR/email_list

#Remove last trailer line
sed -i '$d' $BACKUP_DIR/email_list

#Building msg content in html. Using sendmail so that recepient gets html content and not html code
exec< $BACKUP_DIR/email_list
   value=0
   while read line
   do
            value=`expr $value + 1`;
            echo "$value=$line"
            sleep 3
(
echo "From:shine[root@shine.cisco.com]"
echo "To: $line"
echo "MIME-Version: 1.0"
echo "Content-Type: multipart/mixed;"
echo ' boundary="PAA08673.1018277622/shine.cisco.com"'
echo "Subject: Take the Cisco Infosec training and complete the Survey form"
echo ""
echo "This is a MIME-encapsulated message"
echo ""
echo "--PAA08673.1018277622/shine.cisco.com"
echo "Content-Type: text/html"
echo ""
echo "<HTML>
<BODY bgcolor=white>
<blockquote>
<table cellpadding="2"cellpacing="2" width="60%">
<tr>
<td align="center" bgcolor="#365F91"><font face="arial" color=white size=3>
Corporate Security Programs Organization</font><font face= "arial" color=white size=5> Security Advisory</font>
</font>
</td>
</tr>

<tr>
<td bgcolor=white >
<br>
<font bold color=red>Reminder : Take the training and complete the CSPO awareness program - Survey Form*</font>

<p>
<font color=#005467 size=3> Data Classification Markings training</font> </p>
<p>
Complete the Classification Markings training to learn how you can protect Cisco assets as well as personal information. <br>
Training available at url:<font color=blue> http://glms.cisco.com/ems?ssp=OfferingRegistration&id=V0JUMDAyMTkyNjU=</font><br>
</p><p></p>
<p>
<font color=005467 size=3>Inadvertent Disclosure training</font></p>

 
<p>Complete the Inadvertent Disclosure training to learn the tactics that security hackers use to elicit company directory information from unsuspecting employees through P2P. <br>
Training available at url:<font color=blue> http://glms.cisco.com/ems?ssp=OfferingRegistration&id=V0JUMDAyMTkyNjc=</font></p>

<p><font color=red>
AND  </font>
</p>
<P>
Complete this CSPO Partner Awareness Program - Survey Form. Please visit the url http://www.cisco.vovici.com/se.ashx?s=2C85931E15FB887C</P>

<P>
* Note : For those who have completed the Training, take time to complete this survey form. </P>
</td>
</tr>
<tr>
<td align="center" bgcolor="#365F91">
</td>
</tr>
<tr>
<td>
<font color=grey size=2>
<br>
<p>2010 Cisco Systems, Inc. All rights reserved. Cisco Confidential - Internal Use Only</p>

</font>
</td>
</tr>
</table>
</blockquote>
</body>
</html>"
) | sendmail -t
            
   done

#Remove temp files created
rm $BACKUP_DIR/tmp
rm $BACKUP_DIR/email_list
