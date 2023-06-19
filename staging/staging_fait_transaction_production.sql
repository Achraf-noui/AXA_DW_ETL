drop table if exists stg_fait_transac_production;

create table stg_fait_transac_production(
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

--select * from stg_fait_transac_production;
truncate table stg_fait_transac_production;

insert into stg_fait_transac_production
select 
dsous.date_sous_id,
deff.date_eff_id,
dech.date_ech_id,
dag.agence_id,
dp.pack_id,
dr.risque_id,
dtt.type_transaction_id,
pr.montant,
pr.reduction
from stg_production pr
inner join dim_agence dag on dag.code_agence = pr.id_agence
inner join dim_pack dp on dp.code_pack = pr.id_pack
inner join dim_risque dr on dr.code_risque = pr.id_vehicule
inner join dim_type_transaction dtt on dtt.code_type_transaction = pr.id_type_affaire
inner join dim_date_souscription dsous on dsous.date_sous = pr.date_souscription
inner join dim_date_effective deff on deff.date_eff = pr.date_effective
inner join dim_date_echeance dech on dech.date_ech = pr.date_echeance

select count(*) from stg_production
select * from stg_fait_transac_production

