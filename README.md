# PostgreSQL-Backup

Two bash scripts to Dump/Restore a PostgreSQL-Database within a Docker-Container 🐋

# Usage

**Download the File/s**

wget https://raw.githubusercontent.com/LukasWig/PostgreSQL-Backup/main/dump.sh && wget https://raw.githubusercontent.com/LukasWig/PostgreSQL-Backup/main/restore.sh

**Give Executive permissions**

chmod +x <file.sh>

**Edit parameters**

Parameters are marked as <>


**Execute Script with Root**

./<file.sh>

# CronJob

If you want to run the script regularly you can do this with a CronJob. Please note that the script must be executed as root. 

This goes as folowing:

> sudo crontab -e

And add this line:

> 0 0 * * *  /path/to/script/dump.sh

# Info

I would call myself a beginner with BASH. I did this script in my free time, apart from school. If you'd like to improve the two scripts, feel free to do it 😄

# Planned improvements

- More interactivity!
    - Which Container should be Dumped/Restored
    - Username
    - Database-Name
    - etc...
- Custom File Paths
- Saving the Parameters to a file, so the Scripts don't forget them
- and much more!
