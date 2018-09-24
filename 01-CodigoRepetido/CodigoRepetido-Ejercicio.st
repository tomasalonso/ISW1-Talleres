!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'initialization' stamp: 'TA 9/21/2018 20:35:44'!
setUp
	
	customerBook _ CustomerBook new! !


!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:36:40'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	
	self shouldNotTakeMoreThanMillisecond: 50 thisAction: [customerBook addCustomerNamed: 'John Lennon'].
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:37:09'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self shouldNotTakeMoreThanMillisecond: 100 thisAction: [customerBook removeCustomerNamed: paulMcCartney].
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:37:20'!
test03CanNotAddACustomerWithEmptyName 
	
	self tryTheNextAction: [ customerBook addCustomerNamed: '' ] 
			expectingError: Error 
			andCheck: [:anError | 
				self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:39:19'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self tryTheNextAction: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
	 		expectingError: NotFound
			andCheck: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:37:52'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney|
	.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendOn: customerBook customerCalled: paulMcCartney.
	 
	self onCustomerBook: customerBook checkThatNumberOfActiveCustomersIs: 0 
											     andNumberOfSuspendedCustomersIs: 1 
											     andNumberOfCustomersIs: 1 
											     andCheck: [self assert: (customerBook includesCustomerNamed: paulMcCartney)].
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:38:02'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendOn: customerBook customerCalled: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	 
	self onCustomerBook: customerBook checkThatNumberOfActiveCustomersIs: 0 
											     andNumberOfSuspendedCustomersIs: 0
											     andNumberOfCustomersIs: 0
											     andCheck: [self deny: (customerBook includesCustomerNamed: paulMcCartney)].


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:38:13'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self tryTheNextAction:[ customerBook suspendCustomerNamed: 'Paul McCartney']
			expectingError: CantSuspend 
			andCheck: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]

			! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TA 9/21/2018 20:38:27'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	self addAndSuspendOn: customerBook customerCalled: johnLennon.

	self tryTheNextAction: [ customerBook suspendCustomerNamed: johnLennon ]
			expectingError: CantSuspend 
			andCheck:[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]

	! !


!CustomerBookTest methodsFor: 'auxiliaresDeTests' stamp: 'TA 9/21/2018 20:20:22'!
addAndSuspendOn: aCustomerBook customerCalled: aName
	
	aCustomerBook addCustomerNamed: aName.
	aCustomerBook suspendCustomerNamed: aName.
	

	
! !

!CustomerBookTest methodsFor: 'auxiliaresDeTests' stamp: 'TA 9/21/2018 20:24:42'!
onCustomerBook: aCustomerBook checkThatNumberOfActiveCustomersIs: aNumberOfActiveCustomers 
										    andNumberOfSuspendedCustomersIs: aNumberOfSuspendedCustomers 
										    andNumberOfCustomersIs: aNumberOfCustomers andCheck: aBlockOfAssertions


	
	self assert: aNumberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: aNumberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: aNumberOfCustomers equals: aCustomerBook numberOfCustomers.
	
	aBlockOfAssertions  value.
	

	
! !

!CustomerBookTest methodsFor: 'auxiliaresDeTests' stamp: 't g 9/20/2018 21:48:00'!
shouldNotTakeMoreThanMillisecond: aTime thisAction: aBlock	
	
	| millisecondsAfterRunning millisecondsBeforeRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTime * millisecond)
	
! !

!CustomerBookTest methodsFor: 'auxiliaresDeTests' stamp: 't g 9/20/2018 21:32:12'!
thisActions: aBlock checksWithValues: aListOfValues

	| customerBook paulMcCartney |
	aBlock value.
	
	self assert: (aListOfValues at: 1) equals: customerBook numberOfActiveCustomers.
	self assert: (aListOfValues at: 2) equals: customerBook numberOfSuspendedCustomers.
	self assert: (aListOfValues at: 1) equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'auxiliaresDeTests' stamp: 't g 9/20/2018 21:57:59'!
tryTheNextAction: aBlock expectingError: anError andCheck: anAssertionBlock

		[ aBlock value. self fail ]
		on: anError
		do: anAssertionBlock ! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers suspended aName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:28'!
includesCustomerNamed: aName

	^(customers includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:38'!
isEmpty
	
	^customers isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NicolasRinaldi 9/16/2018 21:55:33'!
initialize

	super initialize.
	customers := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'HAW 9/19/2018 08:41:11'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((customers includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:57'!
numberOfActiveCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NicolasRinaldi 9/16/2018 22:01:43'!
numberOfCustomers
	
	^customers size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'TA 9/21/2018 21:25:23'!
removeCustomerNamed: aName 
	
	customers remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^ NotFound signal]].		
	^aName.

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:27:55'!
suspendCustomerNamed: aName 
	
	(customers includes: aName) ifFalse: [^CantSuspend signal].
	
	customers remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'Auxiliares' stamp: 'TA 9/21/2018 21:11:17'!
findCustomer: aName andRemoveCustomerFrom: aCollectionOfCustomers

	1 to: aCollectionOfCustomers size do: 	
		[ :index |
			aName = (aCollectionOfCustomers at: index)
				ifTrue: [
					aCollectionOfCustomers removeAt: index.
					
					^ aName.
		].
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
