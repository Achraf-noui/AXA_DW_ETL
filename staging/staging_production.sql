drop table if exists stg_production;

create table stg_production(
id_contrat int,
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

--select count(*) from stg_production where id_type_affaire = -1;

--select id_type_affaire from stg_production where id_type_affaire not in (select code_type_transaction from dim_type_transaction)



