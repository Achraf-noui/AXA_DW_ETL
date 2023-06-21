drop table if exists dim_agence;

create table dim_agence(
agence_id int identity(1,1) NOT NULL,
code_agence varchar(128),
nom_agence varchar(255),
type_agence varchar(255) default 'N/A',
wilaya_commune varchar(127) default 'N/A',
region varchar(128) default 'N/A',
date_ouverture varchar(128) default 'N/A',
coord_gps varchar(255) default 'N/A',
PRIMARY KEY (agence_id)
);

--select * from dim_agence;
ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_agence;
truncate table dim_agence;

-- Insert from staging AGS =================

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
from stg_ags;

-- Insert from staging AGC =================

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
select cast(code_agence as int), 
nom_agence, 
type_agence, 
wilaya_commune, 
region_agence, 
date_ouverture, 
coord_gps
from stg_agc;

-- Insert from staging AGA =================

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
nom_aga, 
type_agence, 
'N/A', 
region_agence, 
horaire_ouverture, 
coord_gps
from stg_aga;

select count(*) from dim_agence;

--select count(distinct (id_agence )), 'inconnu' from stg_production where id_agence not in (select code_agence from dim_agence);

insert into dim_agence (code_agence, nom_agence)
select distinct (id_agence ), 'inconnu'
from stg_production where id_agence not in (select code_agence from dim_agence);
go

select count(*) from dim_agence;
