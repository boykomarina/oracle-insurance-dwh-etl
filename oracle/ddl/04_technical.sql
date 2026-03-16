CREATE TABLE app_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    log_ts TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    module_name  VARCHAR2(100) NOT NULL,
    proc_name VARCHAR2(100),
    log_level VARCHAR2(20) DEFAULT 'INFO' NOT NULL
        CONSTRAINT chk_log_level CHECK (log_level IN ('INFO', 'ERROR', 'DEBUG', 'WARN')),
    log_message CLOB NOT NULL
);

COMMENT ON TABLE app_log IS 'Logger table that tracks all ETL operations';
COMMENT ON COLUMN app_log.log_id IS 'Unique log id';
COMMENT ON COLUMN app_log.log_ts IS 'The exact date and time when the log was done';
COMMENT ON COLUMN app_log.module_name IS 'Module in which operation took place';
COMMENT ON COLUMN app_log.proc_name IS 'Procedure usage that got logged';
COMMENT ON COLUMN app_log.log_level IS 'Type of log recorded';
COMMENT ON COLUMN app_log.log_message IS 'Mandatory informational contents of any log';