drop table bill;
drop table outpatient;
drop table inpatient;
drop table lab;
drop table room;
drop table doctor;
drop table patient;



create table patient(
id integer not null,
name varchar(15) not null,
gender varchar(8) not null,
age integer not null,
weight integer not null,
phone_no integer not null,
disease varchar(18) not null,
address varchar(15) not null,
primary key(id)
);

create table doctor(
id integer not null,
p_id integer not null,
doc_name varchar(50) not null,
department varchar(40) not null,
primary key(id),
foreign key (p_id) references patient(id)
);

create table room(
room_no integer not null,
p_id integer,
room_type varchar(15) not null,
status varchar(18) not null,
room_charge integer not null,
primary key(room_no),
foreign key(p_id) references patient(id) 
);

create table lab(
lab_no integer not null,
r_no integer,
patient_type varchar(50) not null,
primary key(lab_no),
foreign key(r_no) references room(room_no)
);




create table inpatient(
p_id integer not null,
l_no integer not null,
r_no integer not null,
date_of_admin date not null ,
date_of_dis date not null,
advance integer not null,
primary key(date_of_dis),
foreign key(p_id) references patient(id),
foreign key(l_no) references lab(lab_no),
foreign key(r_no) references room(room_no)
);

create table outpatient(
p_id integer not null,
dates date not null,
l_no integer not null,
primary key(dates),
foreign key(p_id) references patient(id),
foreign key(l_no) references lab(lab_no)
);


create table bill(
bill_no integer,
p_id integer,
date_s date not null,
d_of_dis date not null,
p_type varchar(30),
p_disease varchar(18) not null ,
d_charge  integer not null,
medicine_charge integer not null,
r_charge integer not null,
operation_charge integer,
lab_charge integer,
advance integer,
no_of_days integer,
discount integer,
total integer,
primary key(bill_no),
foreign key(p_id) references patient(id),
foreign key(date_s) references outpatient(dates),
foreign key(d_of_dis) references inpatient(date_of_dis)
);


insert into patient values(101, 'Mujib',   'Male',   28, 69, '01730203040', 'Allergy',       'Pabna');
insert into patient values(102, 'Nabi ',   'Male',   32, 75, '01740304050', 'Broken bone',   'Bogra');
insert into patient values(103, 'Karim',   'Male',   40, 80, '01750405050', 'Cancer',        'Barishal');
insert into patient values(104, 'Hekmot',  'Male',   35, 72, '01760506060', 'Heart problem', 'Noakhali');
insert into patient values(105, 'Shahida', 'Female', 28, 57, '01770607070', 'Apendix',       'Rangpur');
insert into patient values(106, 'Afifa',   'Female', 30, 60, '01780708080', 'Brain strem',   'Dhaka');
insert into patient values(107, 'Jhon',    'Male',   28, 60, '01790809090', 'lungs problem', 'Pabna');
insert into patient values(108, 'Frylink', 'Male',   45, 75, '01710101010', 'Kidney Damage', 'Comilla');
insert into patient values(109, 'Allena',  'Female', 28, 69, '01720304040', 'Teeth problem',  'Mymensing');
insert into patient values(110, 'Susmita', 'Female', 35, 73, '01790305080', 'High Fever',    'Tangail');
insert into patient values(111, 'Taskin',  'Male',   25, 70, '01711406090', 'Foot Injury',   'Dhaka');
insert into patient values(112, 'Shayan',  'Male',   01, 08, '01723789476', 'Common Cold',   'Dhaka');
insert into patient values(113, 'Nusrat',  'Female', 35, 73, '01790305080', 'Diabetes',      'Tangail');
insert into patient values(114, 'Aarshi',  'Female', 35, 73, '01790305080', 'Depression',    'Tangail');
insert into patient values(115, 'Sanjana', 'Female', 35, 73, '01790305080', 'Ear problem',   'Tangail');
insert into patient values(116, 'Kulsum',  'Female', 35, 73, '01790305080', 'AIDS',         'Dhamrai');


insert into doctor values(201, 101, 'Dr.Alica ',           'Allergist-immonologist ');
insert into doctor values(202, 103, 'Dr.Jennifer',         'Rediation Oncologist');
insert into doctor values(203, 109, 'Dr.Joyce',            'Dentist');
insert into doctor values(204, 106, 'Dr.Jabbar Ahmad',     'Neurologist');
insert into doctor values(205, 115, 'Dr.Smith',            'Ent Specialist');
insert into doctor values(206, 111, 'Dr.James ',           'Podiatrist');
insert into doctor values(207, 112, 'Dr.N.A Khan(Imran)',  'Pediatrician');
insert into doctor values(208, 105, 'Dr.D M Mohiduzzaman', 'Surgeon');
insert into doctor values(209, 102, 'Dr.Fahmida Khan',     'Orthopedic surgeon');
insert into doctor values(210, 114, 'Dr.Mizanur Rahman',   'Psychiatrists');
insert into doctor values(211, 108, 'Dr.Anwarul Islam',    'Urologist');
insert into doctor values(212, 104, 'Dr.A.Beller',         'Cardiology');
insert into doctor values(213, 107, 'Dr.Fazlul Haque',     'Pulmonologist');
insert into doctor values(214, 113, 'Dr.A.Beller',         'Endocrinologist');
insert into doctor values(215, 116, 'Dr.A.B.Yunus',        'Infectious Specialist');
insert into doctor values(216, 110, 'Dr.Sharmin Rahman',   'Medicine Specialist');

insert into room values(401, 110, 'Cabin',     'Available',   3000);
insert into room values(402, 108, 'VIP Cabin', 'Reservation', 5000);
insert into room values(403, 113, 'Normal ',   'Available',   1000);
insert into room values(404, 105, 'OT',        'Available',   7000);
insert into room values(405, 107, 'Cabin',     'Available',   3000);
insert into room values(406, 106, 'OPT',       'Available',   6000);
insert into room values(407, 111, 'AC',        'Available',   2500);
insert into room values(408, 116, 'Normal',    'Available',   1000);
insert into room values(409, 103, 'AC',        'Available',   2500);
insert into room values(410, 104, 'Normal',    'Available',   1000);

insert into lab values(1,  401, 'Checkup');
insert into lab values(2,  402, 'Surgery');
insert into lab values(3,  405, 'Lungs scan');
insert into lab values(4,  408, 'Full Body Scan');
insert into lab values(5,  403, 'Diabetes Test');
insert into lab values(6,  409, 'CT Scan');
insert into lab values(7,  406, 'MIR');
insert into lab values(8,  404, 'Ultrasonography');
insert into lab values(9,  410, 'ECG');
insert into lab values(10, 407, 'X-ray');


insert into inpatient values(110, 1,  401, '12-Jan-2019', '12-Jan-2019', 0000);
insert into inpatient values(108, 2,  402, '10-Jan-2019', '13-Jan-2019', 2000);
insert into inpatient values(113, 5,  403, '14-Jan-2019', '14-Jan-2019', 3000);
insert into inpatient values(105, 8,  404, '12-Jan-2019', '15-Jan-2019', 4000);
insert into inpatient values(107, 3,  405, '09-Jan-2019', '16-Jan-2019', 6000);
insert into inpatient values(106, 7,  406, '14-Jan-2019', '17-Jan-2019', 2500);
insert into inpatient values(111, 10, 407, '18-Jan-2019', '18-Jan-2019', 4000);
insert into inpatient values(116, 4,  408, '19-Jan-2019', '19-Jan-2019', 7000);
insert into inpatient values(103, 6,  409, '16-Jan-2019', '20-Jan-2019', 3500);
insert into inpatient values(104, 9,  410, '19-Jan-2019', '22-Jan-2019', 4500);

insert into outpatient values(110, '12-Jan-2019', 1);
insert into outpatient values(108, '11-Jan-2019', 2);
insert into outpatient values(113, '14-Jan-2019', 5);
insert into outpatient values(105, '13-Jan-2019', 8);
insert into outpatient values(107, '10-Jan-2019', 3);
insert into outpatient values(106, '15-Jan-2019', 7);
insert into outpatient values(111, '18-Jan-2019', 10);
insert into outpatient values(116, '19-Jan-2019', 4);
insert into outpatient values(103, '17-Jan-2019', 6);
insert into outpatient values(104, '20-Jan-2019', 9);



insert into bill values(1001, 110, '12-Jan-2019', '12-Jan-2019', 'Checkup',         'High Fever',    500,  400,   3000,  0000,  1000, 0000, 1, 0000, 4900);
insert into bill values(1002, 108, '11-Jan-2019', '13-Jan-2019', 'Surgery',         'Kidney Damage', 2500, 5000,  20000, 8000,  2000, 2000, 4, 5000, 30500);
insert into bill values(1003, 113, '14-Jan-2019', '14-Jan-2019', 'Diabetes Test',   'Diabetes',      600,  1500,  1000,  0000,  1000, 3000, 1, 100,  4000);
insert into bill values(1004, 105, '13-Jan-2019', '15-Jan-2019', 'Ultrasonography', 'Apendix',       1000, 12000, 28000, 15000, 2000, 4000, 3, 9000, 45000);
insert into bill values(1005, 107, '10-Jan-2019', '16-Jan-2019', 'Lungs Scan',      'lungs Problem', 1500, 10000, 18000, 12000, 3000, 6000, 3, 5000, 33500);
insert into bill values(1006, 106, '15-Jan-2019', '17-Jan-2019', 'MIR ',            'Brain',         1000, 10000, 24000, 20000, 4000, 2500, 4, 8000, 485000);
insert into bill values(1007, 111, '18-Jan-2019', '18-Jan-2019', 'X-ray',           'Foot Injury',   600,  5000,  2500,  5000,  1000, 4000, 2, 2000, 8100);
insert into bill values(1008, 116, '19-Jan-2019', '19-Jan-2019', 'Full Body Scan',  'AIDS',          500,  12000, 1000,  0000,  1000, 7000, 1, 2000, 5500);
insert into bill values(1009, 103, '17-Jan-2019', '20-Jan-2019', 'CT Scan ',        'Cancer',        1000, 11000, 12500, 13000, 2500, 3500, 3, 7000, 29500);
insert into bill values(1010, 104, '20-Jan-2019', '22-Jan-2019', 'ECG ',            'Heart Problem', 600,  10000, 4000,  14000, 4000, 4500, 5, 8000, 20100);


select name,disease from patient where id=107;
 
select doc_name,department from doctor where id=202;

select room_no from room where p_id=108;

select status from room where room_no=404;

select patient_type from lab where lab_no=6;

select r_no ,date_of_admin,date_of_dis from inpatient where p_id=107;

select dates ,l_no from outpatient where p_id=116;

select no_of_days,discount,advance,total from bill where p_id=106;

select name ,age from patient;

select distinct(age) from patient;
 
select name,age from patient where age>35;
 
select id,name,age from patient where age=25 or age=40;

select id,name from patient where age between 35 and 40;

select id,name from patient where age not between 35 and 40;
 
select id,name from patient where age in (35 ,40);
 
select id,name from patient where address like '%Dhaka%';

select id,name ,age from patient order by age;

select id,name ,age from patient order by age desc;

select count(*) from patient where gender='Male';

select p.name as patient, d.doc_name as doctor, r.room_no as room from patient p inner join doctor d on p.id =d.p_id inner join room r on d.p_id=r.p_id;