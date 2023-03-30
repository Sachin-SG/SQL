/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductCategoryKey]
      ,[ProductCategoryAlternateKey]
      ,[EnglishProductCategoryName]
      ,[SpanishProductCategoryName]
      ,[FrenchProductCategoryName]
  FROM [AdventureWorksDW2017].[dbo].[DimProductCategory];

 SELECT P.EnglishProductCategoryName,PS.EnglishProductSubcategoryName  , PSP.EnglishProductName FROM DimProductCategory AS P INNER JOIN DimProductSubcategory AS PS
 ON P.ProductCategoryKey = PS.ProductCategoryKey
 INNER JOIN DimProduct AS PSP ON  PS.ProductSubcategoryKey = PSP.ProductSubcategoryKey;

 
 SELECT * FROM DimProductCategory AS P INNER JOIN DimProductSubcategory AS PS
 ON P.ProductCategoryKey = PS.ProductCategoryKey
 INNER JOIN DimProduct AS PSP ON  PS.ProductSubcategoryKey = PSP.ProductSubcategoryKey;