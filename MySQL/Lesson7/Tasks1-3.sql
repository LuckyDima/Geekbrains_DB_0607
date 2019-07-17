
/*
 Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
 С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
 с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 с 18:00 до 00:00 — "Добрый вечер", 
 с 00:00 до 6:00 — "Доброй ночи".
  */

DELIMITER //

drop function  if exists hello;
create function hello()
returns varchar(32) deterministic
begin
	declare out_message varchar(32);
	declare dt time;
   	set dt = time(now());
 select 
 	case 
 		when dt between '06:00:01' and '12:00:00' then 'Доброе утро'
 		when dt between '12:00:01' and '18:00:00' then 'Добрый день'
 		when dt between '18:00:01' and '23:59:59' then 'Добрый вечер'
 		else 'Доброй ночи'
 	end
 	into out_message;
  return out_message;
end//



/*
 В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 Допустимо присутствие обоих полей или одно из них. 
 Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */

delimiter //
drop trigger if exists one_of_must_be_not_null_before_insert;//
create trigger one_of_must_be_not_null_before_insert
before insert 
on products for each row
begin
	if (new.name is null and new.description is null) then
		signal sqlstate '45000' SET MESSAGE_TEXT = 'Поле name или description должны быть заполнены!';
	end if;
end;//


drop trigger if exists one_of_must_be_not_null_before_update;//
create trigger one_of_must_be_not_null_before_update
before update 
on products for each row
begin
	if (new.name is null and new.description is null) then
		signal sqlstate '45000' SET MESSAGE_TEXT = 'Поле name или description должны быть заполнены!';
	end if;
end;//



/*
(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
Вызов функции FIBONACCI(10) должен возвращать число 55.
*/

delimiter //

drop procedure if exists fibonachi;

create procedure fibonachi(in num int)
begin
	declare fib_sum,fib1 int default 0;
	declare fib2 int default 1;
	declare fib_row varchar(256) default '0';
	while num > 1 do
		set fib_sum = fib1 + fib2;
		set fib1 = fib2;
		set fib2 = fib_sum;
		set num = num -1;
		set fib_row = concat(fib_row,',', fib_sum );
	end while;
select fib_row as 'Ряд Фибоначи';
end;//
