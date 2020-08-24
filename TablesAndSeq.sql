
-- start of pitches Table sql

CREATE SEQUENCE pitches_id_seq START 1;

CREATE TABLE "pitches" (
    "pitches_id" int DEFAULT nextval('pitches_id_seq') PRIMARY KEY,
    "company_id" int NOT NULL,
    "initial_offer_id" int NOT NULL,
    "final_offer_id" int NULL,
    "episode_id" int NOT NULL
);

-- end of pitches Table sql

-- start of companies Table sql

CREATE SEQUENCE companies_id_seq START 1;

CREATE TYPE company_status_type AS ENUM('Active', 'Inactive', 'Aquired');
    /*
        Active: Company is stil in business even if model, employees, product has changed
        Inactive: Company has folded and is no longer in business in any form
        Aquired: Company was bought and aquired by another company and longer a stand alone product

    */

CREATE TABLE "companies" (
    "company_id" int DEFAULT nextval('companies_id_seq') PRIMARY KEY,
    "company_name" varchar NOT NULL,
    "company_status" company_status_type NULL
);

-- end of companies Table sql

-- start of employment Table sql

CREATE SEQUENCE employment_id_seq START 1;

CREATE TYPE employment_status_type AS ENUM ('Active', 'Inactive');
    /*
        Active: employee is still with the company
        Inactive: employee has left or was fired and no longer in the company
    */

CREATE TABLE "employment" (
    "employment_id" int DEFAULT nextval('employment_id_seq') PRIMARY KEY,
    "company_id" int NOT NULL,
    "entrepreneur_id" int NOT NULL,
    "employment_title" varchar NULL,
    "employment_status" employment_status_type NULL
);

-- end of employment Table sql

-- start of entrepreneur Table sql

CREATE SEQUENCE entrepreneur_id_seq START 1;

CREATE TABLE "entrepreneur" (
    "entrepreneur_id" int DEFAULT nextval('entrepreneur_id_seq') PRIMARY KEY,
    "entrepreneur_first_name" varchar NOT NULL,
    "entrepreneur_middle_name" varchar NULL,
    "entrepreneur_last_name" varchar NOT NULL
);

-- end of entrepreneur Table sql

-- start of Initial_offer Table sql

CREATE SEQUENCE initial_offer_id_seq START 1;

CREATE TABLE "initial_offers" (
    "initial_offer_id" int DEFAULT nextval('initial_offer_id_seq') PRIMARY KEY,
    "initial_equity" int NOT NULL,
    "initial_equity_value" int NOT NULL,
    "initial_royalty" int NULL,
    "initial_perpetuity" int NULL,
    "initial_conditions" varchar NULL
);

-- end of Initial_offer Table sql

-- start of Final_offer Table sql

CREATE SEQUENCE final_offer_id_seq START 1;

CREATE TABLE "final_offers" (
    "final_offer_id" int PRIMARY KEY,
    "final_equity" int NOT NULL,
    "final_equity_value" int NOT NULL,
    "final_royalty" int NULL,
    "final_perpetuity" int NULL,
    "final_conditions" varchar NULL
);

-- end of Final_offer Table sql

-- start of Inverstors 

CREATE SEQUENCE investor_id_seq START 1;

CREATE TYPE investor_type_type AS ENUM ('Guest', 'Main');
    /*
        Guest: Only appeared in a few episodes
        Main: Was a main guest appearing in a majority of episodes in at least one Season
    */
CREATE TYPE investor_status_type AS ENUM ('Active', 'Inactive');
    /*
        Active: Investor is still active in the show
        Inactive: Investor has left the show
    */

CREATE TABLE "investors" (
    "investor_id" int DEFAULT nextval('investor_id_seq') PRIMARY KEY,
    "investor_type" investor_type_type NOT NULL,
    "investor_status" investor_status_type NOT NULL,
    "investor_first_name" varchar NOT NULL,
    "investor_middle_name" varchar NULL,
    "investor_last_name" varchar NOT NULL
);

-- end of Investors 

-- start of episodes 

CREATE SEQUENCE episode_id_seq START 1;

CREATE TABLE "episodes" (
    "episode_id" int DEFAULT nextval('episode_id_seq') PRIMARY KEY,
    "season_number" int NOT NULL,
    "episode_number" int NOT NULL
);
-- end of episodes

-- start of cast 

CREATE SEQUENCE cast_id_seq START 1;

CREATE TABLE "cast" (
    "cast_id" int DEFAULT nextval('cast_id_seq') PRIMARY KEY,
    "episode_id" int NOT NULL,
    "investor_id" int NOT NULL
);

-- end of cast

-- START OF FOREIGN KEYS

ALTER TABLE "pitches" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");
ALTER TABLE "pitches" ADD FOREIGN KEY ("initial_offer_id") REFERENCES "initial_offers" ("initial_offer_id");
ALTER TABLE "pitches" ADD FOREIGN KEY ("final_offer_id") REFERENCES "final_offers" ("final_offer_id");
ALTER TABLE "pitches" ADD FOREIGN KEY ("episode_id") REFERENCES "episodes" ("episode_id");


