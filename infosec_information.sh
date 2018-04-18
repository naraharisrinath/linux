(
echo "From:BODC Infosec Communication"
echo "To:"
echo "Cc:"
echo "Bcc:blrodc-staff@cisco.com"
echo "MIME-Version: 1.0"
echo "Content-Type: multipart/mixed;"
echo ' boundary="PAA08673.1018277622/shine.cisco.com"'
echo "Subject: Do's and Don'ts in Cisco ODC"
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
<td align="center" bgcolor="#365F91"><font face="arial" color=white size=5>
INFOSEC COMMUNICATION
</font>
</td>
</tr>

<tr>
<td bgcolor="#76923C" >
<font face="arial" color=white size=4>
<p>
Do<br><br>
</font>
<font face="arial" color=white size=3>
1.  Always wear your badge and ensure visibility at all times while in the facility.<br><br>
2.  Keep workstations locked and secured with a password-protected screensaver while unattended.<br><br>
3.  Ensure latest antivirus is running / enabled on your desktop.<br><br>
4.  Always secure Cisco confidential information and shred all sensitive documents after use.<br><br>
5.  Ensure Cisco Security Agent is enabled on your desktop & Security level is set to medium or high.<br><br>
6.  Ensure periodic restart of your system and there is no failed security updates in Altris Agent > Software Updates.<br><br>
</font>
</p>
</td>
</tr>

<tr>
</tr>
<tr>
</tr>
<tr>
</tr>
<tr>
</tr>

<tr>
<td bgcolor="#EE0000">
<p><font face="arial" color=white size=4>
Do not<br><br>
</font>
<font face="arial" color=white size=3>
1.  Share your account / password with anyone under any circumstances.<br><br>
2.  Forward Cisco email to an external destination.<br><br>
3.  Connect any modems or removable media to the desktop equipment.<br><br>
4.  Leave confidential papers unattended.<br><br>
5.  Allow un-badge persons into ODC area.<br><br>
6.  Use internet to acces Torrent site and for downloads.<br><br>
7.  Download any freeware or unapproved software.<br><br>
8.  Install unlicensed or unapproved software on your desktop.<br><br>
</font>
</p></td>
</tr>
 
<tr>
<td>
<br>
<br>
<font face="arial" color=black size=2>

<p>This is an auto generated mail. Please do not respond to this mail, contact  Program office (pgmoffice@cisco.com) for any assistance.<br><br>For more info please visit http://infosec-extranet.cisco.com</p>
</font>
</td>
</tr>
<tr>
<td align="center" bgcolor="#365F91">
<font face="arial" size=2 color=white>
Wipro Cisco Confidential
</font>
</td>
</tr>
<tr>
<td>
<font face="arial" color="B0B0B0" size=1>Bcc to blrodc-staff<br><br>
</td>
</table>
</blockquote>
</body>
</html>"
) | /usr/sbin/sendmail -t  

