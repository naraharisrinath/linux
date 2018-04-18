#!/bin/sh 
#set -vx
#This script disables the access of the users whose date od leaving ODC #field has been updated from Technical Managers
BACKUP_DIR="/home/pg-bkp"
PGHOST="/tmp"
PGUSER="postgres"
export PGPASSWORD="mechanical79"

echo -e "Hi Access Team,\n\nPlease disable all access for below mentioned employees\n\nLocation: K2, S3 and all CISCO labs\n\n" > $BACKUP_DIR/tmp

#Connection to PostgreSQL server and execute the SQL statement
/opt/PostgreSQL/9.0/bin/psql -h sparkle -U postgres -d MDB -c "Select emp_details.wipro_emp_no, master_database.smart_card_no, emp_details.emp_name from mdb.emp_details inner join mdb.master_database on emp_details.wipro_emp_no=master_database.wipro_emp_no INNER JOIN mdb.checklist on master_database.wipro_emp_no = checklist.wipro_emp_no AND master_database.doj_cisco=checklist.doj_cisco where access_disabling_dt<=CURRENT_DATE AND checklist.access_disable='Provided'" >> $BACKUP_DIR/tmp

echo -e "\nRegards,\nSrinath" >> $BACKUP_DIR/tmp

cat $BACKUP_DIR/tmp | grep "0 rows"
status=`echo $?`
if [ $status -eq 1 ]; then 
	mail -s "Access disable" -c prmahaba@cisco.com -c srnaraha@cisco.com accesscontrol.madi3@wipro.com accesscontrol.sarjapur2@wipro.com < $BACKUP_DIR/tmp
	/opt/PostgreSQL/9.0/bin/psql -h sparkle -U postgres -d MDB -c "UPDATE mdb.update_chk_access_disable SET (access_disable) = ('Taken back')";
/opt/PostgresPlus/8.4SS/bin/psql -h sparkle -U postgres -d MDB -c "UPDATE mdb.master_database SET (attrition) = ('Yes') WHERE access_disabling_dt<=CURRENT_DATE AND master_database.attrition = 'No'";
	rm $BACKUP_DIR/tmp
fi
