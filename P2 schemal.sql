-- start script
-- clean slate protocol initiated
DROP TABLE IF EXISTS y2021_sales_by_model CASCADE;
DROP TABLE IF EXISTS y2021_models;
DROP TABLE IF EXISTS y2021_makes;

-- Create Manufacturer table
CREATE TABLE y2021_makes (
    mfg varchar(15) PRIMARY KEY
);
-- Load Manufacturers table
--COPY y2021_makes (make) FROM 'C:\Users\Salty\DSBC-Project-2-ETL\data\makes.csv'  CSV HEADER;
--
-- Create Models table
CREATE TABLE y2021_models (
    model varchar(25),
    mfg varchar(15),
	PRIMARY KEY (model),
	FOREIGN KEY (mfg) REFERENCES y2021_makes(mfg)
);
-- Load Models table
--COPY y2021_models (mfg, model) FROM 'C:\Users\Salty\DSBC-Project-2-ETL\data\models.csv' CSV HEADER;
--
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
--COPY y2021_sales (mfg, model, curr_month, month_prior_year, month_change, ytd_total, ytd_prior_year, ytd_change) FROM 'C:\Users\Salty\DSBC-Project-2-ETL\data\sales.csv' CSV HEADER;
