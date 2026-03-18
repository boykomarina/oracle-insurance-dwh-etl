CREATE OR REPLACE PACKAGE BODY 
pkg_logger AS
    PROCEDURE write_log(p_module IN VARCHAR2, 
                        p_log_level IN VARCHAR2, 
                        p_message IN CLOB) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        INSERT INTO app_log(log_ts, module_name, log_level, log_message)
        VALUES (SYSTIMESTAMP, p_module, p_log_level, p_message);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
    END write_log;
PROCEDURE log_info(p_module IN VARCHAR2, p_message IN CLOB) 
    IS
    BEGIN 
        write_log(p_module, 'INFO', p_message);
    END log_info;
PROCEDURE log_debug(p_module IN VARCHAR2, p_message IN CLOB)
    IS
    BEGIN 
        write_log(p_module, 'DEBUG', p_message);
    END log_debug;
PROCEDURE log_error(p_module IN VARCHAR2, p_message IN CLOB)
    IS
    BEGIN 
        write_log(p_module, 'ERROR', p_message);
    END log_error;
PROCEDURE log_warn(p_module IN VARCHAR2, p_message IN CLOB)
    IS
    BEGIN 
        write_log(p_module, 'WARN', p_message);
    END log_warn;
END pkg_logger;
/