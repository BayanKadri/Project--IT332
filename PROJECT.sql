--Database Script--

create table BOOKS(
ISBN number(10) ,
B_name VARCHAR2(100) NOT NULL,
B_TYPE VARCHAR2(20),
B_State VARCHAR2(40),
CONSTRAINT ISBN_pk PRIMARY KEY(ISBN));

create table bookinfo(
ISBN1 number(10)NOT NULL,
Author VARCHAR2(30),
Publisher VARCHAR2(20),
CONSTRAINT ISBN1_pk PRIMARY KEY (ISBN1),
CONSTRAINT ID_book_fk FOREIGN KEY (ISBN1) REFERENCES BOOKS (ISBN));


create table  MEMBERS (
ID number (10),
Fname VARCHAR2(20),
Lname VARCHAR2(20),
Date_of_birth DATE,
Member_type  CHAR(10) NOT NULL,
Email VARCHAR2(20),
CONSTRAINT ID_pk PRIMARY KEY (ID));

create table member_phone(
ID_m number(10),
M_phone number(20),
CONSTRAINT ID_m_pk PRIMARY KEY (ID_m),
CONSTRAINT ID_fk FOREIGN KEY (ID_m) REFERENCES MEMBERS (ID));



create table member_address(
ID_madd number(10),
City VARCHAR2(10),
Buliding VARCHAR2(10),
Street VARCHAR2(10),
CONSTRAINT ID_madd_pk PRIMARY KEY (ID_madd),
CONSTRAINT ID_madd_fk FOREIGN KEY (ID_madd) REFERENCES MEMBERS (ID));

create table Staff (
SS_num number(10) ,
Fname VARCHAR2(20),
Lname VARCHAR2(20),
Age number(2),
Email VARCHAR2(50),
Gender VARCHAR2(10), 
Salary number (10),
CONSTRAINT SS_num PRIMARY KEY (SS_num));

create table staff_phone(
SS_numST number(10),
S_phone number(20),
CONSTRAINT SS_numST_pk PRIMARY KEY (SS_numST),
CONSTRAINT SS_numST_fk FOREIGN KEY (SS_numST) REFERENCES Staff (SS_num));

create table staff_privilege(
SS_numSP number(10),
Privilege VARCHAR2 (10),
CONSTRAINT SS_numSP_pk PRIMARY KEY (SS_numSP),
CONSTRAINT SS_numSP_fk FOREIGN KEY (SS_numSP) REFERENCES Staff (SS_num));


create table Branch(
Branch_num number(10),
B_Name VARCHAR2(30),
Location VARCHAR (100),
CONSTRAINT Branch_num_pk PRIMARY KEY (Branch_num));

create table Branch_phone (
Branch_num1 number (10),
B_phone number(20),
CONSTRAINT Branch_num1_pk PRIMARY KEY (Branch_num1),
CONSTRAINT Branch_num1_fk FOREIGN KEY (Branch_num1) REFERENCES Branch (Branch_num));

create table room(
Room_num number(10),
R_State VARCHAR2(20),
Room_type VARCHAR2 (30),
Period_of_stay VARCHAR2(20),
CONSTRAINT Room_num_pk PRIMARY KEY (Room_num));

create table Fines(
Fine_num  number(10) , 
F_State VARCHAR2(20),
Amount_of_fine number (10),
F_Description VARCHAR2 (100),
CONSTRAINT Fine_num_pk PRIMARY KEY(Fine_num));

create table Privilege1(
Privilege_num number(10),
P_Name VARCHAR2 (20),
Loan_period number(20) NOT NULL,
Max_of_item number(20) NOT NULL,
CONSTRAINT Privilege_num_pk PRIMARY KEY (Privilege_num));

create table Item(
Item_num number (10) NOT NULL,
Item_type VARCHAR2(20),
Publisher VARCHAR(20),
I_Description VARCHAR2(30),
CONSTRAINT Item_num_pk PRIMARY KEY(Item_num));

create table Loan(
Loan_num number (20) NOT NULL,
Date_of_due DATE ,
Date_loaned DATE ,
CONSTRAINT Loan_num_pk PRIMARY KEY(Loan_num));

create table other_services (
S_name VARCHAR (10) NOT NULL,
OS_Description VARCHAR2 (100) ,
CONSTRAINT S_name_pk PRIMARY KEY(S_name));

create table classifications(
C_ID number(15) ,
C_Name VARCHAR2(50),
CONSTRAINT C_ID_pk PRIMARY KEY(C_ID));

--Insert Data--
insert into BOOKS VALUES (0137,'Software','Electronic','Available');
insert into BOOKS VALUES (0133,'Database','Physical','Available');
insert into BOOKS VALUES (0139,'UNIX','Physical','Unavailable');

insert into bookinfo VALUES (0137,'IAN','Dec 8,2011');
insert into bookinfo VALUES (0133,'Ramez','June 8,2015');
insert into bookinfo VALUES (0139,'EVI','4th E,2011');

--View--
 create view vBookStatus
as select BOOKS.ISBN ,BOOKS.B_State, bookinfo.Author
from BOOKS,bookinfo
WHERE bookinfo.ISBN1=BOOKS.ISBN and BOOKS.B_State ='Available';

Select * FROM vBookStatus;

--Data Access--
create role BookRole NOT IDENTIFIED;
GRANT SELECT ON vBookStatus to BookRole;

select * from SYS.vBookStatus;