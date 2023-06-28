USE AXA_DW
go

drop table if exists stg_client;

create table stg_client(
id_personne int,
first_name varchar(50),
last_name varchar(50),
gender varchar(50),
birthDate date,
commune varchar(50) default 'N/A',
daira varchar(50) default 'N/A',
wilaya varchar(50) default 'N/A',
wilaya_id int default -1,
permis varchar(5),
date_obtention date,
);

bulk insert stg_client
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\personnes.csv'
with (FIELDTERMINATOR = ';', FIRSTROW = 2, ROWTERMINATOR = '\n');

insert into stg_client 
values(-1, 'client MRP', 'N/A', 'N/A', '2001-01-01', 'N/A', 'N/A', 'N/A', -1, 'N/A', '2001-01-01') 

select * from stg_client



