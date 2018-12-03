!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:28:57'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook 
			for: testObjectsFactory validClient.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:54:18'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new
		for: testObjectsFactory validClient.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:29:22'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook
				for: testObjectsFactory validClient ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:54:27'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook
		for: testObjectsFactory validClient.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:54:31'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook
		for: testObjectsFactory validClient.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:29:35'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook
		for: testObjectsFactory validClient.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #RestInterfaceTest category: #TusLibros!
TestCase subclass: #RestInterfaceTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 12:20:21'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'A T G 11/22/2018 21:36:34'!
firstId
	^ 0.! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 12:21:12'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 12:28:34'!
test01_1InterfaceCantCreateACartForAnIncorrectClient

	| tusLibros client password |

	client := 'incorrect'.
	password := 'incorrect'.

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	self
		should: [
			tusLibros createCartFor: client withPassword: password.
			]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibros incorrectClientOrPasswordError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 12:28:34'!
test01_2InterfaceCantCreateACartForAClientWithAnIncorrectPassword

	| tusLibros client password |

	client := testObjectsFactory validClient.
	password := 'incorrect'.

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	self
		should: [
			tusLibros createCartFor: client withPassword: password.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibros incorrectClientOrPasswordError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:03'!
test02InterfaceCanListOneCreatedCartOfAClient

	| tusLibros client password id |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	id := tusLibros createCartFor: client withPassword: password.
	
	self assert: (tusLibros listCart: id) isEmpty.! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:07'!
test03InterfaceCantListInvalidCart

	| tusLibros |

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	self
		should: [
			tusLibros listCart: 0.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibros invalidCartIdError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:11'!
test04InterfaceCanListCreatedCarts

	| tusLibros client password id1 id2 |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	id1 := tusLibros createCartFor: client withPassword: password.
	id2 := tusLibros createCartFor: client withPassword: password.
	
	self assert: (tusLibros listCart: id1) isEmpty.
	self assert: (tusLibros listCart: id2) isEmpty.! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:14'!
test05InterfaceCantAddOnAnInvalidIdCart

	| tusLibros quantity |

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	quantity := 1.
	
	self
		should: [
			tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: 0. 			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibros invalidCartIdError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:18'!
test06InterfaceCantAddAnInvalidBookToCart

	| tusLibros client password id quantity |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	id := tusLibros createCartFor: client withPassword: password.
	quantity := 1.
	
	self
		should: [
			tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemNotSellByTheStore toCart: id.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TusLibros invalidBookISBNError.
			self assert: (tusLibros listCart: id) isEmpty.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:21'!
test07InterfaceCantAddAnInvalidBookQuantityToCart

	| tusLibros client password id quantity |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.

	id := tusLibros createCartFor: client withPassword: password.
	quantity := 0.
	
	self
		should: [
			tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: id.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TusLibros invalidBookQuantityError.
			self assert: (tusLibros listCart: id) isEmpty.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:24'!
test08InterfaceAddsABookToACartAndListsItCorrectly

	| tusLibros client password id quantity cartList |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	id := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: id.
	cartList := tusLibros listCart: id.
	
	self assert: (cartList includes: testObjectsFactory itemSellByTheStore).
	self assert: (cartList occurrencesOf: testObjectsFactory itemSellByTheStore) equals: quantity.! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:18:27'!
test09InterfaceCanAddCarts

	| tusLibros client password cart1 cart2 |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	
	cart1 := tusLibros createCartFor: client withPassword: password.
	cart2 := tusLibros createCartFor: client withPassword: password.
	
	self assert: (tusLibros listCart: cart1) isEmpty.
	self assert: (tusLibros listCart: cart2) isEmpty.! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 14:04:46'!
test10InterfaceCantCheckOutForAnInvalidCart

	| tusLibros cartId |

	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	cartId := 0.
	
	self
		should: [ 
			tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibros invalidCartIdError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 10:19:39'!
test11InterfaceCantCheckOutForAnExpiredCard

	| tusLibros cartId client password quantity |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	
	self
		should: [ 
			tusLibros checkOut: cartId charging: testObjectsFactory expiredCreditCard]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibros expiredCreditCardError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:22:48'!
test12InterfaceCanCheckOutAndRegisterSale

	| tusLibros cartId client password quantity |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	
	tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.
	
	self assert: (tusLibros listPurchases: client withPassword: password ) total equals: quantity*testObjectsFactory itemSellByTheStorePrice ! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:00'!
test13InterfaceCantAddABookToSoldCart

	| tusLibros cartId client password quantity cart |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	cart := tusLibros listCart: cartId.		

	tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.

	self
		should: [ 
			tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.]	
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: CartSession cantAddBooksToASoldCartError.
			self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) equals: quantity.
		].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:06'!
test14InterfaceCantCheckoutSoldCart

	| tusLibros cartId client password quantity sale |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.

	tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.

	self
		should: [ 
			tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.
		]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: CartSession cantCheckOutASoldCartError.
			sale := Bag new.
			sale add: testObjectsFactory itemSellByTheStore withOccurrences: quantity.
			self assert: (tusLibros listPurchases: client withPassword: password) clientSales equals: sale.
		].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:10'!
test15InterfaceCantListASoldCart

	| tusLibros cartId client password quantity |

	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	
	tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.

	self
		should: [
			tusLibros listCart: cartId.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = CartSession cantListASoldCartError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:17'!
test16InterfaceCantListAnExpiredCart

	| tusLibros cartId client password clock |

	clock := ManualClock new.
	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self on: clock.
	cartId := tusLibros createCartFor: client withPassword: password.

	 clock forwardMinutes: 30.
	
	self
		should: [ 
			tusLibros listCart: cartId.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = CartSession cantListAnExpiredCartError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:22'!
test17InterfaceCantAddABookToAnExpiredCart

	| tusLibros cartId client password quantity clock |

	clock := ManualClock new.
	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self on: clock.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	
	 clock forwardMinutes: 30.
	
	self
		should: [ 
			tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = CartSession cantAddBooksToAnExpiredCartError.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:26'!
test18InterfaceCantCheckoutAnExpiredCart

	| tusLibros cartId client password quantity clock |

	clock := ManualClock new.
	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self on: clock.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	
	 clock forwardMinutes: 30.
	
	self
		should: [ 
			tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = CartSession cantCheckOutAnExpiredCart.
			self assert: (tusLibros listPurchases: client withPassword: password) clientSales equals: Bag new.
			].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:58'!
test19InterfaceAnOperationResetSessionTimeCart

	| tusLibros cartId client password quantity clock |

	clock := ManualClock new.
	client := testObjectsFactory validClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self on: clock.
	cartId := tusLibros createCartFor: client withPassword: password.
	quantity := 2.
	
	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.
	
	 clock forwardMinutes: 29.

	tusLibros addCopies: quantity ofThisBook: testObjectsFactory itemSellByTheStore toCart: cartId.

	clock forwardMinutes: 29.

	tusLibros listCart: cartId.

	clock forwardMinutes: 29.

	tusLibros checkOut: cartId charging: testObjectsFactory notExpiredCreditCard.! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:37'!
test20_1InterfaceCantListPurchasesForAnIncorrectClient

	| tusLibros client password |

	client := testObjectsFactory invalidClient.
	password := testObjectsFactory validPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	
	self
		should: [
			tusLibros listPurchases: client withPassword: password
		]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TusLibros incorrectClientOrPasswordError.
		].! !

!RestInterfaceTest methodsFor: 'tests' stamp: 'tom 12/3/2018 16:49:42'!
test20_2InterfaceCantListPurchasesForAnIncorrectPassword

	| tusLibros client password |

	client := testObjectsFactory validClient.
	password := testObjectsFactory invalidPassword.
	tusLibros := testObjectsFactory createRestInterfaceForAMerchantProcessor: self.
	
	self
		should: [
			tusLibros listPurchases: client withPassword: password
		]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TusLibros incorrectClientOrPasswordError.
		].! !


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
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


!Cart methodsFor: 'total' stamp: 'tom 12/2/2018 23:07:28'!
doItems: aBlock

	| unrepeateItems |
	
	unrepeateItems := Set new.
	unrepeateItems addAll: items.

	^ unrepeateItems do: [aBlock] value.! !

!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'cart clock client sold lastActionTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'queries' stamp: 'tom 12/3/2018 13:53:26'!
cartAdd: aQuantity of: aBook

	self state cartAdd: aQuantity of: aBook.! !

!CartSession methodsFor: 'queries' stamp: 'tom 12/3/2018 14:17:27'!
checkoutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	^ self state checkOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook! !

!CartSession methodsFor: 'queries' stamp: 'tom 12/3/2018 13:54:36'!
listCart

	^ self state listCart! !


!CartSession methodsFor: 'private - accesing' stamp: 'tom 12/3/2018 13:23:41'!
client

	^ client! !

!CartSession methodsFor: 'private - accesing' stamp: 'tom 12/3/2018 15:14:59'!
expired

	^ (clock minutesDiference: lastActionTime) >= 30.! !

!CartSession methodsFor: 'private - accesing' stamp: 'tom 12/3/2018 13:48:18'!
sold

	^ sold! !

!CartSession methodsFor: 'private - accesing' stamp: 'tom 12/3/2018 13:42:42'!
state

	^ CartSessionState for: self! !


!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 14:12:05'!
expiredCartAdd: aQuantity of: aBook

	self error: self class cantAddBooksToAnExpiredCartError.


! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 15:26:19'!
expiredCheckOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	self error: self class cantCheckOutAnExpiredCart! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 15:21:41'!
expiredListCart

	self error: self class cantListAnExpiredCartError.! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 15:31:19'!
safeCartAdd: aQuantity of: aBook

	lastActionTime := clock now.
	cart add: aQuantity of: aBook.

! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 16:29:55'!
safeCheckOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	sold := true.
	lastActionTime := clock now.

	^ (Cashier toCheckout: cart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook for: client) checkOut! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 15:31:33'!
safeListCart

	lastActionTime := clock now.
	
	^ (CartViewer for: cart) lines! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 14:12:47'!
soldCartAdd: aQuantity of: aBook

	self error: self class cantAddBooksToASoldCartError.


! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 15:26:27'!
soldCheckOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	self error: self class cantCheckOutASoldCartError ! !

!CartSession methodsFor: 'private - queries' stamp: 'tom 12/3/2018 14:08:49'!
soldListCart

	self error: self class cantListASoldCartError.! !


!CartSession methodsFor: 'initialization' stamp: 'tom 12/3/2018 14:37:07'!
initializeFor: aClient withCart: aCart andClock: aClock

	client := aClient .
	cart := aCart.
	clock := aClock.
	sold := false.
	lastActionTime := clock now.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 13:16:38'!
for: aClient withCart: aCart andClock: aClock

	^ self new initializeFor: aClient withCart: aCart andClock: aClock
! !


!CartSession class methodsFor: 'error messages' stamp: 'tom 12/3/2018 14:07:01'!
cantAddBooksToASoldCartError

	^ 'Cant add books to a sold cart'.! !

!CartSession class methodsFor: 'error messages' stamp: 'tom 12/3/2018 14:09:56'!
cantAddBooksToAnExpiredCartError

	^ 'Cant add books to an expired cart'.! !

!CartSession class methodsFor: 'error messages' stamp: 'tom 12/3/2018 15:27:03'!
cantCheckOutASoldCartError

	^ 'Cant check out a sold cart'.! !

!CartSession class methodsFor: 'error messages' stamp: 'tom 12/3/2018 15:25:05'!
cantCheckOutAnExpiredCart

	^ 'Cant check out an expired cart'.! !

!CartSession class methodsFor: 'error messages' stamp: 'tom 12/3/2018 14:06:27'!
cantListASoldCartError

	^ 'Cant list a sold cart'.! !

!CartSession class methodsFor: 'error messages' stamp: 'tom 12/3/2018 14:09:33'!
cantListAnExpiredCartError

	^ 'Cant list an expired cart'.! !


!classDefinition: #CartSessionState category: #TusLibros!
Object subclass: #CartSessionState
	instanceVariableNames: 'cartSession'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSessionState methodsFor: 'initialization' stamp: 'tom 12/3/2018 13:53:04'!
initializeFor: aCartSession

	cartSession := aCartSession.! !


!CartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 13:40:56'!
cartAdd: aQuantity of: aBook

	self subclassResponsibility ! !

!CartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 16:52:11'!
checkOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	self subclassResponsibility ! !

!CartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 15:20:13'!
listCart

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSessionState class' category: #TusLibros!
CartSessionState class
	instanceVariableNames: ''!

!CartSessionState class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 13:45:12'!
for: aCartSession 

	| stateClass |
	
	stateClass := self allSubclasses detect: [:anStateClass | anStateClass isFor: aCartSession ].
		
	^stateClass new initializeFor: aCartSession ! !

!CartSessionState class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 13:45:38'!
isFor: aCartSession 

	^self subclassResponsibility ! !


!classDefinition: #ActiveCartSessionState category: #TusLibros!
CartSessionState subclass: #ActiveCartSessionState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ActiveCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:13:10'!
cartAdd: aQuantity of: aBook

	cartSession safeCartAdd: aQuantity of: aBook.! !

!ActiveCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:18:54'!
checkOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	^ cartSession safeCheckOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook.! !

!ActiveCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 13:55:26'!
listCart

	^ cartSession safeListCart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveCartSessionState class' category: #TusLibros!
ActiveCartSessionState class
	instanceVariableNames: ''!

!ActiveCartSessionState class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 13:46:28'!
isFor: aCartSession 

	^ aCartSession sold not and: [ aCartSession expired not].! !


!classDefinition: #ExpiredCartSessionState category: #TusLibros!
CartSessionState subclass: #ExpiredCartSessionState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ExpiredCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:12:05'!
cartAdd: aQuantity of: aBook

	cartSession expiredCartAdd: aQuantity of: aBook.! !

!ExpiredCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:19:16'!
checkOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	^ cartSession expiredCheckOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook! !

!ExpiredCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:00:38'!
listCart

	^ cartSession expiredListCart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExpiredCartSessionState class' category: #TusLibros!
ExpiredCartSessionState class
	instanceVariableNames: ''!

!ExpiredCartSessionState class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 13:47:57'!
isFor: aCartSession 

	^ aCartSession sold not and: [ aCartSession expired ].! !


!classDefinition: #SoldCartSessionState category: #TusLibros!
CartSessionState subclass: #SoldCartSessionState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SoldCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:12:48'!
cartAdd: aQuantity of: aBook

	cartSession soldCartAdd: aQuantity of: aBook.! !

!SoldCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:21:18'!
checkOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	^ cartSession soldCheckOutCharging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook! !

!SoldCartSessionState methodsFor: 'queries' stamp: 'tom 12/3/2018 14:00:51'!
listCart

	^ cartSession soldListCart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SoldCartSessionState class' category: #TusLibros!
SoldCartSessionState class
	instanceVariableNames: ''!

!SoldCartSessionState class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 13:48:31'!
isFor: aCartSession 

	^ aCartSession sold.! !


!classDefinition: #CartViewer category: #TusLibros!
Object subclass: #CartViewer
	instanceVariableNames: 'cart log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartViewer methodsFor: 'initialization' stamp: 'tom 12/3/2018 00:14:21'!
initializeFor: aCart

	cart := aCart.
	log := Bag new.! !


!CartViewer methodsFor: 'evaluation' stamp: 'tom 12/3/2018 00:14:09'!
lines

	cart doItems:  [ :aBook | log add: aBook withOccurrences: (cart occurrencesOf: aBook)].

	^ log. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartViewer class' category: #TusLibros!
CartViewer class
	instanceVariableNames: ''!

!CartViewer class methodsFor: 'instance creation' stamp: 'tom 12/2/2018 22:30:35'!
for: aCart

	^ self new initializeFor: aCart ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'tom 12/3/2018 15:54:34'!
createSale

	^ Sale of: cart for: client
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'tom 12/3/2018 11:54:04'!
registerSale
	
	| sale |
	sale := self createSale.
	salesBook add: sale.
	
	^sale.! !


!Cashier methodsFor: 'checkout' stamp: 'tom 12/3/2018 16:05:44'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'tom 12/3/2018 15:54:02'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook for: aClient
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook.
	client := aClient.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 15:54:17'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook for: aClient
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook for: aClient! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #ClientPurchases category: #TusLibros!
Object subclass: #ClientPurchases
	instanceVariableNames: 'clientSales subTotal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ClientPurchases methodsFor: 'accesing' stamp: 'tom 12/3/2018 16:21:24'!
at: anInt

	^clientSales at: anInt.! !

!ClientPurchases methodsFor: 'accesing' stamp: 'tom 12/3/2018 16:18:30'!
clientSales

	^clientSales ! !

!ClientPurchases methodsFor: 'accesing' stamp: 'tom 12/3/2018 16:18:14'!
total

	^subTotal! !


!ClientPurchases methodsFor: 'initialization' stamp: 'tom 12/3/2018 16:46:17'!
initializeFor: aClient  onSalesBook: salesBook

clientSales := Bag new.
subTotal := 0.
	
	salesBook do:[:aSale | (aSale client = aClient) ifTrue:[aSale itemsDo:[:item |clientSales add: item].  subTotal := subTotal + aSale total].].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ClientPurchases class' category: #TusLibros!
ClientPurchases class
	instanceVariableNames: ''!

!ClientPurchases class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 16:17:21'!
for: aClient onSalesBook: salesBook

	^self new initializeFor: aClient  onSalesBook: salesBook .! !


!classDefinition: #Clock category: #TusLibros!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'accesing' stamp: 'tom 12/3/2018 14:33:47'!
now

	self subclassResponsibility ! !


!Clock methodsFor: 'compares' stamp: 'tom 12/3/2018 15:07:39'!
minutesDiference: aTime

	self subclassResponsibility ! !


!classDefinition: #ManualClock category: #TusLibros!
Clock subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClock methodsFor: 'initialization' stamp: 'tom 12/3/2018 14:52:18'!
initialize

	now := 0.! !


!ManualClock methodsFor: 'modifiers' stamp: 'tom 12/3/2018 14:52:49'!
forwardMinutes: minutes

	now := now + minutes.! !


!ManualClock methodsFor: 'accesing' stamp: 'tom 12/3/2018 14:34:11'!
now

	^ now! !


!ManualClock methodsFor: 'compares' stamp: 'tom 12/3/2018 15:05:59'!
minutesDiference: aTime

	^ now - aTime! !


!classDefinition: #RealSystemClock category: #TusLibros!
Clock subclass: #RealSystemClock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RealSystemClock methodsFor: 'compares' stamp: 'tom 12/3/2018 15:06:42'!
minutesDiference: aTime

	^ (Time now - aTime) minutes! !


!RealSystemClock methodsFor: 'accesing' stamp: 'tom 12/3/2018 15:06:23'!
now

	^ Time now! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration number owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'tom 12/3/2018 10:01:58'!
initializeWithOwner: anOwner number: aNumber expiringOn: aMonth

	owner := anOwner.
	number := aNumber.
	expiration := aMonth.! !


!CreditCard methodsFor: 'accesing' stamp: 'tom 12/3/2018 09:24:34'!
number

	^ number! !

!CreditCard methodsFor: 'accesing' stamp: 'tom 12/3/2018 10:01:36'!
owner

	^ owner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 10:02:49'!
forOwner: anOwner number: aNumber expiringOn: aMonth 
	
	^self new initializeWithOwner: anOwner number: aNumber expiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total client items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'tom 12/3/2018 16:00:07'!
client
	
	^client ! !

!Sale methodsFor: 'total' stamp: 'tom 12/3/2018 16:02:17'!
items

	^ items.! !

!Sale methodsFor: 'total' stamp: 'tom 12/3/2018 16:40:24'!
itemsDo: aBlock

	^ items do: [ :anItem | aBlock value: anItem ].! !

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'tom 12/3/2018 16:11:16'!
initializeWith: aCart for: aClient

	items := Bag new.
	aCart doItems:  [ :aBook | items add: aBook withOccurrences: (aCart occurrencesOf: aBook)].
	client := aClient.
	total := aCart total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 15:57:50'!
aCartTotalIsNotPositiveError

	^'The carts total value is not positive'! !

!Sale class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 15:59:32'!
assertTotalIsPositive: aCart.

	(aCart total > 0) ifFalse: [self error: self class aCartTotalIsNotPositiveError].! !

!Sale class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 15:59:41'!
of: aCart for: aClient
	
	self assertTotalIsPositive: aCart.
	^self new initializeWith: aCart for: aClient.! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'TA 11/26/2018 19:13:06'!
defaultClients
	
	^ Dictionary new
		at: self validClient put: self validPassword;
		yourself! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'tom 12/3/2018 15:35:16'!
invalidClient

	^ 'pepe'! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'tom 12/3/2018 15:35:31'!
invalidPassword

	^ 'smalltalk'! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'TA 11/26/2018 19:12:11'!
validClient

	^ 'tomot'! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'TA 11/26/2018 19:12:26'!
validPassword

	^ 'procastinar'! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'tom 12/3/2018 10:03:16'!
expiredCreditCard
	
	^CreditCard forOwner: 'carlos' number: 1 expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'tom 12/3/2018 10:03:25'!
notExpiredCreditCard
	
	^CreditCard forOwner: 'juan' number: 1 expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'rest interface' stamp: 'tom 12/3/2018 15:11:07'!
createRestInterfaceForAMerchantProcessor: aMerchantProcessor

	^ TusLibros for: self defaultClients with: self defaultCatalog using: aMerchantProcessor on: DateAndTime withClock: RealSystemClock new.! !

!StoreTestObjectsFactory methodsFor: 'rest interface' stamp: 'tom 12/3/2018 14:47:46'!
createRestInterfaceForAMerchantProcessor: aMerchantProcessor on: aClock

	^ TusLibros for: self defaultClients with: self defaultCatalog using: aMerchantProcessor on: DateAndTime withClock: aClock.! !


!classDefinition: #TusLibros category: #TusLibros!
Object subclass: #TusLibros
	instanceVariableNames: 'clients catalog id salesBook merchantProcessor clock cartSessions calendar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibros methodsFor: 'initialization' stamp: 'tom 12/3/2018 14:45:35'!
initalizeFor: theClients with: aCatalog using: aMerchantProcessor on: aCalendar withClock: aClock

	clients := theClients.
	catalog := aCatalog.
	id := 0.
	salesBook := OrderedCollection new.
	merchantProcessor := aMerchantProcessor .
	calendar := aCalendar.
	
	clientSales := Dictionary new.
	clients keysDo: [ :aKey | clientSales add: aKey->OrderedCollection new ].
	
	cartSessions := Dictionary new.
	
	clock := aClock.! !


!TusLibros methodsFor: 'queries' stamp: 'tom 12/3/2018 13:43:57'!
addCopies: aQuantity ofThisBook: aBook toCart: anId

	self assertValidCart: anId.
	self assertValidBookISBN: aBook.
	self assertValidQuantityBook: aQuantity.
	
	(cartSessions at: anId) cartAdd: aQuantity of: aBook.! !

!TusLibros methodsFor: 'queries' stamp: 'tom 12/3/2018 16:05:23'!
checkOut: aCartId charging: aCreditCard 
	
	self assertValidCart: aCartId.
	self assertExpiredCreditCard: aCreditCard on: calendar now.

	^ (cartSessions at: aCartId) checkoutCharging: aCreditCard throught: merchantProcessor on: calendar now registeringOn: salesBook.! !

!TusLibros methodsFor: 'queries' stamp: 'tom 12/3/2018 14:31:03'!
createCartFor: aClient withPassword: aPassword 

	| lastid |

	self assertValidClient: aClient withPass: aPassword.

	lastid := id.
	cartSessions add: lastid  -> (CartSession for: aClient withCart: (Cart acceptingItemsOf: catalog) andClock: clock).
	id := id +1.

	^ lastid.! !

!TusLibros methodsFor: 'queries' stamp: 'tom 12/3/2018 13:54:15'!
listCart: anId

	self assertValidCart: anId.
	
	^ (cartSessions at: anId) listCart.! !

!TusLibros methodsFor: 'queries' stamp: 'tom 12/3/2018 16:18:44'!
listPurchases: aClient withPassword: aPassword

	self assertValidClient: aClient withPass: aPassword.

	^ClientPurchases for: aClient onSalesBook:salesBook.! !


!TusLibros methodsFor: 'assertion' stamp: 'tom 12/3/2018 14:29:09'!
assertExpiredCreditCard: aCreditCard on: date.

	(aCreditCard isExpiredOn: date) ifTrue: [ self error: self class expiredCreditCardError. ].! !

!TusLibros methodsFor: 'assertion' stamp: 'tom 12/3/2018 09:51:38'!
assertValidBookISBN: aBook.

	(catalog includesKey: aBook) ifFalse: [self error: self class invalidBookISBNError].
! !

!TusLibros methodsFor: 'assertion' stamp: 'tom 12/3/2018 13:44:06'!
assertValidCart: anId

	(cartSessions includesKey: anId) ifFalse: [self error: self class invalidCartIdError].! !

!TusLibros methodsFor: 'assertion' stamp: 'tom 12/3/2018 14:30:23'!
assertValidClient: aClient withPass: aPassword

	((clients includesKey: aClient) and: [(clients at: aClient) = aPassword ])
		ifFalse: [ self error: self class incorrectClientOrPasswordError ].
! !

!TusLibros methodsFor: 'assertion' stamp: 'tom 12/3/2018 12:58:20'!
assertValidQuantityBook: aQuantity.

	(aQuantity strictlyPositive) ifFalse: [self error: self class invalidBookQuantityError].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibros class' category: #TusLibros!
TusLibros class
	instanceVariableNames: ''!

!TusLibros class methodsFor: 'error messages' stamp: 'tom 12/3/2018 14:14:36'!
expiredCreditCardError

	^ 'cant charge on an expired credit card'.! !

!TusLibros class methodsFor: 'error messages' stamp: 'tom 12/3/2018 12:28:34'!
incorrectClientOrPasswordError

	^ 'Cliente o contraseña incorrecta'.! !

!TusLibros class methodsFor: 'error messages' stamp: 'TA 11/26/2018 19:26:12'!
invalidBookISBNError

	^ 'This books ISBN is not part of the catalog'.! !

!TusLibros class methodsFor: 'error messages' stamp: 'tom 12/3/2018 09:56:32'!
invalidBookQuantityError

	^ 'This quantity book is not positive'.! !

!TusLibros class methodsFor: 'error messages' stamp: 'TA 11/26/2018 18:48:57'!
invalidCartIdError

	^ 'A cart with this id doesnt exist'.! !


!TusLibros class methodsFor: 'instance creation' stamp: 'tom 12/3/2018 14:46:09'!
for: clients with: aCatalog using: aMerchantProcessor on: aCalendar withClock: aClock

	^ self new initalizeFor: clients with: aCatalog using: aMerchantProcessor on: aCalendar withClock: aClock.
! !
