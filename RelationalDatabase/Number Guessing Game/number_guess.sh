#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=num_guess -t --no-align -c"

main() {
echo "Enter your username: "
read USERNAME
if [[ $(expr length "$USERNAME") -gt 22 ]]
then
  read USERNAME
else
  USER_ID="$($PSQL "select user_id from users where username='$USERNAME';")"
  if [[ -z $USER_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME');")
    USER_ID=$($PSQL "select user_id from users where username='$USERNAME';")
    GAMES_PLAYED=0
    BEST_GAME=0
  else
    GAMES_PLAYED="$($PSQL "select count(*) from games where user_id=$USER_ID;")"
    BEST_GAME="$($PSQL "select min(guess) from games where user_id=$USER_ID limit 1;")"
    if [[ -z $BEST_GAME ]]
    then
      BEST_GAME=0
    fi

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  echo "Guess the secret number between 1 and 1000:"
  
  NUMBER=$(( RANDOM % 1000 + 1  ))

  read GUESS
  GUESS_COUNT=1
  while true; do 
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then  
      echo "That is not an integer, guess again:"
    elif [[ $GUESS -gt $NUMBER ]]; then 
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $NUMBER ]]; then 
      echo "It's higher than that, guess again:"
    else

      INSERT_GAME_INFO="$($PSQL "insert into games(user_id, number, guess) values($USER_ID, $NUMBER, $GUESS_COUNT);")"

      echo "You guessed it in $GUESS_COUNT tries. The secret number was $NUMBER. Nice job!"
      exit 0
    fi
    ((GUESS_COUNT++))
    read GUESS
  done 
fi
}

main