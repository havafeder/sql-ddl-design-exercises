-- in terminal:
-- psql < soccer_league.sql
-- psql soccer_league

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

CREATE TABLE players 
(
	id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	date_of_birth DATE NOT NULL,
	age TEXT NOT NULL,
	team TEXT
)

CREATE TABLE referees 
(
	id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
)

CREATE TABLE teams 
(
	id SERIAL PRIMARY KEY,
	players_id INTEGER REFERENCES players,
	standing TEXT
)

CREATE TABLE matches 
(
	id SERIAL PRIMARY KEY,
	team1_id INTEGER REFERENCES teams,
	team2_id INTEGER REFERENCES teams,
	match_date DATE
	location TEXT
	referee_id INTEGER REFERENCES referees,
	winner_id INTEGER REFERENCES teams
)

CREATE TABLE goals 
(
	id SERIAL PRIMARY KEY,
	player_id INTEGER REFERENCES players,
	goal_date DATE,
	match_id INTEGER REFERENCES matches
)

CREATE TABLE start_end_dates
(
	id SERIAL PRIMARY KEY,
	start_date DATE,
	end_date DATE
)