------------------ TABLE AGC ------------------

-- creation de la table AGS ---------
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

truncate table stg_ags;

bulk insert stg_ags
from 'C:\Users\DELL\Desktop\code_PFE\data\ags.csv'
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

-- insertion du resultat dans la dimension agence

truncate table dim_agence;

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
from stg_ags

select * from dim_agence;

