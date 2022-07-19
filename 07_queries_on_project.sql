--Aggregate function--

--Grouping company's mail as their id--
select mail,ID_company from companyMail group by ID_company,mail;
select mail,ID_company from companyMail group by ID_company,mail having ID_company=100;

--Grouping company's mail,company name as their id--
select company.name,companyMail.mail from company,companyMail where company.ID=companyMail.ID_company group by company.name,companyMail.mail;
--Grouping company's location,company name as their id--
select company.name,companyLoc.country,companyLoc.city from company,companyLoc where company.ID=companyLoc.ID group by company.name,companyLoc.country,companyLoc.city order by company.name;
--Ordering by company's name--
select company.name,companyMail.mail from company,companyMail where company.ID=companyMail.ID_company group by company.name,companyMail.mail order by company.name;
--Grouping company's location,company name and contact as their id--
select company.name,companyLoc.country,companyLoc.city,companyPhoneNumber.phoneNumber from company
    inner join companyLoc on companyLoc.ID=company.ID
    inner join companyPhoneNumber on companyLoc.ID=companyPhoneNumber.ID
    order by company.name;
--Grouping company's location,company name and contact mail as their id--
select company.name,companyLoc.country,companyLoc.city,companyPhoneNumber.phoneNumber,companyMail.mail from company
    inner join companyLoc on companyLoc.ID=company.ID
    inner join companyPhoneNumber on companyLoc.ID=companyPhoneNumber.ID
    inner join companyMail on companyLoc.ID=companyMail.ID_company
    group by company.name,companyLoc.country,companyLoc.city,companyPhoneNumber.phoneNumber,companyMail.mail
    order by company.name;

--cross join--
select company.name, companyMail.mail from company cross join companyMail;
--self join--
select company.name, c.ID from company cross join company c;

--peopleworkexpertise--
select peopleInfo.ID,peopleInfo.Name, peopleWorkExpertise.ID_work from peopleInfo,peopleWorkExpertise where peopleInfo.ID=peopleWorkExpertise.ID_peopleInfo;
--showing people order and group by work--
select peopleWorkExpertise.ID_work,peopleInfo.ID,peopleInfo.Name from peopleInfo,peopleWorkExpertise where peopleInfo.ID=peopleWorkExpertise.ID_peopleInfo group by peopleWorkExpertise.ID_work,peopleInfo.ID,peopleInfo.name order by peopleWorkExpertise.ID_work;
--showing people of a specific work expertise by joining 3 tables--
select work.ID,work.name,peopleworkexpertise.ID_peopleInfo,peopleInfo.name from work 
    inner join peopleWorkExpertise on work.ID=peopleWorkExpertise.ID_work
    inner join peopleInfo on peopleWorkExpertise.ID_peopleInfo=peopleInfo.ID order by work.ID;
--showing people info with number of a specific work expertise by joining 4 tables--
select work.ID,work.name,peopleworkexpertise.ID_peopleInfo,peopleInfo.name,peopleInfoPhoneNumber.phonenumber from work 
    inner join peopleWorkExpertise on work.ID=peopleWorkExpertise.ID_work
    inner join peopleInfo on peopleWorkExpertise.ID_peopleInfo=peopleInfo.ID
    inner join peopleInfoPhoneNumber on peopleWorkExpertise.ID_peopleInfo=peopleInfoPhoneNumber.ID order by work.ID;
