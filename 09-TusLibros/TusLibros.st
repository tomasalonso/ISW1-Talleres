!classDefinition: #TusLibrosTests category: #TusLibros!
TestCase subclass: #TusLibrosTests
	instanceVariableNames: 'catalog carrito'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTests methodsFor: 'tests' stamp: 'T 11/14/2018 12:57:49'!
test01CreateNewCartAndItsEmpty
	
	carrito := Cart new.
	
	self assert: carrito isEmpty.! !

!TusLibrosTests methodsFor: 'tests' stamp: 'T 11/14/2018 12:59:12'!
test02AddABookToCartAndCheckItsInTheCart

	catalog := OrderedCollection with: 'libro1' with: 'libro2'.
	
	carrito := Cart withCatalog: catalog.
	
	carrito addToCart: 'libro1' withQuantity: 1.
	
	self assert: carrito isEmpty not;
		assert: carrito listCart size equals: 1;
	
		assert: (carrito listCart at: 1) equals: 'libro1'.! !

!TusLibrosTests methodsFor: 'tests' stamp: 'T 11/14/2018 12:59:07'!
test03AddBooksToCartAndCheckTheyAreInTheCart

	catalog := OrderedCollection with: 'libro1' with: 'libro2'.
	
	carrito := Cart withCatalog: catalog.
	
	carrito addToCart: 'libro1' withQuantity: 1.
	carrito addToCart: 'libro2' withQuantity: 1.

	self assert: carrito isEmpty not;
		assert: carrito listCart size equals: 2;
	
		assert: (carrito listCart at: 1) equals: 'libro1';
		assert: (carrito listCart at: 2) equals: 'libro2'.! !

!TusLibrosTests methodsFor: 'tests' stamp: 'T 11/14/2018 12:59:19'!
test04AddBooksToCartAndCheckTheirQuantities

	catalog := OrderedCollection with: 'libro1' with: 'libro2'.
	
	carrito := Cart withCatalog: catalog.
	
	carrito addToCart: 'libro1' withQuantity: 2.
	carrito addToCart: 'libro2' withQuantity: 3.
	
	self assert: carrito isEmpty not;
		assert: carrito listCart size equals: 5;
	
		assert: (carrito listCart at: 1) equals: 'libro1';
		assert: (carrito listCart at: 2) equals: 'libro1';
		assert: (carrito listCart at: 3) equals: 'libro2';
		assert: (carrito listCart at: 4) equals: 'libro2';
		assert: (carrito listCart at: 5) equals: 'libro2';
		assert: (carrito quantityOf: 'libro1') equals: 2;
		assert: (carrito quantityOf: 'libro2') equals: 3.! !

!TusLibrosTests methodsFor: 'tests' stamp: 'T 11/14/2018 12:59:33'!
test05YouCantAddAbookThatsNotInTheCatalog

	catalog := OrderedCollection with: 'libro1' with: 'libro2'.

	carrito := Cart withCatalog: catalog.
	carrito addToCart: 'libro1' withQuantity: 2.

	self assert: carrito isEmpty not;
		assert: (carrito listCart at: 1) equals: 'libro1';
		assert: (carrito listCart at: 2) equals: 'libro1';
		assert: (carrito quantityOf: 'libro1') equals: 2.

	self
		should: [carrito addToCart: 'libroExterno' withQuantity: 1]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: Cart invalidBookErrorMessage
				equals: anError messageText.
			self assert: (carrito quantityOf: 'libroExterno') equals: 0.
		]! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'books catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'initialization' stamp: 'T 11/14/2018 12:50:17'!
initalizeWithCatalog: aCatalog

	books := OrderedCollection new.
	catalog := aCatalog.! !

!Cart methodsFor: 'initialization' stamp: 'TA 11/12/2018 20:41:44'!
initialize

	books := OrderedCollection new! !


!Cart methodsFor: 'adding' stamp: 'T 11/14/2018 12:55:44'!
addToCart: anISBN withQuantity: anInteger

	(catalog includes: anISBN) ifFalse: [self error: self class invalidBookErrorMessage].
	
	anInteger timesRepeat: [books add: anISBN ]! !


!Cart methodsFor: 'testing' stamp: 'TA 11/12/2018 20:41:56'!
isEmpty

	^books isEmpty.! !

!Cart methodsFor: 'testing' stamp: 'TA 11/12/2018 20:43:01'!
quantityOf: aBook

	^books occurrencesOf: aBook.! !


!Cart methodsFor: 'accesing' stamp: 'TA 11/12/2018 20:42:06'!
listCart

	^books.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'TA 11/12/2018 20:32:13'!
new

	^super new initialize.! !

!Cart class methodsFor: 'instance creation' stamp: 'T 11/14/2018 12:48:39'!
withCatalog: aCatalog

	^ self new initalizeWithCatalog: aCatalog .! !


!Cart class methodsFor: 'error messages' stamp: 'T 11/14/2018 12:51:33'!
invalidBookErrorMessage

	^ 'El libro no está en el catalogo'! !
