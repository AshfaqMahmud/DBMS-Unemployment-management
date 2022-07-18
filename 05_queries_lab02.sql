--ALTER,INSERT,UPDATE,DELETE COMMAND--
drop table test;
CREATE table test(
    ID INTEGER NOT NULL primary key,
    name VARCHAR(20)
);

ALTER table test add (
    age VARCHAR(3),
    department VARCHAR(5)
);

ALTER table test modify(
    name VARCHAR(25),
    age INTEGER
);

ALTER table test drop column age;
ALTER table test rename column department to dept;

Describe test;

INSERT into test(ID,name,dept) VALUES (01,'Ayantika','CSE');
INSERT into test(ID,name,dept) VALUES (02,'Nusrat','CSE');
INSERT into test(ID,name,dept) VALUES (03,'Prantee','MSE');
INSERT into test(ID,name,dept) VALUES (04,'Sohan','ESE');
INSERT into test(ID,name,dept) VALUES (05,'Puja','ESE');
INSERT into test(ID,name,dept) VALUES (06,'Rafin','MSE');

select * from test;

update test set dept='EEE' where name='Nusrat';
update test set dept='EEE' where ID=3;
delete from test where name='Puja';
select * from test;