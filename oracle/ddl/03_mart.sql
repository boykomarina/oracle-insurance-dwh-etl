CREATE TABLE mart_sales_summary (
    date_key  DATE NOT NULL,
    product_code VARCHAR2(50) NOT NULL,
    policies_sold     NUMBER(10) NOT NULL,
    total_premium NUMBER(12,2) NOT NULL,
    updated_at    TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
      CONSTRAINT pk_date_product_code PRIMARY KEY (date_key, product_code),
    
);

COMMENT ON TABLE mart_sales_summary IS 'Daily data mart with pk on date and product code. also shows total for each product daily and last updata';
COMMENT ON COLUMN mart_sales_summary.date_key IS 'Date of report';
COMMENT ON COLUMN mart_sales_summary.product_code IS 'Policy type that references policy table and is unique for each day';
COMMENT ON COLUMN mart_sales_summary.policies_sold IS 'Qty of policy  sold on each date';
COMMENT ON COLUMN mart_sales_summary.total_premium IS 'Total premium amount collected per product per day';
COMMENT ON COLUMN mart_sales_summary.updated_at IS 'Last update of the row';


mart_sales_summary