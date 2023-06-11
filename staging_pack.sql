drop table if exists stg_pack;

create table stg_pack(
pack_id int identity(1,1),
code_pack int,
lib_pack varchar(40)
);

insert into stg_pack (code_pack, lib_pack)
select distinct id_pack, lib_pack from stg_production;

select * from stg_pack;

