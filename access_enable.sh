#!/bin/sh 
#set -vx
BACKUP_DIR="/home/pg-bkp"
PGHOST="/tmp"
PGUSER="postgres"
export PGPASSWORD="mechanical79"

echo -e "Hi Access Team,\n\nPlease enable access for below mentioned employees.\n\nLocation: K2 ( 1st flr and 2nd flr Main Doors), S3 (10th flr A wing partition door, 10th flr B wing, 11th flr A and B wing)\n\n" > $BACKUP_DIR/tmp

/opt/PostgreSQL/9.0/bin/psql -h sparkle -U postgres -d MDB -c "Select emp_details.wipro_emp_no, master_database.smart_card_no, emp_details.emp_name from mdb.emp_details inner join mdb.master_database on emp_details.wipro_emp_no=master_database.wipro_emp_no INNER JOIN mdb.checklist on master_database.wipro_emp_no = checklist.wipro_emp_no AND master_database.doj_cisco=checklist.doj_cisco INNER JOIN mdb.training ON master_database.wipro_emp_no = training.emp_no
WHERE master_database.attrition='No' AND master_database.smart_card_no IS NOT NULL AND checklist.access_disable IS NULL AND training.infosec = 'Pass'" >> $BACKUP_DIR/tmp

echo -e "\nRegards,\nSrinath" >> $BACKUP_DIR/tmp

cat $BACKUP_DIR/tmp | grep "0 rows"
status=`echo $?`
if [ $status -eq 1 ]; then 
	mail -s "Access enable" -c prmahaba@cisco.com -c srnaraha@cisco.com accesscontrol.madi3@wipro.com accesscontrol.sarjapur2@wipro.com < $BACKUP_DIR/tmp
	/opt/PostgreSQL/9.0/bin/psql -h sparkle -U postgres -d MDB -c "UPDATE mdb.update_chk_access_enable SET (access_disable) = ('Provided')";
	rm $BACKUP_DIR/tmp
fi
