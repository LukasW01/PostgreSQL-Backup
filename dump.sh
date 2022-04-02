#!/bin/bash
#Autor:         Lukas Wigger
#Datum:         15.03.2022
#Nutzen:        DUMP einer PostgreSQL Datenbank mittels pg_dump
#Version:       1.1 (Beta)
#Lizenz:        MIT

check() {
retval=$?
if [ $retval -ne 0 ]; then
    echo "Shit, something crazy happend! The DUMP was not succesful :("
    echo "Return code was not zero but $retval"
else
    echo
    echo "Die Datenbank wurde erfolgreich gebackupt. Der Dump sollte erfolgreich ausgeführt worden sein."
fi
}

check_root() {
echo "Please run as root!"
sleep 3
clear
}

dump() {
docker exec synapse_postgresql_1 pg_dump -Fc -v --host=localhost --username=synapse --dbname=synapse -f /var/lib/postgresql/synapse-dump.sql
}

echo "Skript für ein pg_dump"
echo

#Check if Script got executed as root
if [ "$EUID" -ne 0 ]
  then check_root
  exit
else
  #Dump
  dump
  #Check if DUMP was succesful :)
  check
  #Move Dump file
  mv /docker/synapse/db/synapse-dump.sql /docker/synapse/backup/synapse-dump.sql
fi
