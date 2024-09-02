#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c" # test db 

# You should rename the atomic_mass column to atomic_mass
# You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
RENAME=$($PSQL "alter table properties rename melting_point to melting_point_celsius; alter table properties rename boiling_point to boiling_point_celsius; alter table properties rename weight to atomic_mass ")

NOTNULL () {
  if [[ $# -ne 2 ]]; then
    echo "Error: This function requires exactly 2 arguments (table name and column name)."
    return 1
  fi
  TABLE_NAME=$1
  COL_NAME=$2
  NOTNULL_CONSTRAINT="$($PSQL "alter table $TABLE_NAME ALTER COLUMN $COL_NAME SET NOT NULL;")"
  if [[ $NOTNULL_CONSTRAINT = 'ALTER TABLE' ]]; then 
    echo "Added not null to $COL_NAME"
  else 
    echo "Failed to add not null to $COL_NAME"
  fi 
}

CREATE_TABLE () {
  if [[ $# -ne 1 ]]; then
    echo "Error: This function requires exactly 1 arguments (table name)."
    return 1
  fi
  TABLE_NAME=$1
  CREATE_TABLE=$($PSQL "create table $TABLE_NAME();")
  if [[ $CREATE_TABLE = 'CREATE TABLE' ]]; then 
    echo "Created table $TABLE_NAME"
  else 
    echo "Failed to create table $TABLE_NAME"
  fi
}

ADD_COLUMN () {
  if [[ $# -ne 3 ]]; then 
    echo "Error: This function requires exactly 2 arguments (table name, column name and data type)."
    return 1
  fi
  TABLE_NAME=$1
  COL_NAME=$2
  DATA_TYPE=$3
  ADD_COL_NO_CONSTRAINT="$($PSQL "alter table $TABLE_NAME add column $COL_NAME $DATA_TYPE;")"
  if [[ $ADD_COL_NO_CONSTRAINT = 'ALTER TABLE' ]]; then 
    echo "Added $COL_NAME to table $TABLE_NAME"
  else 
    echo "Failed to added $COL_NAME to table $TABLE_NAME"
  fi
}

ADD_UNQ () {
  if [[ $# -ne 3 ]]; then 
    echo "Error: This function requires at least 3 arguments (table name, column name and unique constraint name)."
    return 1
  fi
  TABLE_NAME=$1
  COL_NAME=$2
  UNQ_CONSTRAINT=$3
  ADD_UNQ="$($PSQL "ALTER TABLE $TABLE_NAME ADD CONSTRAINT $UNQ_CONSTRAINT UNIQUE ($COL_NAME);")"
  if [[ $ADD_UNQ = 'ALTER TABLE' ]]; then 
    echo "Added unique constraint to $COL_NAME in table $TABLE_NAME"
  else 
    echo "Failed to added unique constraint to $COL_NAME in table $TABLE_NAME"
  fi
}

ADD_PK() {
  if [[ $# -ne 2 ]]; then 
    echo "Error: This function requires exactly 2 arguments (table name, column name to be made to primary key)."
    return 1
  fi
  TABLE_NAME=$1
  COL_NAME=$2
  ADD_PK="$($PSQL "ALTER TABLE $TABLE_NAME ADD PRIMARY KEY ($COL_NAME);")"
  if [[ $ADD_PK = 'ALTER TABLE' ]]; then 
    echo "Added primary key $COL_NAME in table $TABLE_NAME"
  else 
    echo "Failed to added primary key $COL_NAME in table $TABLE_NAME"
  fi
}

ADD_FK() {
  if [[ $# -ne 4 ]]; then 
    echo "Error: This function requires exactly 4 arguments (table to change, column to be made to foreign key, table to reference to, column to reference to)."
    return 1
  fi
  TABLE_ALTER_NAME=$1
  COL_ALTER_NAME=$2
  TABLE_REF_NAME=$3
  COL_REF_NAME=$4  
  ADD_FK="$($PSQL "ALTER TABLE $TABLE_ALTER_NAME ADD FOREIGN KEY ($COL_ALTER_NAME) REFERENCES $TABLE_REF_NAME($COL_REF_NAME);")"
  if [[ $ADD_FK = 'ALTER TABLE' ]]; then 
    echo "Added foreign key $COL_NAME in table $TABLE_NAME ref $TABLE_REF_NAME($COL_REF_NAME)"
  else 
    echo "Failed to foreign key $COL_NAME in table $TABLE_NAME ref $TABLE_REF_NAME($COL_REF_NAME)"
  fi
}

# You should delete the non existent element, whose atomic_number is 1000, from the two tables
DELET_1000="$($PSQL "DELETE FROM elements WHERE atomic_number=1000; DELETE FROM properties WHERE atomic_number=1000; ")"
# You should add the element with atomic number 9 to database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
# You should add the element with atomic number 10 to database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal
ADD_ELEMENTS="$($PSQL "insert into elements(atomic_number,symbol,name) values(9, 'F', 'Fluorine'),(10, 'Ne', 'Neon');")"
ADD_PROPERTIES="$($PSQL "insert into properties(atomic_number,type,atomic_mass,melting_point_celsius,boiling_point_celsius) values(9,'nonmetal', 18.998, -220, -188.1),(10, 'nonmetal', 20.18, -248.6, -246.1);")"
# melting_point_celsius and boiling_point_celsius columns should not accept null values
NOTNULL "properties" "melting_point_celsius"
NOTNULL "properties" "boiling_point_celsius"

# You should add the UNIQUE constraint to the symbol and name columns from the elements table
ADD_UNQ "elements" "name" "unq_name"
ADD_UNQ "elements" "symbol" "unq_symbol"

# symbol and name columns should have the NOT NULL constraint
NOTNULL "elements" "name"
NOTNULL "elements" "symbol"

# You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
ADD_FK "properties" "atomic_number" "elements" "atomic_number"

# You should create a types table that will store the three types of elements
CREAT_TABLE=$($PSQL "create table types();")

# types table should have a type_id column that is an integer and the primary key
ADD_COLUMN "types" "type_id" "INT"
ADD_PK "types" "type_id"

# types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
ADD_COLUMN "types" "type" "VARCHAR(32)"
NOTNULL "types" "type"

# ADD_FK "properties" "type" "types" "type" # dont need because going to be dropped


# You should add three rows to types table whose values are the three different types from the properties table
INSERT_TYPE=$($PSQL "
WITH distinct_types AS (
  SELECT DISTINCT type
  FROM properties
),
t AS (
  SELECT type, 
         ROW_NUMBER() OVER (ORDER BY type) AS type_id
  FROM distinct_types
)
INSERT INTO types(type_id, type)
SELECT type_id, type
FROM t;")

# properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
ADD_COLUMN "properties" "type_id" "INT"
ADD_FK "properties" "type_id" "types" "type_id"
# Each row in properties table should have a type_id value that links to the correct type from the types table
UPDATE_T_ID_PROPERTIES="$($PSQL "UPDATE properties
SET type_id = t.type_id
FROM types t
WHERE properties.type = t.type;")"

NOTNULL "properties" "type_id"


# You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
UPDATE_SYMBOL_ELEMENT="$($PSQL "UPDATE elements
SET symbol = CONCAT(UPPER(LEFT(symbol, 1)), RIGHT(symbol, LENGTH(symbol) - 1));")"
# You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
UPDATE_MASS_PROPERTIES="$($PSQL "alter table properties
alter column atomic_mass type real;")"

# Your properties table should not have a type column
DEL_TYPE_PROPERTIES="$($PSQL "ALTER TABLE properties DROP COLUMN type;")"


RES_ELEMENTS="$($PSQL "SELECT * FROM elements;")"
echo "$RES_ELEMENTS" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME; do 
  echo "$ATOMIC_NUMBER $SYMBOL $NAME" >> result.txt 
done 

RES_PROP="$($PSQL "SELECT * FROM properties;")"
echo "$RES_PROP" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING BOILING TYPE_ID; do 
  echo "$ATOMIC_NUMBER $ATOMIC_MASS $MELTING $BOILING $TYPE_ID" | tee -a result.txt 
done

RES_TYPE="$($PSQL "SELECT * FROM types;")"
echo "$RES_TYPE" | while IFS="|" read TYPE_ID TYPE; do 
  echo "$TYPE_ID $TYPE" | tee -a result.txt 
done 
