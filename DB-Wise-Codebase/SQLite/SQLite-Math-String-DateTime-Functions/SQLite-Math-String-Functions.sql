-- Math Functions SQLite
SELECT CEIL(123.123) AS roundUp,FLOOR(123.123) AS roundDown,PI(),ROUND(PI(),4) AS round4Dec,POW(2,3) AS pwr,SQRT(625) AS sqrRoot;

-- String Functions SQLite
SELECT '  Chandler' AS val1, LTRIM('  Chandler') AS startTrim, 'Chandler   ' AS val2, RTRIM('Chandler   ') AS endTrim, '  Chandler  ' AS val3, TRIM('  Chandler  ');

SELECT 'Chandler Bing' AS name, LENGTH('Chandler Bing') AS strLen, LOWER('Chandler Bing') AS lowerCase, UPPER('Chandler Bing') AS upperCase;

SELECT 'Chandler Bing' AS name, SUBSTR('Chandler Bing',2,4) AS startLength,REPLACE('Chandler Bing', 'Chandler','Ms. Chanandler') AS strReplaced, ('Ms.' || ' Chanandler' || ' Bong') AS strConcat;