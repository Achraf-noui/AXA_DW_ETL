drop table if exists dim_pack;

create table dim_pack(
pack_id int identity (1,1),
code_pack int,
libelle_pack varchar(20),
[description] varchar(255)
constraint pk_dim_pack primary key (pack_id)
);
go

insert into dim_pack (code_pack, libelle_pack, [description])
select code_pack, lib_pack, [description] 
from stg_pack;

select * from dim_pack;



