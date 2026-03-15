CREATE TABLE clients
(
    client_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR2(200) NOT NULL,
    date_of_birth DATE NOT NULL,
    passport_number VARCHAR2(20) UNIQUE NOT NULL,
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);

COMMENT ON TABLE clients IS 'Storing client information, including personal details and unique identifiers like passport number';
COMMENT ON COLUMN clients.client_id IS 'Id generated automatically for each client';
COMMENT ON COLUMN clients.full_name IS 'First and last name of the client';
COMMENT ON COLUMN clients.date_of_birth IS 'Date of birth of the client';
COMMENT ON COLUMN clients.passport_number IS 'Unique passport number for the client, used for identification purposes';
COMMENT ON COLUMN clients.created_at IS 'Timestamp when the client record was created in the system';


CREATE TABLE agents
(
    agent_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR2(200) NOT NULL,
    region VARCHAR2(100) NOT NULL,
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);

COMMENT ON TABLE agents IS 'Storing insurance agent information, including their name and the region they operate in';
COMMENT ON COLUMN agents.agent_id IS 'Id generated automatically for each agent';
COMMENT ON COLUMN agents.full_name IS 'First and last name of the insurance agent';
COMMENT ON COLUMN agents.region IS 'Region where the agent operates, used for assigning policies and claims';
COMMENT ON COLUMN agents.created_at IS 'Timestamp when the agent record was created in the system';


CREATE TABLE policies
(
    policy_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id NUMBER NOT NULL,
    agent_id NUMBER NOT NULL,
    status VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,
       product_code    VARCHAR2(50) NOT NULL,
    premium_amount  NUMBER(12,2) NOT NULL,
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL,
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT chk_policy_status CHECK (status IN ('ACTIVE', 'CANCELLED', 'EXPIRED')),
    CONSTRAINT chk_policy_dates CHECK (end_date > start_date),
    CONSTRAINT chk_policy_premium CHECK (premium_amount > 0),
    CONSTRAINT fk_policies_client_id FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_policies_agent_id FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

COMMENT ON TABLE policies IS ' Storing insurance policy information, linking clients and agents, and tracking policy details such as status, premium, and coverage dates. The product_code column identifies the type of insurance product (e.g., AUTO, HOME, LIFE) associated with the policy.';
COMMENT ON COLUMN policies.policy_id IS 'Id generated automatically for each policy';
COMMENT ON COLUMN policies.client_id IS 'Foreign key referencing the client who owns the policy';
COMMENT ON COLUMN policies.agent_id IS 'Foreign key referencing the agent responsible for the policy';
COMMENT ON COLUMN policies.status IS 'Current status of the policy: ACTIVE, CANCELLED, or EXPIRED';
COMMENT ON COLUMN policies.premium_amount IS 'Premium amount for the policy, must be a positive value';
COMMENT ON COLUMN policies.start_date IS 'Start date of the policy coverage';
COMMENT ON COLUMN policies.end_date IS 'End date of the policy coverage, must be after the start date';
COMMENT ON COLUMN policies.created_at IS 'Timestamp when the policy record was created in the system';


CREATE TABLE claims (
    claim_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    policy_id       NUMBER NOT NULL,
    claim_date      DATE NOT NULL,
    claim_amount    NUMBER(12,2) NOT NULL,
    status          VARCHAR2(20) DEFAULT 'PENDING' NOT NULL
        CONSTRAINT chk_claim_status CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED', 'PAID')),
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    
    CONSTRAINT fk_claim_policy FOREIGN KEY (policy_id) REFERENCES policies(policy_id),
    CONSTRAINT chk_claim_amount_positive CHECK (claim_amount > 0)
);

COMMENT ON TABLE claims IS 'Insurance claims (insured events)';
COMMENT ON COLUMN claims.claim_id IS 'Unique claim identifier';
COMMENT ON COLUMN claims.policy_id IS 'Reference to policy';
COMMENT ON COLUMN claims.claim_date IS 'Date when the insured event occurred';
COMMENT ON COLUMN claims.claim_amount IS 'Claimed amount';
COMMENT ON COLUMN claims.status IS 'Claim processing status';
COMMENT ON COLUMN claims.created_at IS 'Record creation timestamp';