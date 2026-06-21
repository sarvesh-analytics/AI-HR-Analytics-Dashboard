-- Create Table

CREATE TABLE hr_attrition (
    age INT,
    attrition VARCHAR(20),
    businesstravel VARCHAR(50),
    dailyrate INT,
    department VARCHAR(100),
    distancefromhome INT,
    education INT,
    educationfield VARCHAR(100),
    employeecount INT,
    employeenumber INT,
    environmentsatisfaction INT,
    gender VARCHAR(20),
    hourlyrate INT,
    jobinvolvement INT,
    joblevel INT,
    jobrole VARCHAR(100),
    jobsatisfaction INT,
    maritalstatus VARCHAR(50),
    monthlyincome INT,
    monthlyrate INT,
    numcompaniesworked INT,
    over18 VARCHAR(5),
    overtime VARCHAR(10),
    percentsalaryhike INT,
    performancerating INT,
    relationshipsatisfaction INT,
    standardhours INT,
    stockoptionlevel INT,
    totalworkingyears INT,
    trainingtimeslastyear INT,
    worklifebalance INT,
    yearsatcompany INT,
    yearsincurrentrole INT,
    yearssincelastpromotion INT,
    yearswithcurrmanager INT
);



-- Import CSV Data

\copy hr_attrition
FROM 'C:/Users/sarve/OneDrive/Desktop/AI-HR-Analytics-Dashboard/Dataset/WA_Fn-UseC_-HR-Employee-Attrition.csv'
DELIMITER ','
CSV HEADER;



-- Total Employees

SELECT COUNT(*) AS total_employees
FROM hr_attrition;


-- Attrition Count

SELECT COUNT(*) AS attrition_count
FROM hr_attrition
WHERE attrition = 'Yes';


-- Attrition Rate

SELECT
ROUND(
    COUNT(*) FILTER (WHERE attrition='Yes') * 100.0 / COUNT(*),
    2
) AS attrition_rate
FROM hr_attrition;


-- Department Wise Employees

SELECT department, COUNT(*)
FROM hr_attrition
GROUP BY department
ORDER BY COUNT(*) DESC;


-- Attrition by Department

SELECT department, COUNT(*)
FROM hr_attrition
WHERE attrition='Yes'
GROUP BY department
ORDER BY COUNT(*) DESC;


-- Average Salary by Department

SELECT department,
ROUND(AVG(monthlyincome),2) AS avg_salary
FROM hr_attrition
GROUP BY department
ORDER BY avg_salary DESC;



-- Gender Distribution

SELECT gender, COUNT(*)
FROM hr_attrition
GROUP BY gender;



-- Overtime Analysis

SELECT overtime, COUNT(*)
FROM hr_attrition
GROUP BY overtime;



-- Attrition by Overtime

SELECT overtime, COUNT(*)
FROM hr_attrition
WHERE attrition='Yes'
GROUP BY overtime;



-- Job Role Distribution

SELECT jobrole, COUNT(*)
FROM hr_attrition
GROUP BY jobrole
ORDER BY COUNT(*) DESC;


-- High Salary Employees

SELECT *
FROM hr_attrition
WHERE monthlyincome > 15000;


