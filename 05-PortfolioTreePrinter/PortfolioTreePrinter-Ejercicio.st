!classDefinition: #AccountSummaryLines category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountSummaryLines
	instanceVariableNames: 'accounts lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryLines methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:42:56'!
initializeWith: aReceptiveAccount

	accounts := aReceptiveAccount ! !

!AccountSummaryLines methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:54:49'!
value

	lines := OrderedCollection new.
	
	accounts transactionsDo: [ :aTransaction | aTransaction accept: self ].
	
	^ lines! !

!AccountSummaryLines methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:54:31'!
visitDeposit: aDeposit

	lines add: 'Deposito por ', aDeposit value asString! !

!AccountSummaryLines methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:54:22'!
visitTransferDeposit: aTransferDeposit

	lines add: 'Transferencia por ', aTransferDeposit value asString! !

!AccountSummaryLines methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:54:17'!
visitTransferWithdraw: aTransferWithdraw

	lines add: 'Transferencia por -', aTransferWithdraw value asString! !

!AccountSummaryLines methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:54:10'!
visitWithdraw: aWithdraw

	lines add: 'Extraccion por ', aWithdraw value asString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryLines class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummaryLines class
	instanceVariableNames: ''!

!AccountSummaryLines class methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:42:35'!
of: aReceptiveAccount

	^ self new initializeWith: aReceptiveAccount ! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!


!AccountTransaction methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:20:37'!
affectBalance: currentBalance  

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HAW 10/18/2018 21:06:37'!
for: anAmount

	self subclassResponsibility ! !


!AccountTransaction class methodsFor: 'registering' stamp: 'HAW 10/18/2018 19:48:18'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 20:37:28'!
affectBalance: currentBalance  

	^currentBalance + self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:45:31'!
accept: aVisitor

	aVisitor visitDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #InvestmentLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #InvestmentLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentLeg methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:52:13'!
affectBalance: currentBalance  

	self subclassResponsibility! !


!classDefinition: #InvestmentDeposit category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentLeg subclass: #InvestmentDeposit
	instanceVariableNames: 'invested time rate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentDeposit methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:51:51'!
affectBalance: currentBalance  

	^ currentBalance - self value! !


!classDefinition: #InvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentLeg subclass: #InvestmentEarnings
	instanceVariableNames: 'invested time rate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:52:00'!
affectBalance: currentBalance  

	^ currentBalance - self value! !


!classDefinition: #TransferLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferLeg methodsFor: 'transfer' stamp: 'HAW 10/18/2018 21:05:34'!
transfer

	^transfer ! !


!TransferLeg methodsFor: 'initialization' stamp: 'HAW 10/18/2018 21:07:15'!
initializeRelatedTo: aTransfer 
	
	transfer := aTransfer ! !


!TransferLeg methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:35:56'!
value

	^transfer value! !


!TransferLeg methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:52:45'!
accept: aVisitor

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'HAW 10/18/2018 21:07:07'!
relatedTo: aTransfer 
	
	^self new initializeRelatedTo: aTransfer ! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:34:58'!
affectBalance: currentBalance

	^currentBalance + self value! !


!TransferDeposit methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:52:02'!
accept: aVisitor

	aVisitor visitTransferDeposit: self! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'evaluating' stamp: 't g 10/22/2018 19:52:13'!
accept: aVisitor

	aVisitor visitTransferWithdraw: self! !

!TransferWithdraw methodsFor: 'evaluating' stamp: 't g 10/18/2018 21:31:51'!
affectBalance: currentBalance

	^ currentBalance - self value! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 20:36:35'!
affectBalance: currentBalance  

	^currentBalance - self value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:52:33'!
accept: aVisitor

	aVisitor visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransferNet category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransferNet
	instanceVariableNames: 'accounts net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:03:34'!
initializeWith: aReceptiveAccount

	accounts := aReceptiveAccount ! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:11:08'!
value

	net := 0.
	
	accounts transactionsDo: [ :aTransaction | aTransaction accept: self ].
	
	^ net! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:12:29'!
visitDeposit: aDeposit

! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:12:47'!
visitTransferDeposit: aTransferDeposit

	net := net + aTransferDeposit value ! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:15:15'!
visitTransferWithdraw: aTransferWithdraw

	net := net - aTransferWithdraw value! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:13:53'!
visitWithdraw: aWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:03:18'!
of: aReceptiveAccount

	^ self new initializeWith: aReceptiveAccount ! !


!classDefinition: #Investment category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Investment
	instanceVariableNames: 'value time rate investedLeg earningsLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Investment methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:27:57'!
affectBalance: currentBalance  

	^ currentBalance - self value! !

!Investment methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 21:05:58'!
earningsLeg
	
	^earningsLeg ! !

!Investment methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:51:00'!
initializeFor: aSum for: aTime withRate: aRate

	value := aSum.
	time := aTime.
	rate := aRate.
	investedLeg := InvestmentDeposit relatedTo: self .
	earningsLeg := InvestmentEarnings relatedTo: self.
! !

!Investment methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 21:05:34'!
investedLeg
	
	^investedLeg ! !

!Investment methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:51:11'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Investment class' category: #'PortfolioTreePrinter-Ejercicio'!
Investment class
	instanceVariableNames: ''!

!Investment class methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 20:57:15'!
of: anAmount during: aNumberOfDays at: anInterestRate

	^self new initializeFor: anAmount for: aNumberOfDays withRate: anInterestRate! !

!Investment class methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 21:10:02'!
register: aSum during: aTime withRate: aRate on: anAccount

	| investment |
	
	investment := self of: aSum during: aTime at: aRate.
	anAccount register: investment investedLeg.
	anAccount register: investment earningsLeg.
	
	^ investment
! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !



!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!


!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount doesManage: anAccount) or: [ anAccount doesManage: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 10/18/2018 16:31:24'!
transactionsOf: anAccount 

	^ (self doesManage: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!Portfolio class methodsFor: 'assertions' stamp: 'HAW 10/18/2018 16:31:24'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount doesManage: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 10/18/2018 20:20:37'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !



!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:36:57'!
summary

	| xxxx |
	xxxx := OrderedCollection new.
	transactions do: [ :aTransaction |
		(aTransaction  isKindOf: Deposit) ifTrue: [ xxxx add: 'Deposito por ', aTransaction value asString ].
		(aTransaction  isKindOf: TransferDeposit) ifTrue: [ xxxx add: 'Transferencia por ', aTransaction value asString ].
		(aTransaction  isKindOf: TransferWithdraw) ifTrue: [ xxxx add: 'Transferencia por -', aTransaction value asString ].
		(aTransaction  isKindOf: Withdraw) ifTrue: [ xxxx add: 'Extraccion por ', aTransaction value asString ].
		].
	
	^ xxxx! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 't g 10/22/2018 19:55:15'!
transactionsDo: aBlock

	^ self transactions do: aBlock ! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'HAW 10/18/2018 21:08:52'!
initializeOf: anAmount 
	
	value := anAmount.
	depositLeg := TransferDeposit relatedTo: self .
	withdrawLeg := TransferWithdraw relatedTo: self 
	
	! !


!Transfer methodsFor: 'legs' stamp: 'HAW 10/18/2018 20:53:34'!
depositLeg
	
	^depositLeg! !

!Transfer methodsFor: 'legs' stamp: 'HAW 10/18/2018 20:53:26'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 21:08:33'!
value

	^value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'HAW 10/18/2018 21:07:39'!
of: anAmount 

	^self new initializeOf: anAmount ! !


!Transfer class methodsFor: 'registering' stamp: 't g 10/22/2018 19:10:27'!
register: anAmount from: fromAccount to: toAccount 

	| transfer |
	
	transfer := self of: anAmount.
	fromAccount register: transfer withdrawLeg.
	toAccount register: transfer depositLeg.
	
	^transfer! !
