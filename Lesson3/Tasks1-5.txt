use shop;

truncate table users;

insert into users (name,birthday_at)
values
('Гриша',  '1978-05-28'),
('Марина', '1935-02-12'),
('Руслан', '1999-11-18'),
('Ольга',  '1977-09-21'),
('Максим', '1954-02-17');

insert into users (name,birthday_at,created_at,updated_at)
values
('Вот его и поправим',null,null,null);

select * from users;

/*
 Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 Заполните их текущими датой и временем.
 */

update users
set 
	 created_at = if(created_at is null, now(), created_at)
	,updated_at = if(updated_at is null, now(), updated_at)
where created_at is null or updated_at is null;

select * from users;


/*
 Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

 */
 
ALTER TABLE users MODIFY COLUMN created_at VARCHAR(20);

ALTER TABLE users MODIFY COLUMN updated_at VARCHAR(20);

update users 
set 
	created_at = '20.10.2017 8:10', 
	updated_at = concat('20.10.1',concat(cast(FLOOR(1+RAND()*999) as CHAR(3)),' ',cast(FLOOR(1+RAND()*24) as char(2)),':',cast(FLOOR(1+RAND()*59) as char(2))))

select * from users;

update users
set
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i') ,
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i') 

select * from users;

ALTER TABLE users MODIFY COLUMN created_at datetime default now() not null;

ALTER TABLE users MODIFY COLUMN updated_at datetime default now() on update now();


/*
 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
 чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */

truncate table storehouses_products
select * from storehouses_products
INSERT INTO shop.storehouses_products (storehouse_id, product_id, value, created_at, updated_at) 
VALUES(1, 1,  10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 2,  60, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 3,  44, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 4,  0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 20, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 30, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)

select * from storehouses_products order by if(value=0,99999,value) asc


/*
(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')
 */

insert into users (name,birthday_at)
values ('Любовь','1973-08-31');

select 
t.name,t.month_name,t.birthday_at
from
(
select 
	name,
	monthname(birthday_at) as month_name,
	birthday_at
from users where birthday_at is not null
) as t 
where month(str_to_date(left(month_name,3),'%b')) in (5,8);

/*
 (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
 */

select * from catalogs;

select * from catalogs
	where id in (5, 1, 2)
order by case 
			when id = 5 then 0 
			when id = 1 then 1
			when id = 2 then 2
		  end
 
	