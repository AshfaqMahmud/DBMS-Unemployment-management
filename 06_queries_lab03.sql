--Demo Constrainsts--
DROP TABLE demo_constraints;
CREATE TABLE demo_constraints(
	id varchar(10) NOT NULL,
	name varchar(20) UNIQUE,
	PRIMARY KEY(id)
);

INSERT INTO demo_constraints VALUES('101325','Ashfaq');
INSERT INTO demo_constraints VALUES('101326','Prantee');
INSERT INTO demo_constraints VALUES('101325','Sazid');
INSERT INTO demo_constraints VALUES('101327','Prantee');

DROP TABLE demo_constraints;
CREATE TABLE demo_constraints(
	id varchar(10) NOT NULL,
	name varchar(20) UNIQUE,
	PRIMARY KEY(id)
);
INSERT INTO demo_constraints VALUES('101325','Ashfaq');
INSERT INTO demo_constraints VALUES('101326','Prantee');
INSERT INTO demo_constraints VALUES('101328','Sazid');
INSERT INTO demo_constraints VALUES('101327','Prantee');


DROP TABLE demo_constraints;
CREATE TABLE demo_constraints(
	id varchar(10) NOT NULL,
	name varchar(20) UNIQUE,
	PRIMARY KEY(id)
);
INSERT INTO demo_constraints VALUES('101325','Ashfaq');
INSERT INTO demo_constraints VALUES('101326','Prantee');
INSERT INTO demo_constraints VALUES('101328','Sazid');
INSERT INTO demo_constraints VALUES('101327','Amit');

DROP TABLE demo_constraints;
CREATE TABLE demo_constraints(
	id varchar(10) NOT NULL,
	name varchar(20),
    marks varchar(4) default '40',
	PRIMARY KEY(id)
);
INSERT INTO demo_constraints(id,name) VALUES('101325','Ashfaq');
INSERT INTO demo_constraints(id,name) VALUES('101326','Prantee');
INSERT INTO demo_constraints(id,name) VALUES('101328','Sazid');
INSERT INTO demo_constraints(id,name) VALUES('101327','Amit');

select * from demo_constraints;

DROP table normalbloodpressure;
CREATE table normalbloodpressure(
    id INTEGER NOT NULL,
    systol INTEGER check(systol>=120 and systol<=180),
    diastol INTEGER check(diastol>=60 and diastol<=120),
    bpm INTEGER check(bpm>=60 and bpm<=120)
);

INSERT INTO normalbloodpressure VALUES(01,120,70,70);
INSERT INTO normalbloodpressure VALUES(02,130,60,70);
INSERT INTO normalbloodpressure VALUES(03,110,70,70);
INSERT INTO normalbloodpressure VALUES(04,120,50,70);
INSERT INTO normalbloodpressure VALUES(05,120,60,20);
