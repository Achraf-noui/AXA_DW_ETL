drop table if exists dim_agence;

create table dim_agence(
agence_id int identity(1,1) NOT NULL,
code_agence varchar(128),
nom_agence varchar(255),
type_agence varchar(255) default 'N/A',
wilaya_commune varchar(127) default 'N/A',
region varchar(128) default 'N/A',
date_ouverture varchar(128),
coord_gps varchar(255),
PRIMARY KEY (agence_id)
);

--select * from dim_agence;

