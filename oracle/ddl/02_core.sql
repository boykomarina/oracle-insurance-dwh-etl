CREATE TABLE clients
(
    client_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR2(50) NOT NULL,
    date_of_birth DATE,
    passport_number VARCHAR2(20) UNIQUE
);

COMMENT ON TABLE clients IS 'Storing client information, including personal details and unique identifiers like passport number';
COMMENT ON COLUMN clients.client_id IS 'Id generated automatically for each client';
COMMENT ON COLUMN clients.full_name IS 'First and last name of the client';
COMMENT ON COLUMN clients.date_of_birth IS 'Date of birth of the client';
COMMENT ON COLUMN clients.passport_number IS 'Unique passport number for the client, used for identification purposes';