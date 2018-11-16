!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'support' stamp: 'A T G 11/15/2018 19:08:12'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

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

!CartTest methodsFor: 'tests' stamp: 'A T G 11/15/2018 20:24:25'!
test09CartCanInjectTheirBooks

	| cart books |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.

	books := cart
		inject: OrderedCollection new
		into: [ :aCollection :aBook | aCollection add: aBook. aCollection ].
	
	self assert: (books at: 1) equals: self itemSellByTheStore.
	self assert: (books at: 2) equals: self itemSellByTheStore.
	! !


!classDefinition: #CashierTest category: #TusLibros!
TusLibrosTest subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'A T G 11/15/2018 20:57:42'!
test01CashierCanNotCheckoutAnEmptyCartAndDoesNotModifySalesBook

	| cashier card cart salesBook |

	salesBook := OrderedCollection new.
	cashier := Cashier for: salesBook.
	cart := self createCart.
	card := self createCard.

	self 
		should: [ cashier checkout: cart payWith: card ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotCheckoutAnEmptyCart.
			self assert: cart isEmpty.
			self assert: salesBook isEmpty.
		].! !

!CashierTest methodsFor: 'tests' stamp: 'A T G 11/15/2018 20:59:11'!
test02CashierChecksOutACartWithOneBookWithFixedPriceAndRegisterInSalesBook

	| cashier card cart price salesBook |

	salesBook := OrderedCollection new.
	cashier := Cashier for: salesBook.
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	
	card := self createCard.

	price := 10.

	self assert: (cashier checkout: cart payWith: card) equals: price.

	self assert: (salesBook at: 1) equals: self itemSellByTheStore.
	self assert: salesBook size equals: 1.! !

!CashierTest methodsFor: 'tests' stamp: 'A T G 11/15/2018 20:59:24'!
test03CashierChecksOutACartWithEqualsBooksWithFixedPricesAndRegisterInSalesBook

	| cashier card cart price salesBook |

	salesBook := OrderedCollection new.
	cashier := Cashier for: salesBook.

	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.

	card := self createCard.

	price := 10.

	self assert: (cashier checkout: cart payWith: card) equals: (2*price).
	
	self assert: (salesBook at: 1) equals: self itemSellByTheStore.
	self assert: (salesBook at: 2) equals: self itemSellByTheStore.
	self assert: salesBook size equals: 2.! !

!CashierTest methodsFor: 'tests' stamp: 'A T G 11/15/2018 20:59:31'!
test04CashierChecksOutACartWithDifferentBooksWithFixedPricesAndRegisterInSalesBook

	| cashier card cart price1 price2 register |

	cashier := Cashier new.
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.

	card := self createCard.

	price1 := 10.
	price2 := 20.
	
	self assert: (cashier checkout: cart payWith: card) equals: (2*price1).
	
	register _ cashier register.
	
	self assert: (self itemSellByTheStore) equals: register nextLine.
	self assert: register atEnd.! !


!CashierTest methodsFor: 'support' stamp: 'A T G 11/15/2018 19:35:03'!
createCard

	^ Object new! !


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

!Cart methodsFor: 'enumerating' stamp: 'A T G 11/15/2018 19:42:21'!
inject: thisValue into: aBlock

	^ items inject: thisValue into: aBlock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'A T G 11/15/2018 19:16:32'!
assertCartIsEmpty: aCart

	^ aCart isEmpty! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'A T G 11/15/2018 20:54:13'!
checkout: aCart payWith: aCard

	(self assertCartIsEmpty: aCart) ifTrue: [self error: self class canNotCheckoutAnEmptyCart. ].

	aCart do: [ :aBook | salesBook add: aBook ].

	^ aCart inject: 0 into: [ :sum :aBook | sum + 10 ].! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'A T G 11/15/2018 20:53:09'!
initializeFor: aSalesBook

	salesBook := aSalesBook.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'A T G 11/15/2018 19:06:13'!
canNotCheckoutAnEmptyCart

	^ 'Can not checkout an empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'A T G 11/15/2018 20:52:47'!
for: aSalesBook

	^ self new initializeFor: aSalesBook.! !
