# Hospital Data Analysis

SQL analysis of a hospital dataset to extract operational and financial insights using PostgreSQL.

## Project Overview
This project involves querying a hospital database to analyze patient volumes, department performance, medical expenses, and hospital operations using SQL queries.

## Database Schema
- **Hospital_data** — Hospital Name, Location, Department, Doctors Count, Patients Count, Admission Date, Discharge Date, Medical Expenses

## Key Analysis Performed
- Calculated total number of patients across all hospitals
- Retrieved average number of doctors per hospital
- Identified top 3 departments by patient volume
- Found hospital with maximum medical expenses
- Analyzed daily average medical expenses per hospital
- Calculated longest hospital stay using date difference
- Counted total patients treated per city
- Determined average length of stay per department
- Identified department with lowest patient count
- Generated monthly medical expenses report

## SQL Concepts Used
- SELECT, WHERE, GROUP BY, ORDER BY, HAVING
- Aggregate Functions (SUM, AVG, COUNT)
- LIMIT
- TO_DATE for date conversion
- EXTRACT for month and year

## Tools Used
- PostgreSQL
- pgAdmin
