SELECT JobRole,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(AVG(MonthlyIncome), 2) AS AvgSalary,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM employees
GROUP BY JobRole
ORDER BY AttritionRate DESC;