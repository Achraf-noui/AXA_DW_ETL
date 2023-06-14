drop table if exists stg_pack;

create table stg_pack(
code_pack int,
lib_pack varchar(40),
[description] varchar(255) default 'N/A'
);

bulk insert stg_pack
from 'C:\Users\DELL\Desktop\AXA_DW_ETL\data\packs.csv'
with (FIELDTERMINATOR = ';', FIRSTROW = 2, ROWTERMINATOR = '\n');

select * from stg_pack;

