drop table if exists stg_fait_transac_production;

create table stg_fait_transac_production(
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

insert into stg_fait_transac_production
select
dech.date_ech_id,
deff.date_eff_id,
dag.agence_id,
dp.pack_id,
dr.risque_id,
dtt.type_transaction_id,
pr.montant,
pr.reduction
from stg_production pr
inner join dim_agence dag on pr.id_agence = dag.code_agence
inner join dim_pack dp on pr.id_pack = dp.code_pack
inner join dim_risque dr on pr.id_vehicule = dr.code_risque
inner join dim_type_transaction dtt on pr.id_type_affaire = dtt.code_type_transaction
inner join dim_date_echeance dech on pr.date_echeance = dech.date_ech
inner join dim_date_effective deff on pr.date_effective = deff.date_eff

select count(*) from stg_fait_transac_production

