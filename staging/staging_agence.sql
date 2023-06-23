USE AXA_DW
--============================================

--Staging agence AGS type

--============================================

DROP TABLE IF EXISTS stg_ags;

create table stg_ags(
nom_agence varchar(255),
code_agence int,
region_agence varchar(128),
nom_tel_da varchar(255),
telephone varchar(128),
quatr_chiffre varchar(128),
email varchar(255),
adresse varchar(255),
date_ouverture varchar(128),
coord_gps varchar(255), 
horraire_ouv varchar(255),
);

-- Remplissage a partir du fichier csv -------

bulk insert stg_ags
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\ags.csv'
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');

-- Transformation: separer la commune ou wilaya du nom de l'agence

alter table stg_ags 
add wilaya_commune varchar(128), 
	type_agence varchar(10);

update stg_ags
set nom_agence = case when CHARINDEX('(', nom_agence) > 0 then SUBSTRING(nom_agence, 1, charindex('(', nom_agence) - 1)
				else nom_agence end,
	wilaya_commune = case when CHARINDEX('(', nom_agence) > 0 then SUBSTRING(nom_agence, charindex('(', nom_agence) + 1, LEN(nom_agence) - charindex('(', nom_agence) - 1)
	                 else 'N/A' end,
	type_agence = 'AGS';
go
-- insertion du resultat dans la dimension agence

--==================================================

------------------ Staging agence AGC type ------------------

--===================================================

DROP TABLE IF EXISTS stg_agc;

create table stg_agc(
region_agence varchar(128) default 'N/A',
nom_agc varchar(255) default 'N/A',
date_ouverture varchar(128) default 'N/A',
nom_agence varchar(255) default 'N/A',
code_agence varchar(128) default 'N/A',
nom_tel_da varchar(255)default 'N/A',
telephone varchar(128) default 'N/A',
email varchar(255) default 'N/A',
adresse varchar(255) default 'N/A',
coord_gps varchar(255) default 'N/A', 
horraire_ouv varchar(255) default 'N/A',
);

bulk insert stg_agc
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\agc.csv' 
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');

-- Transformation: separer la commune ou wilaya du nom de l'agence

alter table stg_agc 
add wilaya_commune varchar(128), 
	type_agence varchar(10);

update stg_agc
set wilaya_commune = case when CHARINDEX('AGC', nom_agc) > 0 then SUBSTRING(nom_agc, charindex('AGC', nom_agc) + 4, LEN(nom_agc) - charindex('AGC', nom_agc) - 3)  
	                 else 'N/A' end,
	type_agence = 'AGC';

update stg_agc
set code_agence = SUBSTRING(code_agence, charindex('AGC', code_agence) + 4, 5)
go


--======================================
-- STAGING AGA 
--======================================

DROP TABLE IF EXISTS stg_aga;

create table stg_aga(
region_agence varchar(128) default 'N/A',
nom_aga varchar(255) default 'N/A',
date_ouverture varchar(10) default 'N/A',
code_agence INT default -1,
num_tel varchar(128) default 'N/A',
num_tel_fix varchar(128) default 'N/A',
email_agent varchar(128) default 'N/A',
email_aga varchar(128) default 'N/A',
adresse varchar(128) default 'N/A',
coord_gps varchar(128) default 'N/A',
horaire_ouverture varchar(128) default 'N/A',
);

bulk insert stg_aga
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\aga.csv' 
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');

-- Transformation: separer la commune ou wilaya du nom de l'agence

alter table stg_aga add type_agence varchar(10);

update stg_aga
set type_agence = 'AGA';
go




