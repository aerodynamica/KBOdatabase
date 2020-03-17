LOAD DATA INFILE "D:/Data/KboOpenData_0072_2020_02_Full/meta.csv"
INTO TABLE kbo.meta
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/code.csv'
INTO TABLE kbo.code
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/address.csv'
INTO TABLE kbo.address 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(EntityNumber, TypeOfAddress, CountryNL, CountryFR, Zipcode, MunicipalityNL, MunicipalityFR, StreetNL,StreetFR,HouseNumber,Box,ExtraAddressInfo, @DateStrikingOff)
SET DateStrikingOff = str_to_date(@DateStrikingOff, '%d-%m-%Y');

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/activity.csv' IGNORE
INTO TABLE kbo.activity 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/contact.csv' IGNORE
INTO TABLE kbo.contact 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/denomination.csv' IGNORE
INTO TABLE kbo.denomination 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/enterprise.csv'
INTO TABLE kbo.enterprise 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(EnterpriseNumber, EnterpriseStatus, JuridicalSituation,TypeOfEnterprise, JuridicalForm, @StartDate)
SET StartDate = STR_TO_DATE(@StartDate, '%d-%m-%Y');

LOAD DATA INFILE 'D:/Data/KboOpenData_0072_2020_02_Full/establishment.csv'
INTO TABLE kbo.establishment 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(EstablishmentNumber, @StartDate, EnterpriseNumber)
SET StartDate = STR_TO_DATE(@StartDate, '%d-%m-%Y');