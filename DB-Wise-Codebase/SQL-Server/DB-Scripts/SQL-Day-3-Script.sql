SELECT CURRENT_TIMESTAMP, SYSDATETIME(), GETDATE(), GETUTCDATE(), SYSUTCDATETIME();


select * into #test from Production.Location ;

SELECT * FROM #test;

BEGIN TRAN
	select * from #test WHERE LocationID = 1;

	UPDATE #test SET Name = 'TC' WHERE LocationID = 1;

	select * from #test WHERE LocationID = 1;
ROLLBACK TRAN

select * from #test WHERE LocationID = 1;