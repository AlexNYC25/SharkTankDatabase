-- Note This was generated from a db diagram creatot

CREATE TABLE "Pitches" (
  "pitches_id" int PRIMARY KEY,
  "company_id" int,
  "initial_offer_id" int,
  "final_offer_id" int,
  "episode_id" int
);

CREATE TABLE "Companies" (
  "company_id" int PRIMARY KEY,
  "company_name" varchar,
  "company_status" varchar
);

CREATE TABLE "Employment" (
  "employment_id" int PRIMARY KEY,
  "company_id" int,
  "entrepreneur_id" int,
  "employment_status" varchar
);

CREATE TABLE "Entrepreneur" (
  "entrepreneur_id" int PRIMARY KEY,
  "entrepreneur_first_name" varchar,
  "entrepreneur_middle_name" varchar,
  "entrepreneur_last_name" varchar
);

CREATE TABLE "Initial_Offers" (
  "initial_offer_id" int PRIMARY KEY,
  "initial_equity" int,
  "initial_equity_value" int,
  "initial_conditions" varchar
);

CREATE TABLE "Final_Offer" (
  "final_offer_id" int PRIMARY KEY,
  "final_equity" int,
  "final_equity_value" int,
  "final_conditions" varchar
);

CREATE TABLE "Investors" (
  "investor_id" int PRIMARY KEY,
  "investor_type" varchar,
  "investor_First_Name" varchar,
  "investor_Middle_Name" varchar,
  "investor_Last_Name" varachar
);

CREATE TABLE "Investments" (
  "investment_id" int PRIMARY KEY,
  "investor_id" int,
  "final_offer_id" int
);

CREATE TABLE "Episodes" (
  "episode_id" int PRIMARY KEY,
  "season_number" int,
  "episode_number" int
);

CREATE TABLE "Cast" (
  "cast_id" int PRIMARY KEY,
  "episode_id" int,
  "investor_id" int
);

ALTER TABLE "Pitches" ADD FOREIGN KEY ("company_id") REFERENCES "Companies" ("company_id");

ALTER TABLE "Initial_Offers" ADD FOREIGN KEY ("initial_offer_id") REFERENCES "Pitches" ("initial_offer_id");

ALTER TABLE "Final_Offer" ADD FOREIGN KEY ("final_offer_id") REFERENCES "Pitches" ("final_offer_id");

ALTER TABLE "Employment" ADD FOREIGN KEY ("company_id") REFERENCES "Companies" ("company_id");

ALTER TABLE "Employment" ADD FOREIGN KEY ("entrepreneur_id") REFERENCES "Entrepreneur" ("entrepreneur_id");

ALTER TABLE "Investments" ADD FOREIGN KEY ("final_offer_id") REFERENCES "Final_Offer" ("final_offer_id");

ALTER TABLE "Investors" ADD FOREIGN KEY ("investor_id") REFERENCES "Investments" ("investor_id");

ALTER TABLE "Episodes" ADD FOREIGN KEY ("episode_id") REFERENCES "Pitches" ("episode_id");

ALTER TABLE "Cast" ADD FOREIGN KEY ("episode_id") REFERENCES "Episodes" ("episode_id");

ALTER TABLE "Investors" ADD FOREIGN KEY ("investor_id") REFERENCES "Cast" ("investor_id");
