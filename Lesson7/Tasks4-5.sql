
/*
 Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
 идентификатор первичного ключа и содержимое поля name.
 */

drop table if exists shop.logs;

CREATE TABLE shop.logs (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	table_name varchar(100) NOT NULL,
	ext_id INT NOT NULL,
	name varchar(100) NULL,
	update_time DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
	
)
ENGINE=ARCHIVE
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


delimiter //
drop trigger if exists users_after_insert;//
create trigger users_after_insert
after insert 
on users for each row
begin
	insert into shop.logs (table_name,ext_id,name) values ('users',LAST_INSERT_ID(),new.name);
end;//


delimiter //
drop trigger if exists catalogs_after_insert;//
create trigger catalogs_after_insert
after insert 
on catalogs for each row
begin
	insert into shop.logs (table_name,ext_id,name) values ('catalogs',LAST_INSERT_ID(),new.name);
end;//

delimiter //
drop trigger if exists products_after_insert;//
create trigger products_after_insert
after insert 
on products for each row
begin
	insert into shop.logs (table_name,ext_id,name) values ('products',LAST_INSERT_ID(),new.name);
end;//



/*
 (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
 */
set @birthday := now();

insert into shop.users (name,birthday_at)
with recursive 
cte_1 (n) as 
(
select 1 
union all select n + 1 from cte_1 where n < 1
union all select n + 1  from cte_1 where n < 20
union all select n + 1  from cte_1 where n < 20
)
select n, @birthday
from cte_1 where n <= 100000;


