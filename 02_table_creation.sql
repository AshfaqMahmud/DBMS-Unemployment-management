create table  peopleInfo(
    ID INTEGER NOT NULL PRIMARY key,
    NID VARCHAR(10) UNIQUE,
    Name varchar(30),
    DOB varchar(10),
    gender varchar(6) check (gender in('male', 'female', 'other')),
    country varchar(40),
    city varchar(40),
    road varchar(10),
	status varchar(10)
);


create table  peopleInfoPhoneNumber(
    ID int,
    phoneNumber varchar(15),
    constraint fk_peopleInfo foreign key(ID) references peopleInfo(ID),
    primary key(ID, phoneNumber)
);


create table company(
    ID int NOT NULL  PRIMARY key,
    Name varchar(30)
);

CREATE TABLE companyLoc(
    ID int NOT NULL  PRIMARY key,
    country varchar(40),
    city varchar(30),
    road varchar(10),
    constraint fk_company4 foreign key(ID) references company(ID)
);

create table companyPhoneNumber(
    ID int,
    phoneNumber varchar(15),
    constraint fk_company foreign key(ID) references company(ID),
    primary key(ID, phoneNumber)
);


create table companyMail(
    ID_company int,
    mail varchar(40) unique,
    constraint fk_company0 foreign key(ID_company) references company(ID),
    primary key(ID_company, mail)
);


create table work(
	ID int NOT NULL primary key,
    Name varchar(30)
);


create table companyWork(
    ID_work int,
    ID_company int,
    constraint fk_company1 foreign key(ID_company) references company(ID),
    constraint fk_work1 foreign key(ID_work) references work(ID),
    primary key(ID_work, ID_company)
);


create table peopleWorkExpertise(
    ID_work int,
    ID_peopleInfo int,
    constraint fk_work2 foreign key(ID_work) references work(ID),
    constraint fk_peopleInfo2 foreign key(ID_peopleInfo) references peopleinfo(ID),
    primary key(ID_work, ID_peopleInfo)
);




create table employeeManagement(
    ID_peopleInfo int,
    ID_company int,
    ID_work int,
    startDateTime date,
    endDatetime date,
    constraint fk_peopleInfo3 foreign key(ID_peopleInfo) references peopleInfo(ID),
    constraint fk_company3 foreign key(ID_company) references company(ID),
    constraint fk_work3 foreign key(ID_work) references work(ID)
);
