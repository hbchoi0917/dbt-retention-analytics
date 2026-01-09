# dbt Retention Analytics Pipeline 

**Senior Data Engineer Portfolio Project**

Production dbt pipeline: **raw → staging → cohorts → mart**

**85% Month 1 retention** | 3-tier architecture | dbt_utils macros

## Business Impact
- Cohort retention analysis for SaaS churn prediction
- Month-over-month retention: **85% → 62% → 51%**
- SQL-only: scalable to Snowflake/Databricks

## Production Commands
```bash
dbt deps     # dbt_utils
dbt run      # staging→intermediate→mart
dbt test     # data quality gates





