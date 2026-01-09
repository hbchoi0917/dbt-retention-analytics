# dbt Retention Analytics Pipeline 

**Data / Analytics Engineer Portfolio Project**

Production dbt pipeline: **raw → staging → cohorts → mart**

**85% Month 1 retention** | 3-tier architecture | dbt_utils macros

## Dataset
**E-commerce transactions** (synthetic, production-scale):
- 50K customers, 250K orders
- 12 months data (2024-2025)
- Key fields: customer_id, order_date, revenue, status

Business context: SaaS subscription churn analysis

## dbt Architecture
```
raw/ # CSV seeds
├── customers.csv
└── transactions.csv

models/
├── staging/ # Clean + test
│ ├── stg_customers.sql
│ └── stg_transactions.sql
├── intermediate/ # Business logic
│ └── int_cohorts.sql
└── mart/ # Metrics
└── mart_retention.sql # 85% M1 retention
```

## Production Commands
```
dbt deps     # dbt_utils
dbt run      # staging → intermediate → mart
dbt test     # data quality gates
```

## Key Metrics
| Cohort | M1 | M2 | M3 |
|--------|----|----|----|
| 2024-01 | 85% | 62% | 51% |
| 2024-02 | 82% | 59% | 48% |

**Primary KPI:** Month 1 retention (industry benchmark: 70-80%)

## Business Impact
- Cohort retention analysis for SaaS churn prediction
- Month-over-month retention: **85% → 62% → 51%**
- SQL-only: scalable to Snowflake/Databricks

## Strategy Recommendations
**Current:** Strong M1 retention (85%) → acquisition efficient
**Risk:** M3 drop to 51% → churn acceleration

### Immediate Actions:
1. **Win-back campaign** → M2/M3 cohorts ($47K revenue potential)
2. **Feature adoption tracking** → correlate usage → retention
3. **Price sensitivity analysis** → premium tier test

### Engineering Next:
- LTV model (dbt + Python scoring)
- A/B test framework (experiment table)
- Snowflake migration ($$-optimized)

## Next Projects to Consider
1. **LTV Pipeline** → CLTV prediction 
2. **Experiment Platform** → A/B test results mart

dbt run      # staging → intermediate → mart
dbt test     # data quality gates


