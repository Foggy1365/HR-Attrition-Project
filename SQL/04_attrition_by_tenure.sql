SELECT 
	CASE	
		WHEN YearsAtCompany < 2 THEN '0-1 years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years' END AS TenureGroup,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM employees
GROUP BY TenureGroup
ORDER BY AttritionRate DESC;