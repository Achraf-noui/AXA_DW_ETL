--------- create risque staging table ----------

drop table if exists stg_risque;

create table stg_risque(
risque_id int identity(1,1) NOT NULL,
code_risque int,
type_risque varchar(128),
primary key (risque_id)
);


--------- create a risque_auto staging table ---------

drop table if exists stg_risque_auto;

create table stg_risque_auto(
id_vehicule int,
marque varchar(128),
modele varchar(128),
annee_circ int default -1,
valeur_neuf float default -1,
valeur_venale float default -1,
id_proprietaire int
);

bulk insert stg_risque_auto
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\Vehicules.csv'
with ( FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');


insert into stg_risque (code_risque, type_risque)
select id_vehicule, 'Auto' from stg_risque_auto;

select * from stg_risque;

alter table stg_risque_auto 
add risque_auto_id int;
go
-- same vehicle must have same surrogate in both risque and risque_auto (supertype and subtype dimension)
-- achieved based on the natural key of the vehicle

update stg_risque_auto 
set risque_auto_id = risque_id from stg_risque r 
inner join stg_risque_auto ra on r.code_risque = ra.id_vehicule;

alter table stg_risque_auto
drop column id_proprietaire;

--select * from stg_risque_auto;

select * from stg_risque_auto;

select count(distinct id_vehicule) from stg_production
