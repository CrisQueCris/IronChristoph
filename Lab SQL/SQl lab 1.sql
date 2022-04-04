use sakila;
select * from actor;
select * from address;
select * from category;
select * from country;
select title from film;
select distinct name as language from language;

select count(store_id) as 'number of stores'  from store;

select count(staff_id) from staff;

select distinct first_name from staff;