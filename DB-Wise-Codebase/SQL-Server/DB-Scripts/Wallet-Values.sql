SELECT sum(transactionAmount) from [Wallet-Transactions] where walletSender='77adab04-349d-43eb-9631-8970160a4c5d'
UNION
SELECT sum(transactionAmount) from [Wallet-Transactions] where walletRecipient='77adab04-349d-43eb-9631-8970160a4c5d';

@DECLARE amtSent int;
@DECLARE amtRecd int;

SELECT (amtSent-amtRecd) from [Wallet-Transactions] WHERE
SET amtSent = (SELECT sum(transactionAmount) from [Wallet-Transactions] where walletSender='77adab04-349d-43eb-9631-8970160a4c5d') AND
SET amtRecd = (SELECT sum(transactionAmount) from [Wallet-Transactions] where walletRecipient='77adab04-349d-43eb-9631-8970160a4c5d');

SELECT walletSender,sum(transactionAmount) from [Wallet-Transactions] GROUP BY walletSender
UNION
SELECT walletRecipient,sum(transactionAmount) from [Wallet-Transactions] GROUP BY walletRecipient;


DECLARE @intVal int;
EXEC @intVal = getWalletDebitTransactions '77adab04-349d-43eb-9631-8970160a4c5d'
print( 'V:' + str(@intVal) );

getWalletDebitTransactions '77adab04-349d-43eb-9631-8970160a4c5d'

SELECT sum(transactionAmount) from [Wallet-Transactions] where walletRecipient='77adab04-349d-43eb-9631-8970160a4c5d')
 
SELECT DISTINCT walletSender,
( (SELECT dbo.getWalletCreditTransactions(walletSender)) - (SELECT dbo.getWalletDebitTransactions(walletSender)) ) balAmt
from [Wallet-Transactions]
WHERE transactionDate BETWEEN '2021-01-01' AND '2021-12-31';
;

SELECT DISTINCT walletUser,walletSender,
( (SELECT dbo.getWalletCreditTransactions(walletSender)) - (SELECT dbo.getWalletDebitTransactions(walletSender)) ) balAmt
FROM [Wallet-Transactions] WT, [Wallet-Info] WI
WHERE
WT.walletSender = WI.walletNumber AND
transactionDate BETWEEN '2021-01-01' AND '2021-12-31'