#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument." 
else
  ELEMENT_ID=$1
  if [[ $ELEMENT_ID =~ ^[0-9]+$ ]]; then
    RES_ELEMENTS="$($PSQL "SELECT * FROM elements WHERE atomic_number=$ELEMENT_ID;" 2>/dev/null)"
  else
    RES_SYMBOL="$($PSQL "SELECT * FROM elements WHERE symbol='$ELEMENT_ID' OR name='$ELEMENT_ID';" 2>/dev/null)"
  fi

  if [[ -n $RES_ELEMENTS ]]; then
    IFS="|" read ATOMIC_NUMBER SYMBOL NAME  <<< "$RES_ELEMENTS"
    RES_PROP="$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
    IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING BOILING TYPE_ID <<< "$RES_PROP"
    RES_TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID;")"
    IFS="|" read TYPE <<< "$RES_TYPE" 
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."


  elif [[ -n $RES_SYMBOL ]]; then
    IFS="|" read ATOMIC_NUMBER SYMBOL NAME <<< "$RES_SYMBOL" 
    RES_PROP="$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
    IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING BOILING TYPE_ID <<< "$RES_PROP"
    RES_TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID;")"
    IFS="|" read TYPE <<< "$RES_TYPE" 
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

  elif [[ -n $RES_NAME ]]; then
    IFS="|" read ATOMIC_NUMBER SYMBOL NAME <<< "$RES_NAME" 
    RES_PROP="$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")"
    IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING BOILING TYPE_ID <<< "$RES_PROP"
    RES_TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID;")"
    IFS="|" read TYPE <<< "$RES_TYPE" 
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

  else 
    echo "I could not find that element in the database."
  fi 
fi