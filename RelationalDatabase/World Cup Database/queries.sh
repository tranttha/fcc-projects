#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals+opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"


echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games")"


echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals+opponent_goals) FROM games")"


echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"


echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "with t as(select * from games where winner_goals >2) select count(*) from t")"


echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from teams where team_id = (SELECT (winner_id) FROM games where year=2018 and round='Final')")"


echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select name from teams where team_id in (SELECT winner_id  FROM games where year=2014 and round ='Eighth-Final' UNION SELECT opponent_id  FROM games where year=2014 and round ='Eighth-Final') order by name")"
 

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select name from teams where team_id in (SELECT distinct winner_id  FROM games ) order by name;")"


echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "with t as (SELECT year as y, winner_id as w FROM games where round ='Final') select t.y, name from t left join teams on t.w = teams.team_id  order by t.y;")"


echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name LIKE 'Co%';")"

