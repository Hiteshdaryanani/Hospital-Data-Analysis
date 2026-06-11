-- Create Database
CREATE DATABASE Hospital;

-- Switch to the database
\c Hospital;

-- Create Table
DROP TABLE IF EXISTS Hospital_data;

CREATE TABLE Hospital_data (
	"Hospital Name" VARCHAR(50),
	"Location" VARCHAR(50),
	"Department" VARCHAR(50),
	"Doctors Count" INT,
	"Patients Count" INT,
	"Admission Date" VARCHAR(50) NOT NULL,
	"Discharge Date" VARCHAR(50) NOT NULL,
	"Medical Expenses" NUMERIC  NOT NULL
	);

SET datestyle = 'DMY';

SELECT * FROM Hospital_data;

1. Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals.

SELECT SUM("Patients Count") AS Total_count
FROM Hospital_data;


2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in each hospital.
SELECT "Hospital Name", AVG("Doctors Count") AS Average_Count_Of_Doctors
FROM Hospital_data
GROUP BY "Hospital Name";


3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.

SELECT "Department", SUM("Patients Count") AS Total_Patients
FROM Hospital_data
GROUP BY "Department"
ORDER BY Total_Patients DESC
LIMIT 3;

4. Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses.
SELECT "Hospital Name", SUM("Medical Expenses") AS Total_Medical_Expenses
FROM Hospital_data
GROUP BY "Hospital Name"
ORDER BY Total_Medical_Expenses DESC
LIMIT 1;


5. Daily Average Medical Expenses
-- Calculate the average medical expenses per day for each hospital.
SELECT "Hospital Name", "Admission Date", AVG("Medical Expenses") AS Average_Medical_Expenses
FROM Hospital_data
GROUP BY "Hospital Name", "Admission Date"
ORDER BY "Hospital Name", "Admission Date";


6. Longest Hospital Stay
-- Find the patient with the longest stay by calculating the difference between
Discharge Date and Admission Date.
SELECT "Hospital Name", (To_date("Discharge Date", 'DD-MM-YYYY') - To_Date("Admission Date", 'DD-MM-YYYY')) AS Length_Of_Stay
FROM Hospital_data
ORDER BY Length_Of_Stay DESC
LIMIT 1;



7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.
SELECT "Location", SUM("Patients Count") AS Total_Patients
FROM Hospital_data
GROUP BY "Location"
ORDER BY Total_Patients DESC;


8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.
SELECT "Department",
AVG(To_Date("Discharge Date", 'DD-MM-YYYY') - To_Date("Admission Date", 'DD-MM-YYYY')) AS Average_Length_Of_Stay
FROM Hospital_data
GROUP BY "Department"
ORDER BY Average_Length_Of_Stay DESC;

9. Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients.
SELECT "Department", SUM("Patients Count") AS Total_Patients_Count
FROM Hospital_data
GROUP BY "Department"
ORDER BY Total_Patients_Count
LIMIT 1;


10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.
SELECT EXTRACT(MONTH FROM TO_DATE("Admission Date", 'DD-MM-YYYY')) AS Month,
	EXTRACT(YEAR FROM TO_DATE("Admission Date", 'DD-MM-YYYY')) AS Year,
	SUM("Medical Expenses") AS Total_Medical_Expenses
	FROM Hospital_data
	GROUP BY Year, Month
	ORDER BY Year, Month;

