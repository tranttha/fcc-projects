#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# create db 
# CON=$($PSQL "\c wordlcup")"
# if [[ $CON='SSL connection%' ]]  
# then 
  # CREATE_DB=$($PSQL "CREATE DATABASE worldcup;")
  # CREATE_TEAM_TB =$($PSQL "CREATE table teams(team_id SERIAL NOT NULL, name VARCHAR(32) NOT NULL);")
  # PK_TEAM_TB =$($PSQL "ALTER TABLE teams ADD PRIMARY KEY(team_id);")
  # ADD_UNQ_NAME=$($PSQL "ALTER TABLE teams ADD CONSTRAINT unique_name UNIQUE(name);")
  
  # CREATE_GAME_TB =$($PSQL "CREATE table games(game_id SERIAL NOT NULL, year INT NOT NULL, round VARCHAR(24) NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL,   winner_goals INT NOT NULL, opponent_goals INT NOT NULL);")
  # PK_GAME_TB =$($PSQL "ALTER TABLE games ADD PRIMARY KEY(game_id);")
  # FK_W_GAME_TB =$($PSQL "ALTER TABLE games ADD FOREIGN KEY(winner_id) references teams(team_id);")
  # FK_O_GAME_TB =$($PSQL "ALTER TABLE games ADD FOREIGN KEY(opponent_id) references teams(team_id);")

  # if [[ $FK_GAME_TB ='ALTER TABLE' ]]
  # then 
    # echo created database and tables    
# elif [[ $CON='%failed:%' ]]
# then 
  # echo failed $CON 
  # break
# fi 

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE="$($PSQL "TRUNCATE games CASCADE;")"
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $YEAR != year ]]
  then 
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER';")"
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT';")"

    if [[ -z $WINNER_ID ]] 
    then 
      INSERT_TEAMS="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")"
      if [[ $INSERT_TEAMS = 'INSERT 0 1' ]]
      then 
        WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER';")"
      fi
    fi 
    if [[ -z $OPPONENT_ID ]] 
    then 
      INSERT_TEAMS="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")"
      if [[ $INSERT_TEAMS = 'INSERT 0 1' ]]
      then 
        OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT';")"
      fi
    fi 
    INSERT_GAMES="$($PSQL "INSERT INTO games(year, round, winner_id,opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS,$OPPONENT_GOALS);")"
  fi 
done
