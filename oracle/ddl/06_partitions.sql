/*
CREATE TABLE policies (
    policy_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id NUMBER NOT NULL,
    agent_id NUMBER NOT NULL,
    policy_status VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,
    product_code VARCHAR2(50) NOT NULL,
    premium_amount NUMBER(12,2) NOT NULL,
    policy_start_date DATE NOT NULL,
    policy_end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT chk_policy_status CHECK (policy_status IN ('ACTIVE', 'CANCELLED', 'EXPIRED')),
    CONSTRAINT chk_policy_dates CHECK (policy_end_date > policy_start_date),
    CONSTRAINT chk_policy_premium CHECK (premium_amount > 0),
    CONSTRAINT fk_policies_client_id FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_policies_agent_id FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
)
PARTITION BY RANGE (policy_start_date)
INTERVAL (NUMTOYMINTERVAL(1, 'YEAR'))
(
    PARTITION p_2024 VALUES LESS THAN (TO_DATE('2025-01-01', 'YYYY-MM-DD'))
);
*/