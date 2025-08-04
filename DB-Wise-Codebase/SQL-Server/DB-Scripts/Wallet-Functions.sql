
CREATE FUNCTION dbo.getWalletDebitTransactions (@walletNum nvarchar(50))
RETURNS int
WITH EXECUTE AS CALLER
AS
BEGIN
	-- @DECLARE @debitAmt int;
	return (SELECT sum(transactionAmount) from [Wallet-Transactions] where walletSender=@walletNum);
END;

CREATE FUNCTION dbo.getWalletCreditTransactions (@walletNum nvarchar(50))
RETURNS int
WITH EXECUTE AS CALLER
AS
BEGIN
	return (SELECT sum(transactionAmount) from [Wallet-Transactions] where walletRecipient=@walletNum);
END;

DROP FUNCTION dbo.getWalletCreditTransactions;
/*
CREATE FUNCTION dbo.getWalletBalance (@walletNum nvarchar(50))
RETURNS int
-- WITH EXECUTE AS CALLER
AS
BEGIN
	DECLARE @debitAmt int;
	DECLARE @creditAmt int;
	DECLARE @balanceAmt int;

	SET @debitAmt = 0;
	SET @creditAmt = 0;
	SET @balanceAmt = 0;

	SET @creditAmt = (SELECT sum(transactionAmount) from [Wallet-Transactions] where walletRecipient=@walletNum));
	SET @debitAmt = (SELECT sum(transactionAmount) from [Wallet-Transactions] where walletSender=@walletNum));
	SET @balanceAmt = (@debitAmt - @creditAmt);

	RETURN @balanceAmt;
END;
*/
DROP FUNCTION dbo.getWalletCreditTransactions;