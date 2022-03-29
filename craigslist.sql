-- in terminal:
-- psql < craigslist.sql
-- psql craigslist

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

CREATE TABLE users 
(
	id SERIAL PRIMARY KEY ON DELETE CASCADE,
	username VARCHAR(15) UNIQUE NOT NULL,
	password VARCHAR(20) NOT NULL,
	region_id INTEGER REFERENCES region
)

CREATE TABLE region
(
	id SERIAL PRIMARY KEY,
	region TEXT NOT NULL
)

CREATE TABLE area
(
    id SERIAL PRIMARY KEY,
	region_id INTEGER REFERENCES region,
	area TEXT NOT NULL
)

CREATE TABLE posts 
(
	id SERIAL PRIMARY KEY,
	region_id INTEGER REFERENCES region,
	area_id INTEGER REFERENCES area,
	user_id INTEGER REFERENCES users,
	title TEXT NOT NULL,
	text TEXT NOT NULL,
	category_id INTEGER REFERENCES categories
)

CREATE TABLE categories
(
	id SERIAL PRIMARY KEY,
	category TEXT NOT NULL
)