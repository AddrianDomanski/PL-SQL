-- Create the following tables. Some of the datatypes are indicated, but for others you
-- need to decide the most appropriate ones.
CREATE TABLE ACTIVITY (
code char(4) constraint pk_activity primary key,
description varchar2(100));

CREATE TABLE ChildrenAct(
activity char(4) constraint pk_childrenAct primary key 
constraint fk_childrenAct_activity references activity);

CREATE TABLE AdultAct(
activity char(4) constraint pk_adultact primary key 
constraint fk_adultact_activity references activity);

CREATE TABLE ActALL(
activity char(4) constraint pk_aactall primary key 
constraint fk_aactall_activity references activity);

CREATE TABLE substChildren(
activ1 char(4) constraint fk_substchildren_activ1 references ChildrenAct,
activ2 char(4) constraint fk_substchildren_activ1 references ChildrenAct,
constraint pk_substchidren primary key(activ1, activ2)); 

CREATE TABLE substAdults(
activ1 char(4) constraint fk_substadults_activ1 references AdultAct,
activ2 char(4) constraint fk_substadults_activ1 references AdultAct,
constraint pk_substadults primary key(activ1, activ2)); 

CREATE TABLE substAll(
activ1 char(4) constraint fk_substall_activ1 references ActALL,
activ2 char(4) constraint fk_substall_activ1 references ActALL,
constraint pk_susttodos primary key(activ1, activ2)); 

CREATE TABLE CUSTOMER(
nif char(9) constraint pk_customer primary key,
CustomerName varchar2(40) not null,
phone  char(11) not null,
town varchar2(40),
province varchar2(30),
country varchar2(30));

CREATE TABLE EMPLOYEE(
nif char(9) constraint pk_employee primary key,
employeeName varchar2(40),
address varchar2(30),
town varchar2(40),
phone char(11),
studies  varchar2(50));



-- Create a view called v_individuals_cat_check that contains the number and
-- category of the individual rooms. Use WITH CHECK OPTION when you create the
-- view.

create view v_individuals_cat_check
as select roomNumber, category
   from room
  where category='I'
with check option;


-- Create a view called “v_customers_alicante_nif” that contains the nif, name, city
-- and phone number for customers from the Alicante province.
--
-- Insert into the view the customer “Rodrigo López”, who is from “Alcoy”, with phone
-- number “646565444” and nif “99999999Z”.
--
-- Insert into the view the customer “Miguel Bermejo”, who is from “Villena”, with
-- phone number “646555555” and nif “21668899P”.
create view v_customer_alicante_nif
as select nif, CustomerName, town, phone
   from customer
   where UPPER(province)='ALICANTE';

insert into v_customer_alicante_nif values('99999999Z','Rodrigo López','Alcoy','646565444');

insert into v_customer_alicante_nif values('21668899P','Miguel Bermejo','Villena','646555555');