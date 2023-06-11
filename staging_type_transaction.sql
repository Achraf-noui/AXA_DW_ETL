drop table if exists stg_type_transaction;

create table stg_type_transaction(
type_transaction_id int identity(1,1) not null,
code_transaction int not null,
libelle_type_transaction varchar(255)
constraint pk_type_transac primary key (type_transaction_id)
);

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
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\Production.csv'
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');

--select * from stg_production;

insert stg_type_transaction
select distinct (id_type_affaire), type_affaire 
from stg_production

delete from stg_type_transaction where libelle_type_transaction = 'N/A';

select * from stg_type_transaction;

