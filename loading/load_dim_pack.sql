USE AXA_DW
go
--ALTER TABLE fait_transac_production DROP CONSTRAINT if exists fk_dim_pack;

drop table if exists dim_pack;

create table dim_pack(
pack_id int identity (1,1),
code_pack int,
libelle_pack varchar(20),
produit varchar(255)
constraint pk_dim_pack primary key (pack_id)
);


--truncate table dim_pack;

insert into dim_pack (code_pack, libelle_pack, produit)
select code_pack, lib_pack, produit
from stg_pack;

select count(*) from dim_pack;


