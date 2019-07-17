create database if not exists example;
show databases;
use example;
create table if not exists users(id tinyint AUTO_INCREMENT, name varchar(255) null default 'инкогнито' , primary key (id));
show tables;
describe users;
insert into users(name) values (default),(CURRENT_USER());
select * from users;


mysqldump --user=root --password=root example > C:\Backup\example.sql
или 
mysqldump --user=root --password=root -d -B example > C:\Backup\example.sql (дает возможность использовать create database ... if not exist )

create database sample;
mysqldump --user=root --password=root example > C:\Backup\sample.sql
далее прописыывем в файле sample.sql конструкцию USE `sample`;
mysqldump --user=root --password=root sample < C:\Backup\sample.sql

