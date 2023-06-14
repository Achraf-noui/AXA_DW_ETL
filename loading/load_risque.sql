--=======================================
--Insertion risque supertype dimension
--=======================================

drop table if exists dim_risque;

create table dim_risque(
risque_id int,
code_risque int,
type_risque varchar(128)
constraint pk_dim_risque primary key (risque_id)
);

insert into dim_risque
select risque_id, code_risque, type_risque
from stg_risque;

select * from dim_risque;

--=======================================
--Insertion risque auto subtype dimension
--=======================================

drop table if exists dim_risque_auto;

create table dim_risque_auto(
risque_id int identity(1,1),
id_vehicule int,
marque varchar(50),
modele varchar(50),
annee_circulation int,
valeur_neuf float,
valeur_venale float
constraint pk_dim_risque_auto primary key (risque_id)
);

insert into dim_risque_auto
select id_vehicule, marque, modele, annee_circ, valeur_neuf, valeur_venale
from stg_risque_auto;

select * from dim_risque_auto