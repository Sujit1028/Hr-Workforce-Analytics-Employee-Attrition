# Creatng Database and tables
CREATE DATABASE hr_analytics;
USE hr_analytics;


# Checking Dataset
SELECT COUNT(*) AS Total_Employees
FROM hr_employee_attrition;

SELECT *
FROM hr_employee_attrition
LIMIT 10;

DESCRIBE hr_employee_attrition;

SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT EmployeeNumber) AS Unique_Employees
FROM hr_employee_attrition;


# 1. Employee Overall Attrition Analysis
SELECT 
	COUNT(*) AS Total_Employee,
	SUM(Attrition = 'YES') AS Employees_Left,
    SUM(Attrition = 'No' ) AS Employees_Stayed,
        ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition;


# 2. Department-wise Employee Attrition
SELECT
	Department,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
		SUM(Attrition = 'Yes') * 100/ COUNT(*),
        2) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY department
ORDER BY Attrition_Rate DESC;


# 3. Attrition By Job Role
SELECT
	JobRole,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = "YES") AS Employees_Left,
    ROUND(
		SUM(Attrition = "YES") * 100 / COUNT(*),
        2) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;


# 4. Attrition by Overtime
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

/*
Overtime is strongly associated with higher employee attrition.
*/


# 5. Attrition by Age Group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

/*
1. Under 25: Highest attrition rate at 39.18%.
2. Age 25–34: Highest number of employees leaving (112).
3. Age 35–44: Lowest attrition rate at 10.10%.
4. Younger employees show higher attrition.
*/

# 6. Attrition by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY Gender
ORDER BY Attrition_Rate DESC;

/*
1. Male employees have a higher attrition rate (17.01%) than female employees (14.80%).
2. More male employees left: 150 compared with 87 female employees.
3. The difference in attrition rates is 2.21% percentage points.
*/


# 7. Attrition by Marital Status
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;

/*
1. Single employees have the highest attrition rate at 25.53%.
2. Married employees have an attrition rate of 12.48%.
3. Divorced employees have the lowest attrition rate at 10.09%.
4. Single employees account for 120 of the 237 employees who left.

Business Insight:
Single employees show a considerably higher attrition rate.
HR could investigate career expectations, job satisfaction, compensation, and work-life balance.
Marital status itself should not be treated as the cause.
*/


# 8. Attrition by Business Travel
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY BusinessTravel
ORDER BY Attrition_Rate DESC;

/*
1. Employees who travel frequently have the highest attrition rate: 24.91%.
2. Employees who travel rarely have an attrition rate of 14.96%.
3. Employees who don't travel have the lowest attrition rate: 8.00%.

Business Insight:
Frequent business travel is associated with higher employee attrition.
HR could investigate travel workload, employee fatigue, and work-life balance.
*/



# 9. Attrition by Job Satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

/*
1 is LOW and 4 is High
1. Employees with satisfaction level 1 have the highest attrition rate: 22.84%.
2. Employees with satisfaction level 4 have the lowest rate: 11.33%.
3. Attrition is generally lower among employees with higher job satisfaction.

Business Insight:
Lower job satisfaction is associated with higher employee attrition.
HR should investigate employee concerns, workplace conditions, management support, and career development.
*/



# 10. Attrition by Work-Life Balance
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

/*
- Employees with work-life balance level 1 have the highest attrition rate: 31.25%.
- Level 3 has the lowest attrition rate: 14.22%.
- Interestingly, level 4 has a higher attrition rate (17.65%) than levels 2 and 3.

Business Insight:
Employees reporting the poorest work-life balance are more likely to leave.
HR should investigate workload, scheduling, overtime, and employee support.
The relationship does not establish causation.
*/



# 11. Attrition by Years at Company
SELECT
    YearsAtCompany,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

# Employees with 0–1 years at the company have particularly high attrition rates.



# 12. Attrition by Monthly Income
SELECT
    ROUND(MonthlyIncome, -3) AS Income_Range,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY Income_Range
ORDER BY Income_Range;

/*
Lower monthly income is associated with higher attrition in several income ranges.
HR could investigate compensation competitiveness and salary progression.
*/


# 13. Attrition by Total Working Years
SELECT
    TotalWorkingYears,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY TotalWorkingYears
ORDER BY TotalWorkingYears;


# 14. Attrition by Environment Satisfaction
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

/*
- Employees with satisfaction level 1 have the highest attrition rate: 25.35%.
- Employees with satisfaction level 4 have the lowest attrition rate: 13.45%.

Insight:
Employees dissatisfied with their work environment are more likely to leave.
HR could investigate workplace conditions, team relationships, facilities, and management support.
*/


# 15. Attrition by Job Involvement
SELECT
    JobInvolvement,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY JobInvolvement
ORDER BY JobInvolvement;

/*
- Employees with involvement level 1 have the highest attrition rate: 33.73%.
- Employees with involvement level 4 have the lowest rate: 9.03%.
- Attrition generally decreases as job involvement increases.
- Level 3 has the highest number of employees leaving: 125, because it also has the largest employee group.
*/

# 16. Attrition by Job Level
SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY JobLevel
ORDER BY JobLevel;

/*
- Job Level 1 has the highest attrition rate at 26.34%.
- Job Level 4 has the lowest attrition rate at 4.72%.
- Job Level 1 also has the highest number of employees leaving: 143.
- Attrition generally appears lower at higher job levels, although Level 3 and Level 5 don't follow a perfectly decreasing pattern.

Insight:
Entry-level employees have considerably higher attrition.
HR could investigate onboarding, career growth, compensation, and employee development opportunities.
*/


# 17. Attrition by Education Field
SELECT
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY EducationField
ORDER BY Attrition_Rate DESC;

/*
Attrition varies across education fields.
HR should investigate whether differences in job roles, career opportunities, and compensation contribute to these patterns.
Education field alone does not explain why employees leave.
*/


# 18. Attrition by Relationship Satisfaction
SELECT
    RelationshipSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY RelationshipSatisfaction
ORDER BY RelationshipSatisfaction;

/*
- Satisfaction level 1 has the highest attrition rate: 20.65%.
- Satisfaction level 4 has the lowest rate: 14.81%.
- Attrition is noticeably higher among employees with low relationship satisfaction.
- Level 3 has the highest number of employees leaving (71), because it has the largest employee group.

Insight:
Employees reporting low relationship satisfaction are more likely to leave.
HR could investigate team relationships, manager support, and workplace communication.
*/

# 19. Attrition by Years in Current Role
SELECT
    YearsInCurrentRole,
    COUNT(*) AS Total_Employees,
    SUM(Attrition = 'Yes') AS Employees_Left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY YearsInCurrentRole
ORDER BY YearsInCurrentRole;

/*
Insight:
Employees who are new to their current roles may need better onboarding, role clarity, and manager support.
*/