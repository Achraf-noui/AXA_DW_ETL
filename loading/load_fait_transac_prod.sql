drop table if exists fait_transac_production;

create table fait_transac_production(
date_sous_sk int,
date_eff_sk int,
date_ech_sk int,
agence_sk int,
pack_sk int,
risque_sk int,
type_transaction_sk int,
montant float,
reduction float
);


truncate table fait_transac_production

-- load fact table fait_transac_prodution  ===================

insert into fait_transac_production
select * from stg_fait_transac_production;

select count(*) from fait_transac_production

alter table fait_transac_production
add constraint fk_dim_dateEff foreign key (date_eff_sk) references dim_date_effective (date_eff_id) on delete cascade,
constraint fk_dim_date_ech foreign key (date_ech_sk) references dim_date_echeance (date_ech_id) on delete cascade,
constraint fk_dim_date_sous foreign key (date_sous_sk) references dim_date_souscription(date_sous_id) on delete cascade,
constraint fk_dim_agence foreign key (agence_sk) references dim_agence (agence_id) on delete cascade,
constraint fk_dim_pack foreign key (pack_sk) references dim_pack (pack_id) on delete cascade,
constraint fk_dim_risque foreign key (risque_sk) references dim_risque (risque_id) on delete cascade,
constraint fk_dim_type_transaction foreign key (type_transaction_sk) references dim_type_transaction (type_transaction_id) on delete cascade
;

--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_dateEff;
--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_date_ech;
--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_agence;
--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_pack;
--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_risque;
--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_type_transaction;

