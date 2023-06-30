-- SCHEMA: humanitarianOrg
DROP SCHEMA IF EXISTS "humanitarianOrg" ;

CREATE SCHEMA IF NOT EXISTS "humanitarianOrg"
    AUTHORIZATION postgres;
-------------------------------------------------------------------------------------------------------------------------------------------
-- create account table
CREATE TABLE IF NOT EXISTS "humanitarianOrg".account (
    accountid        numeric(8) NOT NULL,
    bankname         character varying NOT NULL,
    accountname      character varying NOT NULL,
    accountmanagerid character varying NOT NULL
);

ALTER TABLE "humanitarianOrg".account ADD CONSTRAINT account_pk PRIMARY KEY ( accountid );

-- create crisis table
CREATE TABLE IF NOT EXISTS "humanitarianOrg".crisis (
    crisisid            character varying NOT NULL,
    crisis              character varying NOT NULL,
    crisislocation      character varying NOT NULL,
    crisiscoordinatorid character varying NOT NULL
);

ALTER TABLE "humanitarianOrg".crisis ADD CONSTRAINT crisis_pk PRIMARY KEY ( crisisid );

-- create donation table
CREATE TABLE IF NOT EXISTS "humanitarianOrg".donation (
    donationid        INTEGER NOT NULL,
    donationdate      DATE NOT NULL,
    donationamount    NUMERIC NOT NULL,
    crisis_crisisid   character varying NOT NULL,
    account_accountid NUMERIC(8) NOT NULL,
    donor_donorid     character varying NOT NULL
);

ALTER TABLE "humanitarianOrg".donation ADD CONSTRAINT donation_pk PRIMARY KEY ( donationid );

-- create donor table
CREATE TABLE IF NOT EXISTS "humanitarianOrg".donor (
    donorid       character varying NOT NULL,
    donorname     character varying NOT NULL,
    donorgender   TEXT,
    donorlocation character varying,
    donorjobfield character varying
);

ALTER TABLE "humanitarianOrg".donor ADD CONSTRAINT donor_pk PRIMARY KEY ( donorid );

-- create staff table
CREATE TABLE IF NOT EXISTS "humanitarianOrg".staff (
    staffid     character varying NOT NULL,
    staffname   character varying NOT NULL,
    staffrole   character varying,
    staffsalary NUMERIC
);

ALTER TABLE "humanitarianOrg".staff ADD CONSTRAINT staff_pk PRIMARY KEY ( staffid );

-------------------------------------------------------------------------------------------------------------------------------------------
-- referential integrity statements
ALTER TABLE "humanitarianOrg".account
    ADD CONSTRAINT account_staff_fk FOREIGN KEY ( accountmanagerid )
        REFERENCES "humanitarianOrg".staff ( staffid );

ALTER TABLE "humanitarianOrg".crisis
    ADD CONSTRAINT crisis_staff_fk FOREIGN KEY ( crisiscoordinatorid )
        REFERENCES "humanitarianOrg".staff ( staffid );

ALTER TABLE "humanitarianOrg".donation
    ADD CONSTRAINT donation_account_fk FOREIGN KEY ( account_accountid )
        REFERENCES "humanitarianOrg".account ( accountid );

ALTER TABLE "humanitarianOrg".donation
    ADD CONSTRAINT donation_crisis_fk FOREIGN KEY ( crisis_crisisid )
        REFERENCES "humanitarianOrg".crisis ( crisisid );

ALTER TABLE "humanitarianOrg".donation
    ADD CONSTRAINT donation_donor_fk FOREIGN KEY ( donor_donorid )
        REFERENCES "humanitarianOrg".donor ( donorid );

-------------------------------------------------------------------------------------------------------------------------------------------
-- account INSERT statements
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (81264975, 'HSBC UK', 'Aid for All Crisis Response', 'S1');
INSERT INTO "humanitarianOrg".account ( accountid, bankname, accountname, accountmanagerid) 
  VALUES (10001001, 'Lloyds', 'Aid for All International', 'S4');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (20011002, 'Revolut', 'AFA Crisis Donations', 'S5');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (30021003, 'Barclays', 'AFAResponse', 'S4');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid)
  VALUES (40031004, 'Barclays', 'Aid for All Crisis Response', 'S5');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (50041005, 'CIBC', 'Rapid Response AFA International', 'S6');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (60051006, 'Wells Fargo', 'Aid for All', 'S2');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (70061007, 'Wells Fargo', 'AFA International ', 'S2');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (80071008, 'First bank', 'AFA International Donations', 'S3');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (90081009, 'Gtbank', 'Aid for All  humanitarian organization', 'S1');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (10091010, 'HSBC UK', 'AFA International Org.', 'S7');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (11101011, 'Bank of America', 'Aid for All Organization', 'S3');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (12111112, 'Bank of Montreal', 'AFA donations', 'S3');
INSERT INTO "humanitarianOrg".account (accountid, bankname, accountname, accountmanagerid) 
  VALUES (13121113, 'Lloyds', 'Aid for All crisis Organization', 'S4');

-------------------------------------------------------------------------------------------------------------------------------------------
-- crisis INSERT statements
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C1', 'Natural Disaster', 'Turkey', 'S8');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C2', 'Food Insecurity', 'Congo', 'S8');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C7', 'Cancer', 'USA', 'S13');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C11', 'Homelessness', 'Afghanistan', 'S16');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C15', 'War', 'Syria', 'S10');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C5', 'HIV', 'South Africa', 'S13');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C4', 'Natural Disaster', 'Haiti', 'S9');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C3', 'War', 'Ukraine', 'S8');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C99', 'Food Insecurity', 'Germany', 'S15');
INSERT INTO "humanitarianOrg".crisis (crisisid, crisis, crisislocation, crisiscoordinatorid) 
  VALUES ('C9', 'Homelessness', 'United Kingdom', 'S16');

-------------------------------------------------------------------------------------------------------------------------------------------
-- donation INSERT statements
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (1, '2022-01-20', 1000, 'A', 'C1', 81264975);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (2, '2022-01-21', 2000, 'B', 'C2', 50041005);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (3, '2022-01-22', 2599, 'C', 'C7', 20011002);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (4, '2022-01-23', 360, 'D', 'C11', 30021003);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (5, '2022-01-24', 1200, 'E', 'C1', 40031004);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (6, '2022-01-25', 50000, 'A', 'C15', 50041005);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (7, '2022-01-26', 300000, 'B', 'C5', 10091010);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (8, '2022-01-27', 15, 'H', 'C4', 70061007);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (9, '2022-01-28', 600, 'I', 'C3', 80071008);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (10, '2022-01-29', 365, 'J', 'C99', 90081009);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (11, '2022-01-30', 1006, 'K', 'C9', 10091010);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (12, '2022-01-31', 98436, 'C', 'C7', 11101011);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (13, '2022-02-01', 5231, 'M', 'C5', 12111112);
INSERT INTO "humanitarianOrg".donation (donationid, donationdate, donationamount, donorid, crisisid, accountid) 
  VALUES (14, '2022-02-02', 90, 'N', 'C15', 50041005);

-------------------------------------------------------------------------------------------------------------------------------------------
-- donor INSERT statements
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('A', 'Ingo Fernandez', 'Male', 'United Kingdom', 'Education');		
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('B','Vinita Bach','Female','India','Engineering');
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('C','Ayo James','Female','Nigeria','IT');	
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('D','Kunle John','Female','Nigeria','Healthcare');			
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('E','titi grace','Male','Zimbabwe','IT');	
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('H','michael jackson','Male','Poland','Sales');	
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('I','Fela Kuti','Male','Australia','Human Resources');	
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('J','Bob Marley','Female','New Zealand','Business');	
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('K','josiah Ayo','Female','Canada','Healthcare');
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('M','banji samuel','Male','USA','Business');	
INSERT INTO "humanitarianOrg".donor(donorid, donorname, donorgender, donorlocation, donorjobfield)
	VALUES ('N','lemy emmanuel','Female','USA','IT');
	
-------------------------------------------------------------------------------------------------------------------------------------------
-- staff INSERT statements
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S1', 'John Doe', 'Account Manager', 5000);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S41', 'Beyonce Knowles', 'Cleaner', 1000);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S10', 'Peter Joseph', 'Crisis Coordinator', 3500);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S13', 'Jonathan Vincent', 'Crisis Coordinator', 2900);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S90', 'Burna Boy', 'Volunteer', 0);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S32', 'Lionel Messi', 'Volunteer', 0);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S15', 'James St Patrick', 'Crisis Coordinator', 6800);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S16', 'Peter Obi', 'Crisis Coordinator', 700);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S33', 'Ginger Baker', 'Volunteer', 0);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S2', 'Mai Atafo', 'Account Manager', 5000);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S3', 'Barack Obama', 'Account Manager', 3400);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S4', 'Emily Rodden', 'Account Manager', 9000);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S88', 'Ayokunle McMath', 'Analyst', 1200);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S5', 'Jack Reacher', 'Account Manager', 4500);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary)
  VALUES ('S6', 'Amos Leye', 'Account Manager', 6500);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S56', 'Enoch Adeboye', 'Analyst', 9000);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S7', 'Helen Adebola', 'Account Manager', 8000);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S8', 'Adamu Garba', 'Crisis Coordinator', 750);
INSERT INTO "humanitarianOrg".staff (staffid, staffname, staffrole, staffsalary) 
  VALUES ('S9', 'Paul Blake', 'Crisis Coordinator', 4300);
