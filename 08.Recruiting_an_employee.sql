SET SERVEROUTPUT ON;
DECLARE
    cursor cur is select company.name as company, work.name as post, companywork.status as vacancy from company
    join companywork on company.ID=companywork.ID_company
    join work on work.id=companyWork.ID_work;
    temp cur%ROWTYPE;
BEGIN
open cur;
    loop
    fetch cur into temp;
    exit when cur%notfound;
    DBMS_OUTPUT.PUT_LINE('output '||temp.company||' '||temp.post||' '||temp.vacancy);
    END loop;
    close cur;
    
END;
/ 


create or replace procedure match_job(person_ID peopleInfo.ID%type)
 as
    temp1 peopleWorkExpertise.ID_work%type;
    person_name peopleInfo.name%type;
    tcompany company.name%type;
    tpost work.name%type;
    tstat companyWork.status%type;
BEGIN
select peopleInfo.name into person_name from peopleInfo where peopleInfo.ID=person_ID; --get person name
select peopleWorkExpertise.ID_work into temp1 from peopleWorkExpertise where peopleWorkExpertise.ID_peopleInfo=person_ID;
select distinct peopleInfo.name, work.name into person_name, tpost from peopleInfo
    join peopleWorkExpertise on peopleInfo.ID=person_ID and peopleWorkExpertise.ID_work=temp1
    join work on work.id=temp1;
    DBMS_OUTPUT.PUT_LINE ('Person : ' || person_name || ', expert in ' || tpost || ' available companies and vacancies are- ');
    select company.name, companyWork.status into tcompany,tstat from work
    inner join company on work.id=temp1
    inner join companywork on companyWork.ID_work=temp1 and companywork.ID_company=company.ID
    group by work.name, company.name,companywork.status;
    DBMS_OUTPUT.PUT_LINE('Vacancy '||tstat||' Company '||tcompany);
END match_job;
/
show errors;
SET SERVEROUTPUT ON;
BEGIN
    match_job(1);
END;
/

create or replace procedure add_emp(person_ID peopleInfo.ID%type,work_ID companyWork.ID_work%type,company_ID company.ID%type)
as
BEGIN
INSERT INTO employeeManagement VALUES(person_id,company_ID,work_ID,sysdate);
    update peopleInfo set status='Employed' where ID=person_ID;
    update companyWork set status=status-1 where ID_work=work_ID;
    DBMS_OUTPUT.PUT_LINE('Value Inserted');
END add_emp;
/
show errors;
SET SERVEROUTPUT ON;
BEGIN
    add_emp(1,212,107);
END;
/

