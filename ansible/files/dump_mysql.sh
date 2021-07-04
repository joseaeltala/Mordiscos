#!/bin/bash

# Declaramos la variables DATE que contendra el destino donde se almacenará el backup
DEST=/backups/mysql/
# Declaramos la variable FILENAME que contendra el formato de fecha
FILENAME="`date +"%d-%m-%Y_%H:%M"`.tar.gz"
# Declaramos la variable HOSTNAME que contendra el hostname del que se hara el backup.
HOSTNAME="lb-privado"
# Declaramos la variable USER que contendra el usuario para realizar la conexion.
USER="backupuser"
# Declaramos la variable PASS que contendra la contraseña para realizar la conexion.
PASS="$(cat /root/.mysqlpass)"
# Declaramos la variable DATABASES, que contendra el nombre de todas las bases de datos de las que haremos copia de seguridad.
DATABASES=$(mysql -h $HOSTNAME -u $USER -p$PASS -e "SHOW DATABASES;" | tr -d "| " | grep -v "Database\|information_schema\|performance_schema\|borrar\|pruebas")

# Comprueba si el destino es un directorio, si no es asi, lo crea.
[ ! -d $DEST ] && mkdir -p $DEST

# Comprueba si databases es un directorio, si no es asi, lo crea.
if [ ! -d databases ]
then
	        mkdir databases
fi

# Realiza un dump de todas las bases de datos indicadas en la variable DATABASES y mueve el contenido a un fichero sql.
for db in $DATABASES
do
	        mysqldump --single-transaction --routines --quick -h $HOSTNAME -u $USER -p$PASS -B $db > databases/$db.sql
done

# Movemos el contenido al fichero
cat databases/*.sql > all_databases.sql

# Creación del archivo comprimido
tar cvfz $DEST/$FILENAME all_databases.sql

# Realiza un rotado del backup
find $DEST -mtime +7 | xargs rm -fr
