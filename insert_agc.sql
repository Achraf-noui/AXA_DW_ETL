------------------ TABLE AGC ------------------

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
from 'C:\Users\DELL\Desktop\code_PFE\data\agc.csv'
WITH (FIELDTERMINATOR = ';', FIRSTROW=2, ROWTERMINATOR = '\n');

-- Transformation: separer la commune ou wilaya du nom de l'agence

alter table stg_agc 
add wilaya_commune varchar(128), 
	type_agence varchar(10);

update stg_agc
set wilaya_commune = case when CHARINDEX('AGC', nom_agc) > 0 then SUBSTRING(nom_agc, charindex('AGC', nom_agc) + 4, LEN(nom_agc) - charindex('AGC', nom_agc) - 3)  
	                 else 'N/A' end,
	type_agence = 'AGC';

insert into dim_agence
(
code_agence,
nom_agence,
type_agence,
wilaya_commune,
region,
date_ouverture,
coord_gps
)
select code_agence, 
nom_agence, 
type_agence, 
wilaya_commune, 
region_agence, 
date_ouverture, 
coord_gps
from stg_agc

--select * from ETL_TEST.dbo.stg_agc;


