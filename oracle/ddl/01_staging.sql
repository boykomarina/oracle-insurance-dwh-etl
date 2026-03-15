CREATE TABLE stg_policy_json
(
    load_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    load_dt DATE DEFAULT SYSDATE NOT NULL,
    policy_json CLOB NOT NULL,
    is_processed NUMBER(1) DEFAULT 0 NOT NULL,
    CONSTRAINT chk_stg_policy_processed CHECK (is_processed IN (0, 1))
);

COMMENT ON TABLE stg_policy_json IS 'raw data table json';
COMMENT ON COLUMN stg_policy_json.load_id IS 'json load id';
COMMENT ON COLUMN stg_policy_json.load_dt IS 'load date';
COMMENT ON COLUMN stg_policy_json.policy_json IS 'raw json data';
COMMENT ON COLUMN stg_policy_json.is_processed IS 'status of json processing, 0 for not processed, 1 for processed';