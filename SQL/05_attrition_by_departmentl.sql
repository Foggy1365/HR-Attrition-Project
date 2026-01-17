WITH department_attrition AS (
	SELECT Department,
	COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft
    FROM employees
    GROUP BY Department)
SELECT Department, TotalEmployees, EmployeesLeft,
	ROUND((EmployeesLeft/TotalEmployees) * 100, 2) AS AttritionRate
FROM department_attrition
ORDER BY AttritionRate DESC;