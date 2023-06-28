USE AXA_DW

drop table if exists stg_type_transaction;

create table stg_type_transaction(
code_type_transaction int not null,
libelle_type_transaction varchar(70)
);

insert into stg_type_transaction
select distinct id_type_affaire, type_affaire
from stg_production

--select count(*) from stg_type_transaction;
--select * from stg_type_transaction order by code_type_transaction;


drop table if exists mrp_type_affaire;

create table mrp_type_affaire(
affaire varchar(60)
)
insert into mrp_type_affaire
select distinct type_affaire
from stg_production_mrp;

--select * from mrp_type_affaire

Declare @code_type INT = (select count(*) from stg_type_transaction) - 1;

INSERT INTO stg_type_transaction (code_type_transaction, libelle_type_transaction)
SELECT @code_type +  ROW_NUMBER() over (order by affaire), affaire 
FROM mrp_type_affaire
where affaire not in (select libelle_type_transaction from stg_type_transaction)
