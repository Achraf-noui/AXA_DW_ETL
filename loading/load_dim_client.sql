drop table if exists dim_client;

create table dim_client(
client_id int identity(1,1) primary key,
code_personne int,
first_name varchar(50),
last_name varchar(50),
sexe varchar(10),
data_naissance date,
commune varchar(50),
wilaya varchar(50),
permis varchar(5),
date_obtention date
);
go

insert into dim_client
select 
id_personne, 
first_name,
last_name, 
gender, 
birthDate, 
commune, 
wilaya, 
permis, 
date_obtention
from stg_client

select count(*) from dim_client
