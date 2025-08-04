USE AW2019;

SELECT 
	CountryRegionCode, cur.CurrencyCode,
	Name,
	FromCurrencyCode, ToCurrencyCode, AverageRate, EndOfDayRate
FROM
	Sales.CountryRegionCurrency crc
INNER JOIN
	Sales.Currency cur
ON
	crc.CurrencyCode = cur.CurrencyCode
INNER JOIN
	Sales.CurrencyRate cr
ON
	cr.ToCurrencyCode = cur.CurrencyCode
	ORDER BY AverageRate DESC;

-----------xxxxxx--x-x-x-x--x-x-x-x--x-x-x--x-x-x
USE AW2019;

SELECT * FROM Sales.CurrencyRate;

SELECT * FROM Sales.Currency;

SELECT DISTINCT 
	FromCurrencyCode, 'US Dollar' AS fromCurrStr, 
	ToCurrencyCode, Name AS toCurrStr, 
	AverageRate, EndOfDayRate 
FROM 
	Sales.CurrencyRate
INNER JOIN 
	Sales.Currency ON Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode
ORDER BY 
	AverageRate ASC;

SELECT DISTINCT 
	FromCurrencyCode, 'US Dollar' AS fromCurrStr, 
	ToCurrencyCode, Name AS toCurrStr, 
	AverageRate, EndOfDayRate 
FROM 
	Sales.CurrencyRate
INNER JOIN 
	Sales.Currency ON Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode
WHERE 
	AverageRate = 
	(SELECT MAX(AverageRate) FROM Sales.CurrencyRate WHERE Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode)
AND
	EndOfDayRate = 
	(SELECT MAX(EndOfDayRate) FROM Sales.CurrencyRate WHERE Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode)
ORDER BY 
	AverageRate ASC;

SELECT DISTINCT FromCurrencyCode, 'US Dollar' AS fromCurrStr, ToCurrencyCode, Name AS toCurrStr, AverageRate, EndOfDayRate FROM Sales.CurrencyRate INNER JOIN Sales.Currency ON Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode WHERE AverageRate = (SELECT MAX(AverageRate) FROM Sales.CurrencyRate WHERE Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode) AND EndOfDayRate = (SELECT MAX(EndOfDayRate) FROM Sales.CurrencyRate WHERE Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode) ORDER BY AverageRate;