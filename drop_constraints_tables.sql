IF OBJECT_ID('fait_transac_production', 'U') IS NOT NULL
BEGIN

ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_date_sous;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_dateEff;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_date_ech;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_client;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_agence;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_pack;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_risque;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_type_transaction;

END
ELSE
BEGIN

drop table if exists dim_date_souscription;
drop table if exists dim_date_effective;
drop table if exists dim_date_echeance;
drop table if exists dim_date;
drop table if exists dim_client;
drop table if exists dim_agence;
drop table if exists dim_risque;
drop table if exists dim_risque_auto;
drop table if exists dim_pack;
drop table if exists dim_type_transaction;
drop table if exists fait_transac_production;
drop table if exists stg_ags;
drop table if exists stg_agc;
drop table if exists stg_aga;
drop table if exists stg_client;
drop table if exists stg_pack;
drop table if exists stg_risque;
drop table if exists stg_risque_auto;
drop table if exists stg_type_transaction;
drop table if exists stg_production;
drop table if exists stg_fait_transac_production;

END
