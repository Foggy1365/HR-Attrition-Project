SELECT 
	CASE	
		WHEN MonthlyIncome < 3000 THEN 'Low (Under 3K)'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium (3k-6k)'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN 'High (6k-10K)'
        ELSE 'Very High (10K+)' END AS SalaryRange,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM employees
GROUP BY SalaryRange
ORDER BY AttritionRate DESC;