CREATE OR REPLACE PACKAGE pkg_logger AS
PROCEDURE log_info(p_module IN VARCHAR2, p_message IN VARCHAR2);
PROCEDURE log_debug(p_module IN VARCHAR2, p_message IN VARCHAR2);
PROCEDURE log_error(p_module IN VARCHAR2, p_message IN VARCHAR2);
PROCEDURE log_warn(p_module IN VARCHAR2, p_message IN VARCHAR2);
END pkg_logger;
/