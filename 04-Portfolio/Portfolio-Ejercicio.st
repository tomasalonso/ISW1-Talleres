!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'auxiliar' stamp: 't g 10/11/2018 21:25:59'!
valueForBalance

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'auxiliar' stamp: 't g 10/11/2018 21:26:13'!
valueForBalance

	^ value * -1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #SummarizingAccount category: #'Portfolio-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'balance' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'accounts' stamp: 'T 10/18/2018 12:53:23'!
accounts

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 't g 10/11/2018 21:31:33'!
balance

	^ accounts sum: [:anAccount | anAccount balance ] ifEmpty: [0].! !


!Portfolio methodsFor: 'testing' stamp: 'TA 10/18/2018 14:15:25'!
doesManage: anAccount

	^ self = anAccount or: (self on: accounts existsOneThat:  [ :anOwnAccount | anOwnAccount doesManage: anAccount]).
	
	! !

!Portfolio methodsFor: 'testing' stamp: 'TA 10/18/2018 14:15:18'!
hasRegistered: aTransaction

	^self on: accounts existsOneThat: [ :anAccount | anAccount hasRegistered: aTransaction].
	! !


!Portfolio methodsFor: 'transactions' stamp: 't g 10/11/2018 21:59:22'!
transactions 

	| transactions |
	
	transactions  := OrderedCollection new.
	accounts do: [ :anAccount | transactions addAll: anAccount transactions ].
	
	^ transactions! !

!Portfolio methodsFor: 'transactions' stamp: 'TA 10/18/2018 12:56:00'!
transactionsOf: anAccount 
	
	(self doesManage: anAccount) ifTrue: [^ anAccount transactions].
	
	^self error: self class accountNotManagedMessageDescription! !


!Portfolio methodsFor: 'initialization' stamp: 't g 10/11/2018 21:35:27'!
initializeWith: aCollectionOfAccounts

	accounts := aCollectionOfAccounts! !


!Portfolio methodsFor: 'auxiliar' stamp: 'TA 10/18/2018 14:08:26'!
on: aCollectionOfAccounts existsOneThat: aBlockClosure

	^ (aCollectionOfAccounts allSatisfy: [ :anAccount | (aBlockClosure value: anAccount) not ]) not.! !


!Portfolio methodsFor: 'accounts' stamp: 'TA 10/18/2018 12:52:20'!
accounts

	|aux|
		
	aux := Set new.
	
	accounts do: [:anAccount | aux addAll: anAccount accounts].
	
	^aux! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 't g 10/11/2018 21:33:56'!
with: leftAccount with: rightAccount

	^self withAll: (OrderedCollection with: leftAccount  with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'TA 10/18/2018 13:09:17'!
withAll: aCollectionOfAccounts
	|allAccounts|
		
	allAccounts := Bag new.
	aCollectionOfAccounts do: [:anAccount | allAccounts addAll: anAccount accounts].
	(allAccounts allSatisfy: [:anAccount | (allAccounts occurrencesOf: anAccount) = 1 ]) ifTrue: [^ self new initializeWith: aCollectionOfAccounts].
	
	^self error: Portfolio accountAlreadyManagedErrorMessage! !


!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:43'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:53'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'TA 10/18/2018 14:15:07'!
balance

	 ^ transactions inject: 0 into: [:sum :aTransaction | sum + aTransaction valueForBalance].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 't g 10/11/2018 21:52:33'!
doesManage: anAccount

	^ self = anAccount
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'accounts' stamp: 'TA 10/18/2018 12:50:01'!
accounts

	^Set with: self.! !
