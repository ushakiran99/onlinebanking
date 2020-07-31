create database if not exists OnlineBanking;
use OnlineBanking;
drop table if exists bankdata;
create table bankdata(credit int, debit int, transid int primary key auto_increment, balance int);
insert into bankdata(credit,debit,balance) values(50000,1000,49000);
insert into bankdata(credit,debit,balance) values(1000,1000,49000);
insert into bankdata(credit,debit,balance) values(1000,1000,49000);
select * from bankdata;