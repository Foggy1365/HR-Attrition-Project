SELECT PerformanceRating,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS AttritionRate,
    ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM employees
GROUP BY PerformanceRating
ORDER BY PerformanceRating DESC;