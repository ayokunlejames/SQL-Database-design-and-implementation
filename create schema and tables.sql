-- SCHEMA: humanitarianOrg

-- DROP SCHEMA IF EXISTS "humanitarianOrg" ;

CREATE SCHEMA IF NOT EXISTS "humanitarianOrg"
    AUTHORIZATION postgres;

CREATE TABLE IF NOT EXISTS "humanitarianOrg".account (
    accountid        numeric(8) NOT NULL,
    bankname         character varying NOT NULL,
    accountname      character varying NOT NULL,
    accountmanagerid character varying NOT NULL
);

ALTER TABLE "humanitarianOrg".account ADD CONSTRAINT account_pk PRIMARY KEY ( accountid );

CREATE TABLE IF NOT EXISTS "humanitarianOrg".crisis (
    crisisid            character varying NOT NULL,
    crisis              character varying NOT NULL,
    crisislocation      character varying NOT NULL,
    crisiscoordinatorid character varying NOT NULL
);

ALTER TABLE "humanitarianOrg".crisis ADD CONSTRAINT crisis_pk PRIMARY KEY ( crisisid );

CREATE TABLE IF NOT EXISTS "humanitarianOrg".donation (
    donationid        INTEGER NOT NULL,
    donationdate      DATE NOT NULL,
    donationamount    NUMERIC NOT NULL,
    crisis_crisisid   character varying NOT NULL,
    account_accountid NUMERIC(8) NOT NULL,
    donor_donorid     character varying NOT NULL
);

ALTER TABLE "humanitarianOrg".donation ADD CONSTRAINT donation_pk PRIMARY KEY ( donationid );

CREATE TABLE IF NOT EXISTS "humanitarianOrg".donor (
    donorid       character varying NOT NULL,
    donorname     character varying NOT NULL,
    donorgender   TEXT,
    donorlocation character varying,
    donorjobfield character varying
);

ALTER TABLE "humanitarianOrg".donor ADD CONSTRAINT donor_pk PRIMARY KEY ( donorid );

CREATE TABLE IF NOT EXISTS "humanitarianOrg".staff (
    staffid     character varying NOT NULL,
    staffname   character varying NOT NULL,
    staffrole   character varying,
    staffsalary NUMERIC
);

ALTER TABLE "humanitarianOrg".staff ADD CONSTRAINT staff_pk PRIMARY KEY ( staffid );

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

