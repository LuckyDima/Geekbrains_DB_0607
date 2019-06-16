/*
 Подсчитайте средний возраст пользователей в таблице users
*/

select 
FLOOR(AVG(DATEDIFF(now(),birthday_at))/365.25)
from users 
where birthday_at is not null;

/*
 Подсчитайте количество дней рождения, которые приходятся на каждую из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
select 
group_concat(name) as names,
dayname(concat(year(now()),'-',date_format(STR_TO_DATE(birthday_at,'%Y-%m-%d'),'%m-%d'))) as day_name,
count(*) as count_of_birthdays
from users 
where birthday_at is not null
group by
dayofweek(concat(year(now()),'-',date_format(STR_TO_DATE(birthday_at,'%Y-%m-%d'),'%m-%d')))
order by dayofweek(concat(year(now()),'-',date_format(STR_TO_DATE(birthday_at,'%Y-%m-%d'),'%m-%d')));


/*
 (по желанию) Подсчитайте произведение чисел в столбце таблицы
*/

/* рекусивно через cte  без таблицы, расчет факториала */

with recursive fac(n, f) as
(
 select 1, 1 
  union all
 select n+1, f*(n+1) from fac where n < 5
)
select * from fac;


/* Да я был крайне удивлен, что нельзя сделать неименовынный цикл, только черз функцию или процедуру */

	



