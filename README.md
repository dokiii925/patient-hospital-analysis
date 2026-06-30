# patient-hospital-analysis
Healthcare analytics portfolio project using SQL and Power BI to transform patient records into operational insights on service demand, length of stay, admissions, and patient satisfaction.

Hospital Patient Flow & Satisfaction Analytics

Project Overview

Hospitals rely on operational data to understand patient demand, improve service efficiency, and enhance patient satisfaction. This project demonstrates an end-to-end healthcare analytics workflow by transforming raw patient records into actionable business insights using SQL and Power BI.

The project focuses on analyzing patient flow, hospital efficiency, demographic trends, and patient satisfaction to support data-driven operational decision-making.

Business Problem

Hospital administrators need to understand how patients move through the hospital and how operational performance affects patient experience.

This project answers the following business questions:

Which hospital service handles the most patients?
Which service has the longest average length of stay?
When are hospital admissions busiest?
Do older patients stay longer than younger patients?
Which service has the highest and lowest patient satisfaction?
Is there a relationship between longer hospital stays and lower patient satisfaction?

Dashboard Preview
<img width="1285" height="725" alt="image" src="https://github.com/user-attachments/assets/7a03fd80-cc89-44ee-869f-ae9a0875f84c" />

hospital-patient-flow-analysis/
│
├── data/
│   ├── raw/
│   ├── processed/
│
├── sql/
│   ├── 01_data_cleaning.sql
│
├── dashboard/
│   └── Patient_analysis_Dashboard.pbix
│
├── images/
│
├── reports/
│
├── README.md
├── requirements.txt
├── LICENSE
└── .gitignore


The dataset contains simulated hospital patient records with the following fields:

Column	Description
patient_id	Unique patient identifier
name	Patient name
age	Patient age
arrival_date	Hospital admission date
departure_date	Hospital discharge date
service	Hospital department
satisfaction	Patient satisfaction score

The following validation steps were performed before analysis:

Checked for missing values
Checked for duplicate patient IDs
Converted arrival and departure dates to date format
Validated hospital stay logic (departure date must not occur before arrival date)
Standardized service names where necessary

Dashboard Components
Filters
Admission Month
Hospital Service
Age Group
Key Performance Indicators (KPIs)
Total Patients
Average Length of Stay
Average Satisfaction Score
Total Hospital Services
Visualizations
Patients by Service
Average Length of Stay by Service
Admissions by Month
Admissions by Day of Week
Satisfaction by Service
Age vs. Length of Stay
Length of Stay vs. Satisfaction 

Business Questions
Service Demand
Which service handles the most patients?
Hospital Efficiency
Which service has the longest average patient stay?
Patient Flow
Which day receives the highest number of admissions?
Which month receives the highest number of admissions?
Demographics
Do older patients stay longer than younger patients?
Patient Experience
Which service has the highest patient satisfaction?
Relationship Analysis
Is there a relationship between length of stay and patient satisfaction?


Business Recommendations

Based on the analysis, hospital administrators may consider:

Allocating additional staff to high-volume services.
Monitoring services with longer patient stays to improve throughput.
Preparing staffing schedules around peak admission periods.
Reviewing patient experience initiatives for services with lower satisfaction.
Monitoring patients with extended stays to improve overall satisfaction.

Tools & Technologies
SQL Server
Power BI
Git
GitHub

Skills Demonstrated
SQL Queries
Data Cleaning
Feature Engineering
Exploratory Data Analysis (EDA)
Healthcare Analytics
Dashboard Design
Data Visualization
Business Intelligence
Data Storytelling


Future Improvements

Potential enhancements for future versions include:

Synthetic data generation for stress testing
Predictive modeling for patient length of stay
Bed occupancy analysis
Multi-year trend analysis
Drill-through dashboard pages
Service-level benchmarking


Author

Annie Andrea Antonio

Medical Technologist | Aspiring Healthcare Data Analyst

LinkedIn: www.linkedin.com/in/annie-andrea-antonio

GitHub: https://github.com/dokiii925
