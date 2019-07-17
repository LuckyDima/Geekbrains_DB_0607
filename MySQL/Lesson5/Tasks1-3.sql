/*
 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

select 
	u.name 
from users u
 where exists (select 1 from orders o where u.id = o.user_id);
 
 select distinct
 	u.name
 from users u 
 join orders o on u.id = o.user_id;
 
 select distinct
 	u.name
 from users u
 left join orders o on u.id = o.user_id
 where o.user_id is not null;
  
 select 
 	u.name
 from users u
 where u.id in (select user_id from orders);
 
 
/*
 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
 
select 
	p.name, c.name 
from products p
join catalogs c on p.catalog_id = c.id;

/*
3. (по желанию) 
Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.
*/

drop table if exists `flights`;
create table flights 
			(
			id SERIAL not null primary key, 
			`from` varchar(128) not null, 
			`to` varchar(128) not null 
			);

drop table if exists `cities`;
create table cities 
			(
			`label` varchar(128) not null , 
			name varchar(128) not null 
			);		

insert into flights (`from`,`to`) values ('Moscow','Omsk');
insert into flights (`from`,`to`) values ('Novgorod','Kazan');
insert into flights (`from`,`to`) values ('Irkutsk','Moscow');
insert into flights (`from`,`to`) values ('Omsk','Irkutsk');
insert into flights (`from`,`to`) values ('Moscow','Kazan');

select * from flights;

insert into cities (label, name) values('Moscow', 'Москва');
insert into cities (label, name) values('Irkutsk', 'Иркутск');
insert into cities (label, name) values('Novgorod', 'Новгород');
insert into cities (label, name) values('Kazan', 'Казань');
insert into cities (label, name) values('Omsk', 'Омск');

select * from cities;



select * from flights order by 1;

/*
Способ 1
*/
select 
	f.id, 
	ifnull(c.name,f.from) `from`, 
	ifnull(cc.name,f.to) `to`
from flights f
left join cities c on f.from = c.label
left join cities cc on f.to = cc.label
order by 1;

/*
Способ 2
*/
select 
	f.id, 
	ifnull((select c.name from cities c where c.label = f.from),f.from) `from`,
	ifnull((select c.name from cities c where c.label = f.to) ,f.to) `to`
from flights f
order by 1;

		
		
		
		
		




 