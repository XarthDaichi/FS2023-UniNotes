---
type: homework
date: 2023-10-09
turned-in: true
status: Finished
tags: homework
---
Autores:
- Jorge Durán Campos
- Luis Montes de Oca Ruiz
- Diego Quirós Artiñano
# Primero hay que colocar la base de datos en modo ARCHIVE

1. Ingresar a SQLPLUS como SYS
![[Pasted image 20231008203838.png]]
2. Ejecutar `ARCHIVE LOG LIST;` para verificar si está en modo archivado
![[Pasted image 20231008204056.png]]
3. Si no lo está en modo archivado:
	1. ejecutar `SHUTDOWN IMMEDIATE;`
	![[Pasted image 20231008204257.png]]
	2. ejecutar `STARTUP MOUNT;`
	![[Pasted image 20231008204518.png]]
	3. ejecutar `ALTER DATABASE ARCHIVELOG;`
	![[Pasted image 20231008204630.png]]
	4. ejecutar `ALTER DATABASE OPEN;`
	![[Pasted image 20231008204739.png]]
	5. verificar ejecutando `ARCHIVE LOG LIST;`
	![[Pasted image 20231008204827.png]]
4. ejecutar `ALTER SYSTEM SWITCH LOGFILE;` para guardar cambios hasta ahora
![[Pasted image 20231008205022.png]]
# Hacer un Backup completo
1. abrir RMAN ejecutando `rman target /` en la terminal
![[Pasted image 20231008205323.png]]
2. ver parámetros de RMAN ejecutando `SHOW ALL;`
![[Pasted image 20231008205509.png]]
3. para configurar donde se guarda
	1. crear carpeta donde quiera guardarlo
	![[Pasted image 20231008210841.png]]
	2. ejecutar `CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT 'C:\backup\rman\full_%u_%s_%p';` (guardando en C:\\backup\\rman\\ y que el nombre comenzara con 'FULL_') 
	![[Pasted image 20231008211034.png]]
	Se puede cambiar el nombre defecto como (recomendado, después scripts vendrán con formato para diferenciar entre full y parcial):
	![[Pasted image 20231008214308.png]]
1. si se quiere configurar el periodo de retención del backup se puede ejecutar `CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 7 DAYS;` (va a retener el backup por 7 días) (Costa Rica como mencionado en clase guarda por 4 años los datos, entonces se puede configurar para 1460 días)
![[Pasted image 20231008210408.png]]
5. verificar cambios ejecutando `SHOW ALL;`
![[Pasted image 20231008211112.png]]
6. Hacer el backup completo con los archivlogs, ejecutar `BACKUP AS BACKUPSET DATABASE PLUS ARCHIVELOG;`
![[Pasted image 20231008211425.png]]
![[Pasted image 20231008211445.png]]
![[Pasted image 20231008211520.png]]
7. Verificar que se haya guardado en la dirección que se especificó
![[Pasted image 20231008211639.png]]
# Crear un tablespace con una tabla
1. Ingresar a SQLPLUS como SYS
2. crear un tablespace ejecutando `create tablespace tsp1 datafile 'tps1.dbf' size 1m;` donde el 'tps1.dbf' es el nombre del archivo que se va a crear y 1m es 1 mega, se puede generar más grande pero para términos de pruebas se hizo pequeño
![[Pasted image 20231008213218.png]]
3. Crear la tabla y asignarla al tablespace creado
![[Pasted image 20231008213340.png]]
# Hacer Backup Parcial
1. Ingresar a RMAN ejecutando `rman target /`
2. Hacer el backup del tablespace ejecutando `BACKUP AS BACKUPSET TABLESPACE tsp1`
![[Pasted image 20231008213740.png]]
# Creando los scripts para el backup completo y el backup parcial
Primero que todo hay que generar un catalogo de RMAN y para eso se necesita que RMAN tenga un acceso en SQLPLUS
1. Ingresar a SQLPLUS como SYS
2. ejecutar `alter session set "_ORACLE_SCRIPT"=true;`
3. crear un usuario ejecutando `CREATE USER rman IDENTIFIED BY rman;`
![[Pasted image 20231008222203.png]]
4. darle permisos al usuario creado ejecutando `GRANT RECOVERY_CATALOG_OWNER TO rman;` y `GRANT CONNECT TO rman;` además se le tiene que dar permisos al tablespace
	1. Para facilidad es mejor ejecutar `GRANT ALL PRIVILAGES TO rman;`
	![[Pasted image 20231008222243.png]]
Después hay que conectar el catalogo de rman a la base de datos
1. Ingresar a RMAN
2. Ejecutar `CONNECT CATALOG rman/rman@xe;`
![[Pasted image 20231008222345.png]]
3. Ejecutar `CREATE CATALOG;`
![[Pasted image 20231008222357.png]]
4. Ejecutar `REGISTER DATABASE;`
![[Pasted image 20231008223005.png]]

Ahora si se pueden crear scripts, se pueden crear directamente desde la terminal o guardar en algún archivo y crear ahí

En terminal ejecutar:
```
CREATE SCRIPT full_backup
COMMENT 'para hacer el backup completo con archive logs'
{
    BACKUP AS BACKUPSET DATABASE PLUS ARCHIVELOG FORMAT 'C:\backup\rman\full_%u_%s_%p';
    DELETE OBSOLETE;
}
```
- El script como tal puede variar dependiendo en lo que se quiere hacer, como por ejemplo abajo
![[Pasted image 20231008223858.png]]
- Para poder diferenciar entre los archivos full y los archivos parciales entonces se modifico el script de la siguiente manera (recomendado):
```
CREATAE OR REPLACE SCRIPT tsp1_backup
COMMENT 'BACKUP PARCIAL DE TABLESPACE TSP1'
{
	BACKUP AS BACKUPSET TABLESPACE tsp1 FORMAT 'C:\backup\rman\partial_tsp1_%u_%s_%p';
	DELETE OBSOLETE;
}
```
	![[Pasted image 20231008232519.png]]
Por archivo copiar lo anterior en un archivo y ejecutar: 
`CREATE SCRIPT full_backup FROM FILE 'C:\backup\rman\full_backup.txt';`
![[Pasted image 20231008223101.png]]
Para ejecutar el script se hace `RUN { EXECUTE SCRIPT full_backup; }` (cambiar full_backup por nombre del script)
![[Pasted image 20231008224111.png]]

Anotaciones: 
- El comando `DELETE OBSOLETE;` borra los backups basado en el parámetro de RETENTION POLICY TO RECOVERY WINDOW
- Para hacer el tablespace dinámico se puede crear el siguiente script: (no se puede copiar directamente en terminal porque entre &1 y el siguiente comando ejecuta un interruptor)
```
CREATE SCRIPT backup_tablespace_any
COMMENT 'BACKUP TABLESPACE DINAMICO'
{
	BACKUP AS BACKUPSET TABLESPACE &1;
	DELETE OBSOLETE;
}
```
![[Pasted image 20231008224630.png]]
y se ejecuta como `RUN { EXECUTE SCRIPT backup_tablespace_any using 'tsp1'; }` cambiar tsp1 por el nombre del tablespace que quiere backup
![[Pasted image 20231008224834.png]]
- Para salvar un script se ejecuta:
`PRINT SCRIPT full_backup TO FILE 'C:\backup\rman\my_script_file.txt';`
![[Pasted image 20231008234128.png]]
# Políticas definidas por la empresa
t0: se ejecuta el script full_backup y, si se ha creado el tablespace tsp1, tsp1_backup
Entre t0 y t1: se ejecuta tsp1_backup
t1: se ejecuta el script tsp1_backup
Entre t1 y t2: se ejecuta tsp1_backup
t2: se ejecuta el script full_backup y tsp1_backup
Entre t2 y t3: se ejecuta tsp1_backup
t3: se ejecuta el script tsp1_backup
Entre t3 y t4: se ejecuta tsp1_backup
t4: se ejecuta el script full_backup y tsp1_backup


Bibliografía:
- https://www.thegeekstuff.com/2013/08/oracle-rman-backup/
- https://www.oracle-dba-online.com/retention-policy-in-oracle-rman.htm
- https://www.oracle-dba-online.com/rman-partial-backup.htm
- https://www.oracletutorial.com/oracle-administration/oracle-create-tablespace/
- https://ocptechnology.com/rman-backup-script/
- http://pages.di.unipi.it/ghelli/didattica/bdldoc/B19306_01/backup.102/b14191/rcmcatdb005.htm
- https://www.dba-oracle.com/real_application_clusters_rac_grid/recovery_catalog.html
- https://blogs.oracle.com/connect/post/scripting-oracle-rman-commands