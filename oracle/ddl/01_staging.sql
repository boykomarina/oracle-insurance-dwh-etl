CREATE TABLE stg_policy_json
(
    load_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    load_dt DATE DEFAULT SYSDATE NOT NULL,
    raw_json CLOB NOT NULL,
    is_processed NUMBER(1) DEFAULT 0 NOT NULL,
    CONSTRAINT chk_stg_policy_processed CHECK (is_processed IN (0, 1))
);

COMMENT ON TABLE stg_policy_json IS 'Staging table for incoming insurance policies in JSON format. Records are processed by ETL and moved to core layer.';
COMMENT ON COLUMN stg_policy_json.load_id IS 'Auto-generated unique identifier for each load record';
COMMENT ON COLUMN stg_policy_json.load_dt IS 'Date when the record was loaded into staging';
COMMENT ON COLUMN stg_policy_json.raw_json IS 'Raw JSON data from the external system, stored as is without processing';
COMMENT ON COLUMN stg_policy_json.is_processed IS 'Processing status flag: 0 = not processed, 1 = processed by ETL pipeline';

CREATE TABLE stg_claim_xml
(
    load_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    load_dt DATE DEFAULT SYSDATE NOT NULL,
    raw_xml XMLTYPE NOT NULL,
    is_processed NUMBER(1) DEFAULT 0 NOT NULL,
    CONSTRAINT chk_stg_policy_processed CHECK (is_processed IN (0, 1))
);

COMMENT ON TABLE stg_claim_xml IS 'Staging table for incoming claim requests in XML format. Records are processed by ETL and moved to core layer.';
COMMENT ON COLUMN stg_claim_xml.load_id IS 'Auto-generated unique identifier for each load record';
COMMENT ON COLUMN stg_claim_xml.load_dt IS 'Date when the record was loaded into staging';
COMMENT ON COLUMN stg_claim_xml.raw_xml IS 'Raw XML data from the external system, stored as is without processing';
COMMENT ON COLUMN stg_claim_xml.is_processed IS 'Processing status flag: 0 = not processed, 1 = processed by ETL pipeline';