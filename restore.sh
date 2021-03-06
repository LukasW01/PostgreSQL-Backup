#!/bin/bash
#Autor:         Lukas Wigger
#Datum:         15.03.2022
#Nutzen:        Wiederherstellen einer ProstgreSQL-Datenbank
#Version:       1.1 (Beta)
#Lizenz:        MIT

check() {
retval=$?
if [ $retval -ne 0 ]; then
    echo "Shit, something crazy happend! The restore was not succesful :("
    echo "Return code was not zero but $retval"
else
    echo
    echo "The database should now have been restored"
fi
}

check_root() {
echo "Please run as root!"
sleep 3
}

restore() {
docker exec <container> pg_restore -v --no-owner --host=localhost --port=5432  --username=<> --dbname=<> </path>
}

echo "Script to restore a PostgreSQL database"
echo

if [ "$EUID" -ne 0 ]
  then
    check_root
  exit
        else
          #Copy the DUMP from the backup folder to the database Docker volume
          cp </path> </path>
          #Restore with a DUMP-File
          restore
          #Check if the restoring was successful
          check
fi
