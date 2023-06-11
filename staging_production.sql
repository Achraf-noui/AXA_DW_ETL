drop table if exists stg_production;

create table stg_production(
id_contrat int,
n_version int,
id_type_affaire int default -1, 
type_affaire varchar(255) default 'N/A',
id_agence int,
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
from 'C:\Users\DELL\Desktop\code_PFE\data\Production.csv'
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');

--select type_affaire, date_effective, id_vehicule, id_assure, id_condcuteur, montant, valeur_neuf from stg_production where id_assure = 1531;



