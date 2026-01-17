SELECT 
	CASE	
		WHEN DistanceFromHome < 5 THEN 'Very close (0-4 km)'
        WHEN DistanceFromHome BETWEEN 5 AND 10 THEN 'Close (5-10 km)'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN 'Moderate (11-20 km)'
        ELSE 'Far (20+ km)' END AS DistanceGroup,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM employees
GROUP BY DistanceGroup
ORDER BY AttritionRate DESC;