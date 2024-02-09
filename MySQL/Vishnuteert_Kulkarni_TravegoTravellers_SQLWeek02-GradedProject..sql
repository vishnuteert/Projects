# Part I

create database Travego;
use Travego;

create table passenger (
passenger_id int,
passenger_name varchar(20),
category varchar(20),
gender varchar (20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20));

create table price(
id int,
bus_type varchar(20),
distance int,
price int);

insert into passenger
values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting') ;

insert into price
values
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

# Part II

# a) How many female passengers traveled a minimum distance of 600KMs ?
select count(*) as female_passengers from passenger 
where gender = 'F' and distance >=600 ;

# b) Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus ? 
select * from passenger where distance > 500 and bus_type = 'sleeper'; 

# c) Select passenger names whose names start with the character 'S'?
select * from passenger where passenger_name like 'S%';

# d) Calculate the price charged for each passenger, displaying the Passengername, BoardingCity, DestinationCity, Bustype, and Price in the output ?
select passenger.passenger_name,passenger.boarding_city,passenger.destination_city,passenger.bus_type,price.price from passenger,price where passenger.distance = price.distance;

# e) What are the passengername(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus ?
SELECT passenger.passenger_name,price.price from passenger,price where passenger.distance > 1000 and passenger.bus_type = 'Sitting';

# f) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji ?  
select bus_type,price from price where distance = (select distance from passenger where passenger_name = 'Pallavi');

# g) Alter the column category with the value "Non-AC" where the Bus_Type is sleeper ?
update passenger set category = 'NON-AC' where bus_type = 'Sleeper';

# h) Delete an entry from the table where the passenger name is Piyush and commit this change in the database ?
delete from passenger where passenger_name = 'Piyush';
commit;

# i) Truncate the table passenger and comment on the number of rows in the table ?
truncate table passenger;

# j) Delete the table passenger from the database ?
drop table passenger;
