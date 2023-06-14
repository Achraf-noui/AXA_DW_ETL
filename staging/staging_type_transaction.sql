drop table if exists stg_type_transaction;

create table stg_type_transaction(
code_type_transaction int not null,
libelle_type_transaction varchar(255)
);

insert into stg_type_transaction
select distinct id_type_affaire, type_affaire
from stg_production
where id_type_affaire > 0;

select * from stg_type_transaction;