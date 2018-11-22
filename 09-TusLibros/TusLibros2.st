!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'support' stamp: 'TA 11/22/2018 16:22:38'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!TusLibrosTest methodsFor: 'support' stamp: 'TA 11/22/2018 16:22:23'!
createVariedCart

	| cart |
	cart := Cart acceptingItemsOf: self defaultCatalog.
	cart add: 2 of: self itemSellByTheStore.
	cart add: 1 of: self otherItemSoldByTheStore.
	
	^cart
	
	! !

!TusLibrosTest methodsFor: 'support' stamp: 'A T G 11/15/2018 21:28:09'!
defaultCatalog
	
	| catalog |
	
	catalog := Dictionary new.
	catalog add: self itemSellByTheStore -> 10;
		add: self otherItemSoldByTheStore -> 20.
	
	^ catalog! !

!TusLibrosTest methodsFor: 'support' stamp: 'A T G 11/15/2018 19:08:31'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!TusLibrosTest methodsFor: 'support' stamp: 'A T G 11/15/2018 19:08:29'!
itemSellByTheStore
	
	^ 'validBook'! !

!TusLibrosTest methodsFor: 'support' stamp: 'A T G 11/15/2018 21:02:59'!
otherItemSoldByTheStore
	
	^ 'otherValidBook'! !


!classDefinition: #CartTest category: #TusLibros!
TusLibrosTest subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'TA 11/22/2018 12:52:30'!
test09CartCanDoOnTheirBooks

	| cart books |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.

	books := OrderedCollection new.
	
	cart do: [:aBook | books add: aBook].
	
	self assert: (books at: 1) equals: self itemSellByTheStore.
	self assert: (books at: 2) equals: self itemSellByTheStore.
	! !


!classDefinition: #CashierTest category: #TusLibros!
TusLibrosTest subclass: #CashierTest
	instanceVariableNames: 'debitBlock debited salesBook cashier cart card date'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:02'!
test01CashierCanNotCheckoutAnEmptyCartAndDoesNotModifySalesBook

	debited := false.
	
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	cart := self createCart.
	card := self createCard.
	date := self createDate.
	debitBlock := [:aCard :aSum | debited := true].
	
	self 
		should: [ cashier checkout: cart payWith: card onDate: date]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotCheckoutAnEmptyCart.
			self assert: cart isEmpty.
			self assert: salesBook isEmpty.
			self assert: debited equals: false
].! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:25:57'!
test02CashierChecksOutACartWithOneBookWithFixedPriceAndRegisterInSalesBook
	
	debited := false.
	
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	
	cart := self createCart.
	cart add: 1 of: self itemSellByTheStore.
	
	card := self createCard.
	date := self createDate.
	debitBlock := [:aCard :aSum | debited := true].

	self assert: (cashier checkout: cart payWith: card onDate: date) equals: cart price.

	self assert: (salesBook at: 1) equals: self itemSellByTheStore.
	self assert: salesBook size equals: 1.
	self assert: debited equals: true.! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:05'!
test03CashierChecksOutACartWithEqualsBooksWithFixedPricesAndRegisterInSalesBook

	debited := false.
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.

	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.

	card := self createCard.
	date := self createDate.
	
	debitBlock := [:aCard :aSum | debited := true].
	
	self assert: (cashier checkout: cart payWith: card onDate: date) equals: cart price.
	
	self assert: (salesBook at: 1) equals: self itemSellByTheStore.
	self assert: (salesBook at: 2) equals: self itemSellByTheStore.
	self assert: salesBook size equals: 2.
	self assert: debited equals: true.! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:10'!
test04CashierChecksOutACartWithDifferentBooksWithDifferentPricesAndRegisterInSalesBook
	
	debited := false.
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	
	cart := self createVariedCart.
	card := self createCard.
	date := self createDate.
	debitBlock := [:aCard :aSum | debited := true].
	
	self assert: (cashier checkout: cart payWith: card onDate: date) equals: cart price.
	
	self assert: (self itemSellByTheStore) equals: (salesBook at: 1).
	self assert: (self itemSellByTheStore) equals: (salesBook at: 2).
	self assert: (self otherItemSoldByTheStore) equals: (salesBook at: 3).
	self assert: salesBook size equals:3.
	self assert: debited equals: true.! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:13'!
test05CashierChecksThatCardClientNameIsLessThan30CharactersLong

	debited := false.
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	cart := self createVariedCart.
	card := self createInvalidCard.
	date := self createDate.
	
	debitBlock := [:aCard :aSum | debited := true].

	self should: [cashier checkout: cart payWith: card onDate: date]
			raise: Error
			withExceptionDo: [:anError | self assert: anError messageText equals: Cashier cardsClientNameHasMoreThan30Characters].
	
	self assert: salesBook isEmpty.
	self assert: debited equals: false.! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:17'!
test06CashierChecksThatCardIsNotExpired

	debited := false.
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	cart := self createVariedCart.
	card := self createCard.
	date := self createDateExpired.
	
	debitBlock := [:aCard :aSum | debited := true].
	
	self should: [cashier checkout: cart payWith: card onDate: date]
			raise: Error
			withExceptionDo: [:anError | self assert: anError messageText equals: Cashier cardIsExpired].
	
	self assert: salesBook isEmpty.
	self assert: debited equals: false.! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:21'!
test07CashierCheckoutsACartButMerchantProcessorRejectsTheCard

	| cardFunds |
	card := self createCardWithNoFunds.
	
	debited := false.
	cardFunds := 100.
	
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	cart := self createVariedCart.
	date := self createDate.
	
	debitBlock := [:aCard :aSum | (self assertCardHasFunds: aCard) ifFalse: [self error: self accountHasNoFunds].
		cardFunds := cardFunds - aSum.
		debited := true].
	
	self should: [cashier checkout: cart payWith: card onDate: date]
			raise: Error
			withExceptionDo: [:anError | 
				self assert: anError messageText equals: self accountHasNoFunds.
				self assert: debited equals: false.
				self assert: cardFunds equals: 100.			
				self assert: salesBook isEmpty.
			].
! !

!CashierTest methodsFor: 'tests' stamp: 'TA 11/22/2018 16:26:26'!
test08CashierCheckoutsACartAndSuccesfullyDebitsWithACard
	
	| cardFunds |
	
	debited := false.
	cardFunds := 100.
	
	salesBook := self createSalesBook.
	cashier := self createCashier: salesBook.
	cart := self createVariedCart.
	card := self createCard.
	date := self createDate.
	
	debitBlock := [:aCard :aSum | (self assertCardHasFunds: aCard) ifFalse: [self error: self accountHasNoFunds].
		cardFunds := cardFunds - aSum.
		debited := true].
	
	self assert: (cashier checkout: cart payWith: card onDate: date) equals: (cart price).
	self assert: cardFunds  equals: 100 - cart price.
	self assert: debited equals: true.
	! !


!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 14:08:49'!
createCard

	^ Card for: 'pepe' numbered: '12345678' andExpiration: (GregorianMonthOfYear year: 2020 month: December)
! !

!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 15:18:03'!
createCardWithNoFunds

	^ Card for: 'carlos' numbered: '99991111' andExpiration: (GregorianMonthOfYear year: 2020 month: December)
! !

!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 15:03:04'!
createCashier: aSalesBook

	^ Cashier for: aSalesBook withMerchantProcessor: self.! !

!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 14:38:27'!
createDate

	^GregorianMonthOfYear year: 2018 month: December.
	
! !

!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 14:38:19'!
createDateExpired

	^GregorianMonthOfYear year: 2021 month: December.
	
! !

!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 14:14:18'!
createInvalidCard

	^ Card for: 'pepepepepepepepepepepepepepepepepepepepepepepepepepepepepepepepe
	pepepepepepepepepepepepepepepepepepepepepepepepe' numbered: '12345678' andExpiration: (GregorianMonthOfYear year: 2020 month: December)
! !

!CashierTest methodsFor: 'support' stamp: 'TA 11/22/2018 15:01:12'!
createSalesBook

	^ OrderedCollection new.! !


!CashierTest methodsFor: 'merchant processor' stamp: 'TA 11/22/2018 15:24:35'!
accountHasNoFunds

	^'The account has no funds to pay'! !

!CashierTest methodsFor: 'merchant processor' stamp: 'TA 11/22/2018 15:22:56'!
assertCardHasFunds: aCard

	^(aCard client = 'carlos') not.! !

!CashierTest methodsFor: 'merchant processor' stamp: 'TA 11/22/2018 15:53:14'!
debit: aSum from: aCard

	debitBlock value: aCard value: aSum.
	! !


!classDefinition: #Card category: #TusLibros!
Object subclass: #Card
	instanceVariableNames: 'clientName number expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Card methodsFor: 'accessing' stamp: 'TA 11/22/2018 14:11:46'!
client

	^clientName ! !

!Card methodsFor: 'accessing' stamp: 'TA 11/22/2018 14:11:57'!
number

	^number ! !


!Card methodsFor: 'initialization' stamp: 'TA 11/22/2018 14:11:26'!
initializeFor: aName numbered: aNumber andExpiration: aMonthOfYear 

	clientName := aName.
	number := aNumber.
	expirationDate := aMonthOfYear.
	
	! !


!Card methodsFor: 'testing' stamp: 'TA 11/22/2018 14:47:22'!
isExpired: aDate

	^expirationDate < aDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #TusLibros!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'instance creation' stamp: 'TA 11/22/2018 14:10:33'!
for: aName numbered: aNumber andExpiration: aMonthOfYear

	^self new initializeFor: aName numbered: aNumber andExpiration: aMonthOfYear ! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'A T G 11/15/2018 21:28:40'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'TA 11/22/2018 12:49:54'!
price

	^items inject: 0 into: [:aSum :aBook | aSum + catalog at: aBook].! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'enumerating' stamp: 'A T G 11/15/2018 20:39:47'!
do: aBlock

	^ items do: aBlock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook cardDebitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'assertions' stamp: 'TA 11/22/2018 14:47:50'!
assertCardExpired: aCard onDate: aDate

	^ aCard isExpired: aDate.! !

!Cashier methodsFor: 'assertions' stamp: 'TA 11/22/2018 14:34:09'!
assertCardNameIsValid: aCard

	^aCard client size <= 30.! !

!Cashier methodsFor: 'assertions' stamp: 'A T G 11/15/2018 19:16:32'!
assertCartIsEmpty: aCart

	^ aCart isEmpty! !


!Cashier methodsFor: 'initialization' stamp: 'TA 11/22/2018 16:08:54'!
initializeFor: aSalesBook withMerchantProcessor: aMerchantProcessor

	salesBook := aSalesBook.
	cardDebitor := aMerchantProcessor .
	! !


!Cashier methodsFor: 'transaction' stamp: 'TA 11/22/2018 16:08:53'!
checkout: aCart payWith: aCard onDate: aDate

	(self assertCartIsEmpty: aCart) ifTrue: [self error: self class canNotCheckoutAnEmptyCart. ].
	(self assertCardNameIsValid: aCard) ifFalse: [self error: self class cardsClientNameHasMoreThan30Characters].
	(self assertCardExpired: aCard onDate: aDate) ifTrue: [self error: self class cardIsExpired].
	
	cardDebitor debit: aCart price from: aCard.
	
	aCart do: [ :aBook | salesBook add: aBook ].

	^ aCart price.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'A T G 11/15/2018 19:06:13'!
canNotCheckoutAnEmptyCart

	^ 'Can not checkout an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'TA 11/22/2018 14:36:39'!
cardIsExpired

	^ 'The card is expired'! !

!Cashier class methodsFor: 'error messages' stamp: 'TA 11/22/2018 14:03:28'!
cardsClientNameHasMoreThan30Characters

	^ 'cards client name has more than thirty characters'! !


!Cashier class methodsFor: 'instance creation' stamp: 'TA 11/22/2018 15:03:59'!
for: aSalesBook withMerchantProcessor: aMerchantProcessor


	^ self new initializeFor: aSalesBook withMerchantProcessor: aMerchantProcessor.! !
