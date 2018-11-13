!classDefinition: #TusLibrosTests category: #TusLibros!
TestCase subclass: #TusLibrosTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTests methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:13:03'!
test01CreateNewCartAndItsEmpty

	|carrito|
	
	carrito := Cart new.
	
	self assert: carrito isEmpty.! !

!TusLibrosTests methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:48:42'!
test02AddABookToCartAndCheckItsInTheCart

	|carrito|
	
	carrito := Cart new.
	carrito addToCart: 'unLibro' withQuantity: 2.
	
	self assert: carrito isEmpty not.
	self assert: (carrito listCart at: 1) equals: 'unLibro'.
	! !

!TusLibrosTests methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:51:19'!
test03AddABooksToCartAndCheckTheirQuantitys

	|carrito|
	
	carrito := Cart new.
	carrito addToCart: 'libro1' withQuantity: 2.
	carrito addToCart: 'libro2' withQuantity: 3.
	
	self assert: carrito isEmpty not.
	self assert: (carrito listCart at: 1) equals: 'libro1'.
	self assert: (carrito listCart at: 4) equals: 'libro2'.
	self assert: (carrito quantityOf: 'libro1') equals: 2.
	self assert: (carrito quantityOf: 'libro2') equals: 3.! !

!TusLibrosTests methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 21:05:10'!
test4ChequearErroresHacerCatalogotestear

	|carrito|
	
	carrito := Cart new.
	carrito addToCart: 'libro1' withQuantity: 2.
	carrito addToCart: 'libro2' withQuantity: 3.
	
	self assert: carrito isEmpty not.
	self assert: (carrito listCart at: 1) equals: 'libro1'.
	self assert: (carrito listCart at: 4) equals: 'libro2'.
	self assert: (carrito quantityOf: 'libro1') equals: 2.
	self assert: (carrito quantityOf: 'libro2') equals: 3.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:50:40'!
addToCart: anISBN withQuantity: anInteger

	anInteger timesRepeat: [books add: anISBN ]! !

!Cart methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:41:44'!
initialize

	books := OrderedCollection new! !

!Cart methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:41:56'!
isEmpty

	^books isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:42:06'!
listCart

	^books.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:43:01'!
quantityOf: aBook

	^books occurrencesOf: aBook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 20:32:13'!
new

	^super new initialize.! !
