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
