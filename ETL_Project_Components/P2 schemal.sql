-- start script
-- clean slate protocol initiated
DROP TABLE IF EXISTS y2021_sales CASCADE;
DROP TABLE IF EXISTS y2021_models;
DROP TABLE IF EXISTS y2021_makes;
drop TABLE if exists model_attributes_perf cascade;
drop TABLE if exists brand_perf cascade;
drop TABLE if exists model_perf cascade;

-- Create Manufacturer table
CREATE TABLE y2021_makes (
    mfg varchar(15) PRIMARY KEY
);
-- Create Models table
CREATE TABLE y2021_models (
    model varchar(25),
    mfg varchar(15),
	PRIMARY KEY (model),
	FOREIGN KEY (mfg) REFERENCES y2021_makes(mfg)
);
-- Create Sales table
CREATE TABLE y2021_sales (
    mfg varchar(15),
    model varchar(25),
	curr_month varchar(12),
	month_prior_year varchar(12),
	month_change varchar(12),
	ytd_total varchar(12),
	ytd_prior_year varchar(12),
	ytd_change varchar(12),
	PRIMARY KEY (mfg, model),
	FOREIGN KEY (mfg) REFERENCES y2021_makes(mfg),
    FOREIGN KEY (model) REFERENCES y2021_models(model)
);
-- Create brand table
CREATE TABLE brand_perf (
Brand VARCHAR NOT NULL, 
PRIMARY KEY (Brand)
);
-- Create brand model table
CREATE TABLE model_perf (
BRAND VARCHAR NOT NULL,
Model VARCHAR NOT NULL,
FOREIGN KEY (Brand) REFERENCES brand_perf (Brand),
PRIMARY KEY (Model)
);
-- Create model performance table
CREATE TABLE model_attributes_perf (
Model VARCHAR NOT NULL,
AccelSec VARCHAR NOT NULL,
TopSpeed_KmH VARCHAR NOT NULL,
Range_Km VARCHAR NOT NULL,
Efficiency_WhKm VARCHAR NOT NULL,
FastCharge_KmH VARCHAR NOT NULL,
BodyStyle VARCHAR NOT NULL,
Seats VARCHAR NOT NULL,
FOREIGN KEY (Model) REFERENCES model_perf (Model),
PRIMARY KEY (Model)
);