drop table if exists stg_production;

create table stg_production(
id_contrat varchar(20),
n_version int,
id_type_affaire int default -1, 
type_affaire varchar(255) default 'non-specifié',
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

select count(*) from stg_production_mrp;

