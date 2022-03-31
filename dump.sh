#!/bin/bash
#Autor: 	Lukas Wigger
#Datum: 	15.03.2022
#Nutzen:	DUMP einer PostgreSQL Datenbank mittels pg_dump
#Version: 	1.0 (Beta)
#Lizenz:	MIT

echo "Skript für ein pg_dump"
echo

#Check if Script got executed as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  sleep 3
  clear
  exit
else
  #Dump
  docker exec synapse_postgresql_1 pg_dump -Fc -v --host=localhost --username=synapse --dbname=synapse -f /var/lib/postgresql/synapse-dump.sql
  #Move Dump file
  mv /docker/synapse/db/synapse-dump.sql /docker/synapse/backup/synapse-dump.sql
fi

echo
echo "Die Datenbank wurde erfolgreich gebackupt. Der Dump sollte erfolgreich ausgeführt worden sein."

