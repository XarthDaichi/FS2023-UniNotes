-- CREATE OR REPLACE PROCEDURE AlertaMonitoreo(hwm IN NUMBER) AS
--   file_handle UTL_FILE.FILE_TYPE;
--   cursor c_data is
--     SELECT b.id, b.name, b.block_size/1024/1024 AS size_mb,
--        (b.block_size/1024/1024) - (b.free_buffer_inspected/1024/1024) AS used_mb,
--        b.free_buffer_inspected/1024/1024 AS free_mb,
--        s.username, s.sid, s.serial#, s.sql_id,
--        t.sql_text
--       FROM v$buffer_pool_statistics b
--       JOIN v$session s ON b.con_id = s.sid
--       LEFT JOIN v$sqltext t ON s.sql_id = t.sql_id
--       WHERE s.status = 'ACTIVE' AND s.username IS NOT NULL;
-- BEGIN
--   -- Open the file for writing
--   file_handle := UTL_FILE.FOPEN('C:\Temp', 'output.txt', 'W');

--   -- Loop through the table rows and write data to the file
--   -- UTL_FILE.PUT_LINE(file_handle, 'HELLO WORLD!!!!');
--   for rec in c_data loop
--     IF hwm < rec.used_mb THEN
--       DBMS_OUTPUT.PUT_LINE(rec.id || ',' || rec.name || ',' || rec.size_mb || ',' || rec.used_mb || ',' || rec.free_mb || ',' || rec.username || ',' || rec.sid || ',' || rec.serial# || ',' || rec.sql_id || ',' || rec.sql_text);
--       UTL_FILE.PUT_LINE(file_handle, rec.id || ',' || rec.name || ',' || rec.size_mb || ',' || rec.used_mb || ',' || rec.free_mb || ',' || rec.username || ',' || rec.sid || ',' || rec.serial# || ',' || rec.sql_id || ',' || rec.sql_text); -- Adjust columns accordingly
--     END IF;
--   end loop;

--   -- Close the file
--   UTL_FILE.FCLOSE(file_handle);
-- EXCEPTION
--   WHEN UTL_FILE.INVALID_OPERATION THEN
--     DBMS_OUTPUT.PUT_LINE('Invalid operation on file.');
--   WHEN UTL_FILE.INVALID_FILEHANDLE THEN
--     DBMS_OUTPUT.PUT_LINE('Invalid file handle.');
--   WHEN UTL_FILE.WRITE_ERROR THEN
--     DBMS_OUTPUT.PUT_LINE('Write error.');
--   WHEN OTHERS THEN
--     DBMS_OUTPUT.PUT_LINE('An error occurred.');
-- END;
-- /

-- SET SERVEROUTPUT ON
-- BEGIN
--     AlertaMonitoreo(1000);
-- END;
-- /
-- SELECT 
--     -- Buffer Cache Information
--     (SELECT ) AS "Cache Space",

--     -- Free Tablespace Information
--     (SELECT ROUND(SUM(bytes)/1024/1024, 2) FROM dba_free_space) AS "Total Free Tablespace (MB)",

--     -- Count of Active Users Executing SQL Statements
--     (SELECT COUNT(DISTINCT username) FROM v$session WHERE type = 'USER' AND status = 'ACTIVE' AND username IS NOT NULL) AS "Active Users Count"
-- FROM 
--     DUAL;


-- drop table t1;

-- create table t1(a int, b int);

-- insert into t1 (a,b) values (1,2);
-- insert into t1 (a,b) values (3,4);
-- insert into t1 (a,b) values (5,6);


-- CREATE OR REPLACE PROCEDURE ExportData IS 
--     v_file UTL_FILE.FILE_TYPE;
--     v_a INT;
--     v_b INT;
--     CURSOR v_cursor1 IS 
--       SELECT a, b 
--       FROM t1;
-- BEGIN
--     -- Abre un archivo para escribir
--     v_file := UTL_FILE.FOPEN('C:\Users\diego\Desktop\Uni-FS2023\Files\databases-II\', 'output.txt', 'W');

--     -- Escribe encabezados de columna en el archivo
--     UTL_FILE.PUT_LINE(v_file, 'a || b');
    
--     -- Bucle para escribir datos en el archivo
--     FOR rec IN v_cursor LOOP
--         UTL_FILE.PUT_LINE(v_file, TO_CHAR(rec.a) || ' || ' || TO_CHAR(rec.b));
--     END LOOP;

--     -- Cierra el archivo
--     UTL_FILE.FCLOSE(v_file);
-- EXCEPTION
--     WHEN OTHERS THEN
--         -- Cierra el archivo en caso de error
--         UTL_FILE.FCLOSE(v_file);
--         RAISE;
-- END ExportData;
-- /

-- execute ExportData;

select b.id, b.name, b.block_size / 1024 / 1024 as used_space, (s.value - b.block_size) / 1024 / 1024 as free_space, s.value / 1024 / 1024 as total_space 
from v$buffer_pool_statistics b, v$sga s 
where s.name = 'Fixed Size';


select s.username, s.sid, s.serial#, s.sql_id, t.sql_text 
from v$session s, v$sqltext t
where s.status = 'ACTIVE' AND s.username IS NOT NULL AND s.sql_id = t.sql_id;