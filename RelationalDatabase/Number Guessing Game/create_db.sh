#!/bin/bash 
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
C="psql --username=freecodecamp --dbname=num_guess -t --no-align -c"

echo $PSQL
DROP_RESET="$($PSQL "DROP DATABASE num_guess;")"
CREATE_DB="$($PSQL "CREATE DATABASE num_guess;")"

CREATE_USERS="$($C "create table users(user_id SERIAL NOT NULL PRIMARY KEY, username VARCHAR(22) NOT NULL UNIQUE);")"

CREATE_GAMES="($($C "create table games(game_id SERIAL NOT NULL PRIMARY KEY, user_id INT NOT NULL, guess INT DEFAULT 0, number INT NOT NULL);")"
ADD_UNQ="$($C " alter table games add constraint game_user_id_unq unique(user_id, game_id);")"
ADD_FK="$($C "alter table games add foreign key(user_id) references users(user_id);")"
# RM_UNQ="$($C "alter table games drop constraint user_id_unq unique(user_id)";)"