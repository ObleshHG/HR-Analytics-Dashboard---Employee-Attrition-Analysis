#Create Databases
CREATE DATABASE HR_Analytics;

use HR_Analytics;

SHOW DATABASES;

use HR_Analytics;
select * from HR_Employees_Clean
LIMIT 10;


SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM HR_Employees_Clean;

#Check the Employee records
SELECT * 
FROM HR_EMPLOYEES_CLEAN
LIMIT 10;

#Check Column Name And Data types
DESCRIBE HR_EMPLOYEES_CLEAN;

#Data Cleaning-Check Null Values
SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS Missing_MonthlyIncome
FROM HR_Employees_Clean;

#Department-wise employee count
SELECT DEPARTMENT,COUNT(*) AS TOTAL_EMPLOYEES
FROM HR_EMPLOYEES_CLEAN
GROUP BY DEPARTMENT ORDER  BY TOTAL_EMPLOYEES DESC;

#Gender-wise employee count
 SELECT GENDER,COUNT(*) AS TOTAL_EMPLOYEES
 FROM HR_EMPLOYEES_CLEAN
 GROUP BY GENDER;
 
 #Average employee age
 SELECT AVG(AGE) AS AVERAGE_AGE
 FROM HR_EMPLOYEES_CLEAN;
 
#Average Salary by Department 
SELECT DEPARTMENT,ROUND(AVG(MONTHLYINCOME),2) AS AVERAGE_SALARY
FROM HR_EMPLOYEES_CLEAN
GROUP BY DEPARTMENT 
ORDER BY AVERAGE_SALARY DESC; 

#Highest Paid Employees
SELECT EMPLOYEEID,AGE,DEPARTMENT,MONTHLYINCOME
FROM HR_EMPLOYEES_CLEAN
ORDER BY MONTHLYINCOME DESC 
LIMIT 10;

#Employee Attrition Analysis
SELECT Attrition, COUNT(*) AS EMPLOYEE_Count
FROM HR_Employees_Clean
GROUP BY Attrition;
 
 #Calculate Employee Attrition Rate
 SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM HR_Employees_Clean;

#Attrition by Department
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM HR_Employees_Clean
GROUP BY Department
ORDER BY Attrition_Rate DESC;

#Attrition by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
    AS Employees_Left
FROM HR_Employees_Clean
GROUP BY Gender;

#Attrition by Age Group
 SELECT
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and Above'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM HR_Employees_Clean
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

#Attrition by Job Role
 SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
    AS Employees_Left
FROM HR_Employees_Clean
GROUP BY JobRole
ORDER BY Employees_Left DESC;

#Employee Experience Analysis
SELECT
    YearsAtCompany,
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM HR_Employees_Clean
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

#Attrition by Job Satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left

FROM HR_Employees_Clean
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

#Salary Analysis by Attrition
SELECT
    Attrition,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Salary,
    MIN(MonthlyIncome) AS Minimum_Salary,
    MAX(MonthlyIncome) AS Maximum_Salary
FROM HR_Employees_Clean
GROUP BY Attrition;

#Business Travel Analysis
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM HR_Employees_Clean
GROUP BY BusinessTravel
ORDER BY Attrition_Rate DESC;

#Overtime Analysis
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM HR_Employees_Clean
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

#Work-Life Balance Analysis
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left

FROM HR_Employees_Clean
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

#Promotion and Career Growth Analysis

#Attrition by Years Since Last Promotion
SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM HR_Employees_Clean
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

#Final Employee Summary
SELECT
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,

    SUM(CASE
        WHEN Attrition = 'No' THEN 1
        ELSE 0
    END) AS Active_Employees,

    ROUND(AVG(Age), 2) AS Average_Age,

    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Salary

FROM HR_Employees_Clean;



