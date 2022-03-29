-- in terminal:
-- psql < medical_center.sql
-- psql medical_center

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

CREATE TABLE doctors 
(
	id SERIAL PRIMARY KEY ON DELETE CASCADE,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	specialty TEXT
)

CREATE TABLE patients
(
	id SERIAL PRIMARY KEY ON DELETE CASCADE,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	doctor_id INTEGER REFERENCES doctors
)

CREATE TABLE diagnoses
(
	id SERIAL PRIMARY KEY,
	patient_id INTEGER REFERENCES patients,
	diagnoses TEXT NOT NULL
)