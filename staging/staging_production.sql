USE AXA_DW;

drop table if exists stg_production;

create table stg_production(
id_contrat varchar(20),
n_version int,
id_type_affaire int default -1, 
type_affaire varchar(255) default 'non-specifie',
id_agence varchar(20),
date_souscription date default 'N/A',
date_effective date default 'N/A',
date_echeance date default 'N/A',
canal varchar(128) default 'N/A',
montant float default 0, 
id_pack int,
lib_pack varchar(128) default 'N/A',
segment varchar(128) default 'N/A',
franchise int default -1,
id_vehicule int,
id_assure int,
id_condcuteur int,
valeur_neuf float default -1,
valeur_venal float default -1,
reduction float default 0,
situation varchar(128) default 'N/A'
);


bulk insert stg_production
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\Production.csv'
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');



select count(*) from stg_production;


-- Production MRP =============================

drop table if exists stg_production_mrp;

create table stg_production_mrp(
num_police varchar(10),
n_version int,
type_affaire varchar(255) default 'non-specifié',
situation varchar(20) default 'N/A',
date_effet_mouv varchar(10) default 'N/A',
date_effet_contrat varchar(10) default 'N/A',
date_echeance_contrat varchar(10) default 'N/A',
produit varchar(5) default 'N/A',
date_deb_im varchar(10) default 'N/A',
id_agence varchar(20),
lib_agence varchar(128),
canal varchar(30),
CA varchar(20),
[Date] varchar(10),
);

bulk insert stg_production_mrp
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\BDD_MRP.csv'
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');


update stg_production_mrp
set type_affaire = 'Avenant de resiliation avec ristourne'
where type_affaire = 'AVT DE RESILIATION AVEC RIST'

update stg_production_mrp
set type_affaire = 'Avenant de resiliation sans ristourne'
where type_affaire = 'AVT DE RESILIATION SANS RIST'

update stg_production_mrp
set type_affaire = 'Augmentation / Diminution'
where type_affaire = 'AUGMENTATION / DIMINUTION' 

update stg_production_mrp
set type_affaire = 'Avenant de remise en vigueur '
where type_affaire = 'AVENANT DE SUBROGATION'

update stg_production_mrp
set type_affaire = 'Avenant d''ordre '
where type_affaire = 'AVT D''ORDRE'

update stg_production_mrp
set type_affaire = 'Avenant de remise en vigueur '
where type_affaire = 'AVT DE REMISE EN COURS'

update stg_production_mrp
set num_police = cast(RIGHT(num_police, LEN(num_police)-1) AS INT)

alter table stg_production_mrp add 
id_assure int, 
id_risque int, 
id_pack int;
go

update stg_production_mrp
set id_assure = -1,
	id_risque = -1,
	id_pack = -1

--select distinct type_affaire from stg_production_mrp

--select id_agence from stg_production_mrp where id_agence not in (select code_agence from dim_agence)


