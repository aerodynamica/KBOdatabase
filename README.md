# KBOdatabase
This project contains scripts to to load the open data of the KBO in a MySQL database.

## Open data
You can get access to the open data of the Crossroads Bank of Enterprises by going to [this page](https://economie.fgov.be/en/themes/enterprises/crossroads-bank-enterprises/services-everyone/cbe-open-data).

## Files
| Files | Description|
|-|-|
|**createSchema.sql**|Script to create a MySQL database schema|
|**loadCSV.sql**|Script to load the CSV files in the tables|


## Troubleshooting for MySQL

### In the my.ini file
Under [mysqld]:
Change `secure-file-priv` value to the folder where the csv files are stored.
Set `innodb_lock_wait_timeout` to a higher value, like `150`.


### In the MySQL Workbench Preferences
Set DBMS connection read timeout interval (in seconds) to a higher value, like 6000.

---
Kruispuntbank van Ondernemingen (KBO)
Banque-Carrefour des Entreprises (BCE)
Zentrale Datenbank der Unternehmen (ZDU)
Crossroads Bank for Enterprises (CBE) 
