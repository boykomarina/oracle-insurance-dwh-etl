# oracle-insurance-dwh-etl

ETL pipeline demo for insurance data warehouse built with Oracle PL/SQL.

---

## What this project is about

This is a portfolio project demonstrating how an ETL pipeline works in an insurance company context — from raw incoming data to aggregated reporting layers.

The focus is on practical patterns I find important in real development: proper error handling, structured logging, bulk operations for performance, and JSON/XML integration which is common in enterprise integrations.

---

## Tech stack

- Oracle 19c/21c
- PL/SQL
- JSON, XML
- DBMS_SCHEDULER, JSON_TABLE, XMLTABLE, BULK COLLECT

---

## Architecture

Data flows through three layers:
```
Staging → Core → Mart
```

Staging holds raw JSON and XML from external sources. Core contains normalized relational data. Mart has aggregated summaries for reporting.

ER diagram: [docs/er-diagram.png](docs/er-diagram.png)

---

## Project structure
```
oracle-insurance-dwh-etl/
├── docs/
├── oracle/
│   ├── ddl/
│   ├── pkg_logger/
│   ├── pkg_etl_pipeline/
│   ├── pkg_external_data/
│   └── jobs/
├── data/
└── tests/
```

---

## Status

Work in progress. Current stage: schema design.

---

## Contacts

Marina Boyko 
https://github.com/boykomarina