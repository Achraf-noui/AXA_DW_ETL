USE AXA_DW
go

drop table if exists fait_transac_production;

create table fait_transac_production(
transaction_id int identity(1,1),
date_sous_sk int,
date_eff_sk int,
date_ech_sk int,
client_sk int,
agence_sk int,
pack_sk int,
risque_sk int,
type_transaction_sk int,
contrat_id varchar(20),
montant float,
reduction float
);


-- load fact table fait_transac_prodution  ===================

insert into fait_transac_production
select * from stg_fait_transac_production;

select count(*) from fait_transac_production

alter table fait_transac_production
add constraint fk_dim_dateEff foreign key (date_eff_sk) references dim_date_effective (date_eff_id) on delete cascade,
constraint fk_dim_date_ech foreign key (date_ech_sk) references dim_date_echeance (date_ech_id) on delete cascade,
constraint fk_dim_date_sous foreign key (date_sous_sk) references dim_date_souscription(date_sous_id) on delete cascade,
constraint fk_dim_client foreign key (client_sk) references dim_client (client_id) on delete cascade,
constraint fk_dim_agence foreign key (agence_sk) references dim_agence (agence_id) on delete cascade,
constraint fk_dim_pack foreign key (pack_sk) references dim_pack (pack_id) on delete cascade,
constraint fk_dim_risque foreign key (risque_sk) references dim_risque (risque_id) on delete cascade,
constraint fk_dim_type_transaction foreign key (type_transaction_sk) references dim_type_transaction (type_transaction_id) on delete cascade
;
go
--CREATE PARTITION FUNCTION [myDateRange] (datetime)  
--AS RANGE RIGHT FOR VALUES ('2022-02-01', '2022-03-01', '2022-04-01',  
--               '2022-05-01', '2022-06-01', '2022-07-01', '2022-08-01',   
--               '2022-09-01', '2022-10-01', '2022-11-01', '2022-12-01'); 
