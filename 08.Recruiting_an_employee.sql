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
   
create [or replace] procedure match_job(person_ID peopleInfo.name%type)
 is
    temp1 peopleWorkExpertise.ID_work%type;
    person_name peopleInfo.name%type;
    person_id peopleWorkExpertise.ID_peopleInfo%type;
    tcompany company.name%type;
    tpost work.name%type;
    tstat companyWork.status%type;
    type row_type is table of  
BEGIN
select peopleInfo.name into person_name from peopleInfo where peopleInfo.ID=person_ID; --get person name
select peopleWorkExpertise.ID_work into temp1 from peopleWorkExpertise where peopleWorkExpertise.ID_peopleInfo=person_ID;
select distinct peopleInfo.name, work.name into person_name, tpost from peopleInfo
    join peopleWorkExpertise on peopleInfo.ID=person_ID and peopleWorkExpertise.ID_work=temp1
    join work on work.id=temp1;
    DBMS_OUTPUT.PUT_LINE ('Person : ' || person_name || 'expert in ' || tpost || 'available companies and vacancies are-');
    DBMS_OUTPUT.PUT_LINE( select work.name as post, company.name as company, companywork.status as vacancy from work
    inner join company on work.id=temp1
    inner join companywork on companyWork.ID_work=temp1 and companywork.ID_company=company.ID
    group by work.name, company.name,companywork.status;)
END match_job;
/
show errors;

BEGIN
    match_job(1);
END;
/
   
