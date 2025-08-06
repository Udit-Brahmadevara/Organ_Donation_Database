# PostgreSQL Project

## Overview
This project contains PostgreSQL schema, data loading scripts, and CSV files to restore the full database.

## Files and structure
- `db/create.sql`: Creates tables and schema.
- `db/load.sql`: Loads CSV data into the tables.
- `db/data/`: Contains CSV files.

## How to restore the database

1. Create a new PostgreSQL database:

createdb -U your_username new_dbname

2. Run the schema creation script:

psql -U your_username -d new_dbname -f db/create.sql

3. Run the data load script (ensure CSV files are accessible):

psql -U your_username -d new_dbname -f db/load.sql

This will fully recreate the database schema and load all data.

