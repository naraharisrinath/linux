BACKUP_DIR="/home/pg-bkp"
PGHOST="/tmp"
PGUSER="postgres"
export PGPASSWORD="mechanical79"
time=`date '+%d'-'%m' `
/opt/PostgresPlus/8.4SS/bin/pg_dump --host sparkle --port 5432 --username root --format custom --blobs --verbose --file "$BACKUP_DIR/Backup-$time.backup" "MDB"
sleep 10
mutt -s "PostgreSQL Backup ($time)" -n -F /dev/null -a  $BACKUP_DIR/Backup-$time.backup prmahaba srnaraha < /dev/null
