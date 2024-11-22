/**Retrieve all properties and display their Property_ID, Property_Type, Bedrooms, Bathrooms, Area, and Price.
**/
SELECT *
FROM Properties;

--How many properties are there for each Property_Type ? 
SELECT AVG(Price)
FROM Properties;
--How many properties are there for each Property_Type ? 
SELECT Property_Type, COUNT(Property_Type)
FROM Properties
GROUP BY Property_Type;

--What is the property with the highest price? And what is the property with the lowest price ? 
SELECT TOP 1 *
FROM Properties
ORDER BY Price DESC
---
SELECT TOP 1 *
FROM Properties
ORDER BY Price ASC

--What is the average price of properties based on the number of bedrooms ? 
SELECT Bedrooms, AVG(Price) AS AVG_Price
FROM Properties
GROUP BY Bedrooms
ORDER BY AVG_Price
--How many properties are there in each district ? 
SELECT District, COUNT(District) AS Total
FROM Properties
GROUP BY District
ORDER BY Total
--What is the total area and average price of properties in each district ? 
SELECT District,SUM(TRY_CAST(REPLACE(Area, ' م²', '') AS FLOAT)) AS total_Area, AVG(Price) AS Average_Price
FROM Properties
GROUP BY District
order by Average_Price

--8. Which properties have a price between a given range (e.g., 500,000 and 1,000,000) ? 
SELECT *
FROM Properties
WHERE Price BETWEEN 500000 AND 1000000;

--Which agencies have the highest number of listed properties ? 
SELECT Agency_Name, COUNT(Agency_Name) AS Total
FROM Properties
GROUP BY Agency_Name
ORDER BY total DESC;
--10. Which properties mention a specific feature (e.g., “Modern”) in the description ? 

SELECT * 
FROM Properties
WHERE Description LIKE '%مسبح%'

SELECT * 
FROM Properties
WHERE Description LIKE '%مودرن%'

--11. What is the average price and average area for each Property_Type ? 
SELECT Property_Type, AVG(TRY_CAST(REPLACE(Area, ' م²', '') AS FLOAT)) AS Average_Area, AVG(Price) AS Average_Price
FROM Properties
GROUP BY Property_Type
--Which properties have more than a specified number of Bathrooms (e.g., more than 3 Bathrooms) ? 
SELECT *
FROM Properties
WHERE Bathrooms>3;
--14.	Which district has the highest average property price ? 
SELECT TOP 1 District, AVG(Price)AS AVG_Price
FROM Properties
GROUP BY District
ORDER BY AVG_Price DESC

--1.What is the percentage distribution of properties b y Property_Type ? 
SELECT Property_Type , COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Properties) AS percentage
FROM Properties
Group by Property_Type