#!/bin/bash
#Autor:         Lukas Wigger
#Datum:         15.03.2022
#Nutzen:        Wiederherstellen einer ProstgreSQL-Datenbank
#Version:       1.0 (Beta)
#Lizenz:        MIT

clear

echo "Wiederherstellen einer ProstgreSQL-Datenbank"
echo

if [ "$EUID" -ne 0 ]
  then
    echo "Please run as root. To interact with the Docker Socket you need root privileges"
    sleep 3
    clear
  exit
	else
	  #Copy DUMP-File out of */docker/synapse/backup*
          cp /docker/synapse/backup/synapse-dump.sql /docker/synapse/db/synapse-dump.sql
     	  #Restore with a DUMP-File
    	  docker exec synapse_postgresql_1 pg_restore -v --no-owner --host=localhost --port=5432  --username=synapse --dbname=synapse /var/lib/postgresql/synapse-dump.sql
fi

echo
echo "Die Datenbank sollte nun wiederhergestellt worden sein"
