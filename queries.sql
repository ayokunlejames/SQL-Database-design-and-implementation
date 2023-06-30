-- Query 1: This query selects total donation amount of each donor in descending order.
select 
  "humanitarianOrg".donation.donorid,
  "humanitarianOrg".donor.donorname,
  SUM("humanitarianOrg".donation.donationamount)
from "humanitarianOrg".donation
left join "humanitarianOrg".donor
on "humanitarianOrg".donor.donorid = "humanitarianOrg".donation.donorid
group by 1,2
order by 3 desc
;

--Query 2: This query selects total donation amount received by each crisis.
select 
  "humanitarianOrg".crisis.crisisid,
  "humanitarianOrg".crisis.crisis,
  SUM("humanitarianOrg".donation.donationamount)
from "humanitarianOrg".crisis
left join "humanitarianOrg".donation
on "humanitarianOrg".crisis.crisisid = "humanitarianOrg".donation.crisisid
group by 1,2
order by 3 desc 
;


-- Query 3: The query below selects each bank account and number of donations received.
select 
  "humanitarianOrg".account.accountid,
  "humanitarianOrg".account.bankname,
  COUNT("humanitarianOrg".donation.donationamount)
from "humanitarianOrg".account
left join "humanitarianOrg".donation
  on "humanitarianOrg".account.accountid = "humanitarianOrg".donation.accountid
group by 1,2
order by 3 desc 
;


-- Query 4: The query below selects total salary grouped by staff role.
select
  "humanitarianOrg".staff.staffrole,
  SUM("humanitarianOrg".staff.staffsalary)
from "humanitarianOrg".staff
group by 1
order by 2 desc;


-- Query 5: The query below shows total donations received.
select
  SUM(donationamount)
from "humanitarianOrg".donation
;
