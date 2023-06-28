USE AXA_DW;

drop table if exists stg_pack;

create table stg_pack(
code_pack int,
lib_pack varchar(40),
produit varchar(255) default 'N/A'
);

bulk insert stg_pack
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\packs.csv'
with (FIELDTERMINATOR = ';', FIRSTROW = 2, ROWTERMINATOR = '\n');

update stg_pack
set produit = 'Auto'

insert into stg_pack values(-1, 'MRP', 'MRP')



