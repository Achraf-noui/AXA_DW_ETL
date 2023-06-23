-- Execute in SQLCMD mode 
USE AXA_DW
--delete tables and constraints if exists =========================

:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\drop_constraints_tables.sql

-- Executes staging scripts ====================================
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_client.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_agence.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_pack.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_production.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_risque.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_type_transaction.sql

-- Loading data into dimensions scripts ======================================

:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_dim_client.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_dim_date.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_dim_agence.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_dim_pack.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_dim_risque.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_dim_type_transaction.sql

:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\staging\staging_fait_transaction_production.sql
:r C:\Users\DELL\Desktop\AXA_DW_ETL\scripts\loading\load_fait_transac_prod.sql

select count(*) from fait_transac_production
