USE AXA_DW
go


drop table if exists dim_type_transaction;

create table dim_type_transaction(
type_transaction_id int identity(1,1) not null,
code_type_transaction int not null,
libelle_type_transaction varchar(255)
constraint pk_type_transac primary key (type_transaction_id)
);



insert into dim_type_transaction (code_type_transaction, libelle_type_transaction)
select code_type_transaction, libelle_type_transaction
from stg_type_transaction;

select count(*) from dim_type_transaction;
go 