USE patient_hospital_analysis;
SELECT * FROM patients_data_cleaned;

-- LENGTH OF STAY IN THE HOSPITAL BY DAY
SELECT *,
       DATEDIFF(DAY, arrival_date, departure_date) AS length_of_stay
FROM patients_data_cleaned;

--DAY OF ADMISSION
SELECT *,
       DATENAME(WEEKDAY, arrival_date) AS admission_day
FROM patients_data_cleaned;

-- AGE GROUP OF PATIENT
SELECT *,
       CASE
           WHEN age <= 17 THEN 'Pediatric'
           WHEN age <= 35 THEN 'Young Adult'
           WHEN age <= 55 THEN 'Adult'
           ELSE 'Senior'
       END AS age_group
FROM patients_data_cleaned;

--ANALYSIS TABLE
SELECT
    patient_id,
    age,
    service,
    satisfaction,
    arrival_date,
    departure_date,

    DATEDIFF(DAY, arrival_date, departure_date) AS length_of_stay,

    DATENAME(WEEKDAY, arrival_date) AS admission_day,

    DATENAME(MONTH, arrival_date) AS admission_month,

    CASE
        WHEN age <= 17 THEN 'Pediatric'
        WHEN age <= 35 THEN 'Young Adult'
        WHEN age <= 55 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group

INTO patient_analysis

FROM patients_data_cleaned;

SELECT * FROM patient_analysis;

-- RANK OF THE BUSIEST WARDS/DEPARTMENT
SELECT
    service, 
    COUNT (*) AS patient_count
FROM patient_analysis
Group by service
ORDER BY patient_count DESC;

-- PERCENTAGE OF PATIENTS ACCOMODATED BY A SERVICE
SELECT 
    service,
    COUNT(*) AS patient_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM patient_analysis
GROUP BY service
ORDER BY patient_count DESC;

-- AVERAGE LENGTH OF STAY PER SERVICE
SELECT
    service,
    AVG(length_of_stay * 1.0) AS avg_length_of_stay
FROM patient_analysis
GROUP BY service
ORDER BY avg_length_of_stay DESC;

-- MINIMUM AND MAXIMUM STAY
SELECT
    MIN(length_of_stay) AS shortest_stay,
    MAX(length_of_stay) AS longest_stay
FROM patient_analysis;

SELECT * FROM patient_analysis;

--DISTRIBUTION OF STAY LENGTHS
SELECT 
    length_of_stay,
    COUNT(*) AS patients
FROM patient_analysis
GROUP BY length_of_stay
ORDER BY length_of_stay;

-- WHICH DAY HAD THE MOST ADMISSIONS
SELECT 
    admission_day,
    COUNT(*) AS admissions
FROM patient_analysis
GROUP BY admission_day
ORDER BY admissions DESC

-- WHICH MONTHS HAVE THE MOST ADMISSIONS
SELECT 
    admission_month,
    COUNT(*) as admissions_per_month
FROM patient_analysis
GROUP BY admission_month
ORDER BY admissions_per_month DESC;

-- How many patients does each service handle over time?
SELECT
    DATENAME(MONTH, arrival_date) AS month,
    service,
    COUNT(*) AS admissions
FROM patient_analysis
GROUP BY
    DATENAME(MONTH, arrival_date),
    MONTH(arrival_date),
    service
ORDER BY
    MONTH(arrival_date),
    service;

-- AVERAGE LENGTH OF STAY BY AGE GROUP
SELECT
    age_group,
    AVG(length_of_stay * 1.0) AS average_of_stay
FROM patient_analysis
GROUP BY age_group
ORDER BY average_of_stay DESC;

-- AVERAGE AGE BY LENGTH OF STAY - doesn't really have much bearing, can be skewed by outliers
SELECT
    length_of_stay,
    AVG(age * 1.0) AS average_age
FROM patient_analysis
GROUP BY length_of_stay
ORDER BY length_of_stay;

-- SATISFACTION SCORING
SELECT
    MIN(satisfaction) AS minimum_score,
    MAX(satisfaction) AS maximum_score,
    AVG(satisfaction) AS overall_average
FROM patient_analysis;

-- AVERAGE SATISFACTION PER SERVICE/WARD
SELECT
service,
ROUND(AVG(satisfaction),2) AS average_satisfaction
FROM patient_analysis
GROUP BY service
ORDER BY average_satisfaction DESC;

-- COMPARISION TO THE OVERALL AVERAGE
SELECT
    service,
    ROUND(AVG(satisfaction),2) AS avg_satisfaction,
    ROUND(
        AVG(satisfaction) -
        (SELECT AVG(satisfaction)
         FROM patient_analysis),
    2) AS difference_from_average
FROM patient_analysis
GROUP BY service
ORDER BY avg_satisfaction DESC;

-- WHICH AGE GROUP FEELS MORE SATISFIED
SELECT
    age_group,
    AVG(satisfaction) AS avg_satisfaction
FROM patient_analysis
GROUP BY age_group
ORDER BY avg_satisfaction DESC;
-- SENIORS HAVE LEAST SCORE IN AVERAGE SATISFACTION WHICH MAKES SENSE BECAUSE THEY ARE MORE SENSITIVE DUE TO AGE

-- AVERAGE SATISFACTION BY LENGTH OF STAY
SELECT
    length_of_stay,
    ROUND (AVG(satisfaction), 2) AS avg_satisfaction,
    COUNT(*) as PATIENTS
 FROM patient_analysis
 GROUP BY length_of_stay
 ORDER BY length_of_stay DESC;
 -- order by length of stay, I wanted to see if the there are generally higher score for those who stay longer, which seems to be the case

 -- average stay per service with their average satisfaction
 SELECT
    service,
    AVG(length_of_stay) AS avg_stay,
    AVG(satisfaction) AS avg_satisfaction
FROM patient_analysis
GROUP BY service;

SELECT * FROM patient_analysis;
