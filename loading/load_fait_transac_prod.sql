drop table if exists fait_transac_production;

create table fait_transac_production(
date_eff_sk int,
date_ech_sk int,
agence_sk int,
pack_sk int,
risque_sk int,
type_transaction_sk int,
montant float,
reduction float
);

alter table fait_transac_production
add constraint fk_dim_dateEff foreign key (date_eff_sk) references dim_date_effective (date_eff_id),
constraint fk_dim_date_ech foreign key (date_ech_sk) references dim_date_echeance (date_ech_id),
constraint fk_dim_agence foreign key (agence_sk) references dim_agence (agence_id),
constraint fk_dim_pack foreign key (pack_sk) references dim_pack (pack_id),
constraint fk_dim_risque foreign key (risque_sk) references dim_risque (risque_id),
constraint fk_dim_type_transaction foreign key (type_transaction_sk) references dim_type_transaction (type_transaction_id)
;

truncate table fait_transac_production

-- load fact table fait_transac_prodution  ===================

insert into fait_transac_production
select * from stg_fait_transac_production;

select count(*) from fait_transac_production


--select de.date_eff, f.agence_sk, ag.nom_agence, sum(montant)
--from fait_transac_production f, dim_agence ag, dim_date_effective de
--where f.agence_sk = ag.agence_id and de.date_eff_id = f.date_eff_sk and de.annee_eff = 2023
--group by de.date_eff, f.agence_sk, ag.nom_agence

--select * from fait_transac_production where agence_sk = 41 order by date_ech_sk
