CREATE DATABASE Ecommerce_Customer_Segmentation;

USE Ecommerce_Customer_Segmentation;

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT TOP 10 *
FROM dbo.Final_Customer_RFM;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Final_Customer_RFM';

SELECT
    COUNT(*) AS Total_Customers
FROM dbo.Final_Customer_RFM;


SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(), 2
    ) AS Customer_Percentage
FROM dbo.Final_Customer_RFM
GROUP BY Customer_Segment
ORDER BY Total_Customers DESC;


SELECT
    Customer_Segment,
    ROUND(SUM(Monetary), 2) AS Total_Revenue,
    ROUND(AVG(Monetary), 2) AS Average_Spending
FROM dbo.Final_Customer_RFM
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;


SELECT TOP 10
    Recency,
    Frequency,
    Monetary,
    Customer_Segment
FROM dbo.Final_Customer_RFM
ORDER BY Monetary DESC;


SELECT
    Cluster,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Recency), 2) AS Average_Recency,
    ROUND(AVG(Frequency), 2) AS Average_Frequency,
    ROUND(AVG(Monetary), 2) AS Average_Monetary
FROM dbo.Final_Customer_RFM
GROUP BY Cluster
ORDER BY Cluster;


SELECT
    Recency,
    Frequency,
    Monetary,
    Customer_Segment,
    Marketing_Recommendation
FROM dbo.Final_Customer_RFM
WHERE Customer_Segment IN ('At Risk', 'Lost Customers')
ORDER BY Recency DESC;


SELECT
    MAX(Monetary) AS Highest_Spending,
    MIN(Monetary) AS Lowest_Spending,
    ROUND(AVG(Monetary), 2) AS Average_Spending
FROM dbo.Final_Customer_RFM;


SELECT
    Frequency,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Monetary), 2) AS Average_Spending
FROM dbo.Final_Customer_RFM
GROUP BY Frequency
ORDER BY Frequency DESC;


SELECT
    RFM_Score,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Monetary), 2) AS Average_Spending
FROM dbo.Final_Customer_RFM
GROUP BY RFM_Score
ORDER BY RFM_Score DESC;


SELECT
    Customer_Segment,
    Marketing_Recommendation,
    COUNT(*) AS Total_Customers
FROM dbo.Final_Customer_RFM
GROUP BY
    Customer_Segment,
    Marketing_Recommendation
ORDER BY Total_Customers DESC;


SELECT
    COUNT(*) AS Total_Records,
    COUNT(Recency) AS Recency_Records,
    COUNT(Frequency) AS Frequency_Records,
    COUNT(Monetary) AS Monetary_Records,
    COUNT(Customer_Segment) AS Segment_Records,
    COUNT(Cluster) AS Cluster_Records
FROM dbo.Final_Customer_RFM;
