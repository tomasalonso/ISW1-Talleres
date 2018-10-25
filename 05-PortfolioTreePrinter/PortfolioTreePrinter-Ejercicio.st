!classDefinition: #AccountInvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountInvestmentEarnings
	instanceVariableNames: 'earnings accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentEarnings methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:04:50'!
visitDeposit: aDeposit

! !

!AccountInvestmentEarnings methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:05:03'!
visitInvestmentDeposit: anInvestment

	! !

!AccountInvestmentEarnings methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:22:52'!
visitInvestmentEarnings: anInvestment

earnings := earnings + (anInvestment value*(anInvestment rate/360)*anInvestment time) 
		! !

!AccountInvestmentEarnings methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:08:34'!
visitTransferDeposit: aTransferDeposit
! !

!AccountInvestmentEarnings methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:05:19'!
visitTransferWithdraw: aTransferWithdraw

	! !

!AccountInvestmentEarnings methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:05:24'!
visitWithdraw: aWithdraw! !


!AccountInvestmentEarnings methodsFor: 'evaluating' stamp: 'TA 10/23/2018 17:04:39'!
value

	earnings := 0.
	
	accounts transactionsDo: [ :aTransaction | aTransaction accept: self ].
	
	^ earnings ! !


!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'TA 10/23/2018 17:04:22'!
initializeWith: aReceptiveAccount

	accounts := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestmentEarnings class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestmentEarnings class
	instanceVariableNames: ''!

!AccountInvestmentEarnings class methodsFor: 'instance creation' stamp: 'TA 10/23/2018 17:04:12'!
of: aReceptiveAccount

	^ self new initializeWith: aReceptiveAccount ! !


!classDefinition: #AccountInvestmentNet category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountInvestmentNet
	instanceVariableNames: 'net accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:34:51'!
visitDeposit: aDeposit

! !

!AccountInvestmentNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:35:42'!
visitInvestmentDeposit: anInvestment

	net := net + anInvestment value! !

!AccountInvestmentNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:35:51'!
visitInvestmentEarnings: anInvestment! !

!AccountInvestmentNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:34:58'!
visitTransferDeposit: aTransferDeposit

! !

!AccountInvestmentNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:35:08'!
visitTransferWithdraw: aTransferWithdraw

	! !

!AccountInvestmentNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:35:12'!
visitWithdraw: aWithdraw! !


!AccountInvestmentNet methodsFor: 'evaluating' stamp: 'TA 10/23/2018 16:24:08'!
value

	net := 0.
	
	accounts transactionsDo: [ :aTransaction | aTransaction accept: self ].
	
	^ net! !


!AccountInvestmentNet methodsFor: 'initialization' stamp: 'TA 10/23/2018 16:24:52'!
initializeWith: aReceptiveAccount

	accounts := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestmentNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestmentNet class
	instanceVariableNames: ''!

!AccountInvestmentNet class methodsFor: 'instance creation' stamp: 'TA 10/23/2018 16:24:31'!
of: aReceptiveAccount

	^ self new initializeWith: aReceptiveAccount ! !


!classDefinition: #AccountSummaryLines category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountSummaryLines
	instanceVariableNames: 'accounts lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryLines methodsFor: 'visiting' stamp: 't g 10/22/2018 19:54:31'!
visitDeposit: aDeposit

	lines add: 'Deposito por ', aDeposit value asString! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:23:45'!
visitInvestmentDeposit: anInvestment

		lines add: 'Plazo fijo por ', anInvestment value asString, ' durante ', 
		anInvestment time asString, ' dias a una tna de ', (anInvestment rate *100) asString, '%'! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 'TA 10/23/2018 17:14:17'!
visitInvestmentEarnings: anInvestment


! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 't g 10/22/2018 19:54:22'!
visitTransferDeposit: aTransferDeposit

	lines add: 'Transferencia por ', aTransferDeposit value asString! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 't g 10/22/2018 19:54:17'!
visitTransferWithdraw: aTransferWithdraw

	lines add: 'Transferencia por -', aTransferWithdraw value asString! !

!AccountSummaryLines methodsFor: 'visiting' stamp: 't g 10/22/2018 19:54:10'!
visitWithdraw: aWithdraw

	lines add: 'Extraccion por ', aWithdraw value asString! !


!AccountSummaryLines methodsFor: 'initialization' stamp: 't g 10/22/2018 19:42:56'!
initializeWith: aReceptiveAccount

	accounts := aReceptiveAccount ! !


!AccountSummaryLines methodsFor: 'evaluating' stamp: 't g 10/22/2018 19:54:49'!
value

	lines := OrderedCollection new.
	
	accounts transactionsDo: [ :aTransaction | aTransaction accept: self ].
	
	^ lines! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryLines class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummaryLines class
	instanceVariableNames: ''!

!AccountSummaryLines class methodsFor: 'instance creation' stamp: 't g 10/22/2018 19:42:35'!
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


!Deposit methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 20:37:28'!
affectBalance: currentBalance  

	^currentBalance + self value! !

!Deposit methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'visitors' stamp: 't g 10/22/2018 19:45:31'!
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
	instanceVariableNames: 'investment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentLeg methodsFor: 'evaluating' stamp: 't g 10/22/2018 20:52:13'!
affectBalance: currentBalance  

	self subclassResponsibility! !

!InvestmentLeg methodsFor: 'evaluating' stamp: 'TA 10/23/2018 17:22:31'!
rate

	^investment rate! !

!InvestmentLeg methodsFor: 'evaluating' stamp: 'TA 10/23/2018 17:22:28'!
time

	^investment time! !

!InvestmentLeg methodsFor: 'evaluating' stamp: 'TA 10/23/2018 16:20:34'!
value

	^investment value! !


!InvestmentLeg methodsFor: 'initialization' stamp: 'TA 10/23/2018 16:17:07'!
initializeRelatedTo: anInvestment 
	
	investment := anInvestment ! !


!InvestmentLeg methodsFor: 'investment' stamp: 'TA 10/23/2018 16:21:01'!
investment

	^investment! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentLeg class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentLeg class
	instanceVariableNames: ''!

!InvestmentLeg class methodsFor: 'instance creation' stamp: 'TA 10/23/2018 16:16:39'!
relatedTo: anInvestment
	
	^self new initializeRelatedTo: anInvestment ! !


!classDefinition: #InvestmentDeposit category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentLeg subclass: #InvestmentDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentDeposit methodsFor: 'visitors' stamp: 'TA 10/23/2018 16:45:28'!
accept: aVisitor

	aVisitor visitInvestmentDeposit: self! !


!InvestmentDeposit methodsFor: 'evaluating' stamp: 't g 10/22/2018 20:51:51'!
affectBalance: currentBalance  

	^ currentBalance - self value! !


!classDefinition: #InvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentLeg subclass: #InvestmentEarnings
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarnings methodsFor: 'evaluating' stamp: 'TA 10/23/2018 16:49:43'!
affectBalance: currentBalance  

	^ currentBalance 
! !


!InvestmentEarnings methodsFor: 'visitors' stamp: 'TA 10/23/2018 17:10:51'!
accept: aVisitor

	aVisitor visitInvestmentEarnings: self! !


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


!TransferLeg methodsFor: 'visitors' stamp: 't g 10/22/2018 19:52:45'!
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


!TransferDeposit methodsFor: 'visitors' stamp: 't g 10/22/2018 19:52:02'!
accept: aVisitor

	aVisitor visitTransferDeposit: self! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'evaluating' stamp: 't g 10/18/2018 21:31:51'!
affectBalance: currentBalance

	^ currentBalance - self value! !


!TransferWithdraw methodsFor: 'visitors' stamp: 't g 10/22/2018 19:52:13'!
accept: aVisitor

	aVisitor visitTransferWithdraw: self! !


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


!Withdraw methodsFor: 'visitors' stamp: 't g 10/22/2018 19:52:33'!
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

!AccountTransferNet methodsFor: 'visiting' stamp: 't g 10/22/2018 20:12:29'!
visitDeposit: aDeposit

! !

!AccountTransferNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:27:05'!
visitInvestmentDeposit: anInvestment! !

!AccountTransferNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:27:12'!
visitInvestmentEarnings: anInvestment! !

!AccountTransferNet methodsFor: 'visiting' stamp: 't g 10/22/2018 20:12:47'!
visitTransferDeposit: aTransferDeposit

	net := net + aTransferDeposit value ! !

!AccountTransferNet methodsFor: 'visiting' stamp: 'TA 10/23/2018 16:35:07'!
visitTransferWithdraw: aTransferWithdraw

	net := net - aTransferWithdraw value! !

!AccountTransferNet methodsFor: 'visiting' stamp: 't g 10/22/2018 20:13:53'!
visitWithdraw: aWithdraw! !


!AccountTransferNet methodsFor: 'evaluating' stamp: 't g 10/22/2018 20:11:08'!
value

	net := 0.
	
	accounts transactionsDo: [ :aTransaction | aTransaction accept: self ].
	
	^ net! !


!AccountTransferNet methodsFor: 'initialization' stamp: 't g 10/22/2018 20:03:34'!
initializeWith: aReceptiveAccount

	accounts := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'instance creation' stamp: 't g 10/22/2018 20:03:18'!
of: aReceptiveAccount

	^ self new initializeWith: aReceptiveAccount ! !


!classDefinition: #Investment category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Investment
	instanceVariableNames: 'value time rate investedLeg earningsLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Investment methodsFor: 'evaluating' stamp: 'TA 10/23/2018 17:07:49'!
rate

	^rate! !

!Investment methodsFor: 'evaluating' stamp: 'TA 10/23/2018 17:07:43'!
time

	^time! !

!Investment methodsFor: 'evaluating' stamp: 't g 10/22/2018 20:51:11'!
value

	^ value! !


!Investment methodsFor: 'legs' stamp: 't g 10/22/2018 21:05:58'!
earningsLeg
	
	^earningsLeg ! !

!Investment methodsFor: 'legs' stamp: 't g 10/22/2018 21:05:34'!
investedLeg
	
	^investedLeg ! !


!Investment methodsFor: 'initialization' stamp: 't g 10/22/2018 20:51:00'!
initializeFor: aSum for: aTime withRate: aRate

	value := aSum.
	time := aTime.
	rate := aRate.
	investedLeg := InvestmentDeposit relatedTo: self .
	earningsLeg := InvestmentEarnings relatedTo: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Investment class' category: #'PortfolioTreePrinter-Ejercicio'!
Investment class
	instanceVariableNames: ''!

!Investment class methodsFor: 'registering' stamp: 'TA 10/23/2018 16:08:48'!
register: aSum during: aTime withRate: aRate on: anAccount

	| investment |
	
	investment := self of: aSum during: aTime at: aRate.  "aca no se puede llamar directo al initialize?"
	anAccount register: investment investedLeg.
	anAccount register: investment earningsLeg.
	
	^ investment
! !


!Investment class methodsFor: 'instance creation' stamp: 't g 10/22/2018 20:57:15'!
of: anAmount during: aNumberOfDays at: anInterestRate

	^self new initializeFor: anAmount for: aNumberOfDays withRate: anInterestRate! !


!classDefinition: #PortfolioTree category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #PortfolioTree
	instanceVariableNames: 'spaces portfolio dictionary lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTree methodsFor: 'visiting' stamp: 'TA 10/25/2018 15:06:55'!
visitPortfolio: aPortfolio

	| whiteSpace |
	
	whiteSpace := (String new: spaces) atAllPut: $ .
	
	lines add: whiteSpace, (dictionary at: aPortfolio).
	
	spaces := spaces + 1.
	aPortfolio accountsDo: [ :anAccount | anAccount accept: self ].
	spaces:= spaces - 1.
	! !

!PortfolioTree methodsFor: 'visiting' stamp: 'TA 10/25/2018 15:06:52'!
visitReceptiveAccount: anAccount

	| whiteSpace |
	
	whiteSpace := (String new: spaces) atAllPut: $ .
	
	lines add: whiteSpace, (dictionary  at: anAccount).
	! !


!PortfolioTree methodsFor: 'evaluating' stamp: 'TA 10/25/2018 14:51:05'!
value

	lines := OrderedCollection new.
	
	lines add: (dictionary  at: portfolio).
	
	portfolio accountsDo: [ :anAccount | anAccount accept: self ].
	
	^ lines! !


!PortfolioTree methodsFor: 'initialization' stamp: 'TA 10/25/2018 15:05:31'!
initializeWith: aPortfolio namingWith: aDictionary 
	
	portfolio := aPortfolio. 
	dictionary := aDictionary.
	spaces := 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTree class' category: #'PortfolioTreePrinter-Ejercicio'!
PortfolioTree class
	instanceVariableNames: ''!

!PortfolioTree class methodsFor: 'instance creation' stamp: 'TA 10/25/2018 14:34:34'!
of: aPortfolio namingAccountWith: aDictionary

	^self new initializeWith: aPortfolio namingWith: aDictionary 
	! !


!classDefinition: #ReversePortfolioTree category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #ReversePortfolioTree
	instanceVariableNames: 'spaces portfolio dictionary lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReversePortfolioTree methodsFor: 'visiting' stamp: 'TA 10/25/2018 15:16:36'!
visitPortfolio: aPortfolio

	| whiteSpace |

	spaces := spaces + 1.
	aPortfolio reverseAccountsDo: [ :anAccount | anAccount accept: self ].
	spaces:= spaces - 1.
	
	whiteSpace := (String new: spaces) atAllPut: $ .
	lines add: whiteSpace, (dictionary at: aPortfolio).
	
	! !

!ReversePortfolioTree methodsFor: 'visiting' stamp: 'TA 10/25/2018 15:16:28'!
visitReceptiveAccount: anAccount

	| whiteSpace |
	
	whiteSpace := (String new: spaces) atAllPut: $ .
	
	lines add: whiteSpace, (dictionary  at: anAccount).
	! !


!ReversePortfolioTree methodsFor: 'initialization' stamp: 'TA 10/25/2018 15:15:28'!
initializeWith: aPortfolio namingWith: aDictionary 
	
	portfolio := aPortfolio. 
	dictionary := aDictionary.
	spaces := 1.! !


!ReversePortfolioTree methodsFor: 'evaluating' stamp: 'TA 10/25/2018 15:17:34'!
value

	lines := OrderedCollection new.
	
	portfolio reverseAccountsDo: [ :anAccount | anAccount accept: self ].
	
	lines add: (dictionary  at: portfolio).
	
	^ lines! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReversePortfolioTree class' category: #'PortfolioTreePrinter-Ejercicio'!
ReversePortfolioTree class
	instanceVariableNames: ''!

!ReversePortfolioTree class methodsFor: 'instance creation' stamp: 'TA 10/25/2018 15:15:19'!
of: aPortfolio namingAccountWith: aDictionary

	^self new initializeWith: aPortfolio namingWith: aDictionary 
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


!Portfolio methodsFor: 'accounts' stamp: 'TA 10/25/2018 14:45:26'!
accountsDo: aBlock

	^ accounts do: aBlock ! !

!Portfolio methodsFor: 'accounts' stamp: 'TA 10/25/2018 15:16:53'!
reverseAccountsDo: aBlock

	^ accounts reverse do: aBlock ! !


!Portfolio methodsFor: 'visitors' stamp: 'TA 10/25/2018 14:39:48'!
accept: aVisitor

	aVisitor visitPortfolio: self! !

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

!ReceptiveAccount methodsFor: 'transactions' stamp: 't g 10/22/2018 19:55:15'!
transactionsDo: aBlock

	^ self transactions do: aBlock ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !



!ReceptiveAccount methodsFor: 'visitors' stamp: 'TA 10/25/2018 14:40:22'!
accept: aVisitor

	aVisitor visitReceptiveAccount: self! !


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
