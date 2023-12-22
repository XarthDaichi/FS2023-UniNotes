create or replace procedure p001 (
    new_bytes OUT NUMBER
)
IS
    bytes NUMBER;
BEGIN
    SELECT value / 1024 / 1024 as valueM
    into bytes
    from v$sga 
    where name = 'Database Buffers';

    new_bytes := bytes * 1.25;

    DBMS_OUTPUT.PUT_LINE('The retrieved integer value is: ' || bytes);
    DBMS_OUTPUT.PUT_LINE('The new integer is: ' || new_bytes);
END;
/



DECLARE
    bytes NUMBER;
BEGIN
    p001(bytes);
    alter system set db_cache_size = bytes M SCOPE = SPFILE;
END;
/