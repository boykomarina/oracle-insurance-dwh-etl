-- Indices on FK fields
CREATE INDEX idx_policies_client_id ON policies(client_id);
CREATE INDEX idx_policies_agent_id ON policies(agent_id);
CREATE INDEX idx_claims_policy_id ON claims(policy_id);

-- Indices on partitions and frequent search
CREATE INDEX idx_policies_policy_start_date ON policies(policy_start_date);
CREATE INDEX idx_policies_policy_status ON policies(CASE WHEN policy_status = 'ACTIVE' THEN policy_status END);
/* We are interested only in active policies */

-- Mart indices
CREATE INDEX idx_mart_sales_summary_product_code ON mart_sales_summary(product_code);


-- Log indices
CREATE INDEX idx_app_log_level_ts ON app_log(log_level, log_ts);

-- Staging indices
CREATE INDEX idx_stg_policy_processed ON stg_policy_json(CASE WHEN is_processed = 0 THEN is_processed END);
CREATE INDEX idx_stg_claim_processed ON stg_claim_xml(CASE WHEN is_processed = 0 THEN is_processed END);
/* majority of loads in staging tables are likely to be marked as is_processed=1 so the usage of partial index seems valid*/