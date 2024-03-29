!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:26'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TA 9/29/2018 18:56:42'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	"self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci."! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'TA 9/29/2018 20:13:38'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:48:00'!
* aMultiplier 
	
	^ aMultiplier productInteger: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:48:13'!
+ anAdder 
	
	^ anAdder sumInteger: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:47:46'!
- aSubtrahend 
	
	^ aSubtrahend substractInteger: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:48:43'!
/ aDivisor 
	
	^ aDivisor divideInteger: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TA 10/1/2018 12:24:38'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 15:02:09'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TA 10/1/2018 12:25:08'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'TA 10/1/2018 12:24:50'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'TA 10/1/2018 12:25:18'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'initialization' stamp: 'T 9/29/2018 15:09:07'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'TA 10/1/2018 12:26:35'!
printOn: aStream

	aStream print: self integerValue ! !


!Entero methodsFor: 'testing' stamp: 'TA 10/1/2018 12:26:02'!
isNegative
	
	^false! !

!Entero methodsFor: 'testing' stamp: 'TA 10/1/2018 12:26:13'!
isOne
	
	^false! !

!Entero methodsFor: 'testing' stamp: 'TA 10/1/2018 12:26:18'!
isZero
	
	^false! !


!Entero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:22:41'!
createFractionWith: aDividend

	^Fraccion new initializeWith: aDividend over: self! !

!Entero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:23:18'!
dividendForFractionWith: aDivisor
	
 	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.

	^denominator createFractionWith: numerator ! !

!Entero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:05:48'!
divisorForFractionWith: aDividend.
	
	^aDividend dividendForFractionWith: self.! !

!Entero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:33:54'!
isAValidDenominator! !

!Entero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:31:23'!
isAValidNumerator! !


!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:35:46'!
divideFraction: aDividend

	^ aDividend numerator / (aDividend denominator * self)
! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:35:30'!
divideInteger: aDividend

	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:35:12'!
productFraction: aMultiplier

	^ aMultiplier numerator * self / aMultiplier denominator
! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:34:56'!
productInteger: aMultiplier

	^ self class with: aMultiplier integerValue * self integerValue
	! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:34:40'!
substractFraction: aMinuend

	^ aMinuend numerator - (self * aMinuend denominator) / aMinuend denominator
! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:34:23'!
substractInteger: aMinuend

	^ self class with: aMinuend integerValue - self integerValue.! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:33:08'!
sumFraction: anAdder

	^ self * anAdder denominator + anAdder numerator / anAdder denominator
! !

!Entero methodsFor: 'auxiliar operations' stamp: 'TA 10/1/2018 12:32:28'!
sumInteger: anAdder

	^self class with: anAdder integerValue + self integerValue
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'error descriptions' stamp: 'NR 9/23/2018 22:17:16'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para enteros negativos'! !


!Entero class methodsFor: 'instance creation' stamp: 'TA 10/1/2018 12:43:47'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	"Este if podria sacarse implementando un mensaje isAvalidInteger que no haga nada en entero y en cualquier otro objeto de un error"
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^ (self subclasses detect: [:subclass | subclass isFor: aValue] ifNone: [^self new initializeWith: aValue]) with: aValue
	
	! !


!classDefinition: #Cero category: #'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:00:51'!
dividendForFractionWith: aDivisor

	^self! !

!Cero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:12:05'!
divisorForFractionWith: aDividend.

	self error: self class canNotDivideByZeroErrorDescription
	! !

!Cero methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:31:17'!
isAValidNumerator

	self error: 'una fraccion no puede ser cero' ! !


!Cero methodsFor: 'value' stamp: 'TA 10/1/2018 12:28:33'!
integerValue

	^0! !


!Cero methodsFor: 'arithmetic operations' stamp: 'TA 9/29/2018 18:51:05'!
fibonacci

	^ Entero with: 1! !


!Cero methodsFor: 'testing' stamp: 'TA 10/1/2018 12:27:14'!
isZero

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numero-Exercise'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'T 9/29/2018 14:56:32'!
isFor: aValue

	^ aValue = 0
	! !

!Cero class methodsFor: 'instance creation' stamp: 'TA 10/1/2018 12:28:52'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(self isFor: aValue) ifTrue: [^self new].
	
	^Entero with: aValue
	! !


!classDefinition: #Negativo category: #'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 19:58:33'!
divisorForFractionWith: aDividend
	
	^aDividend negated / self negated! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 15:01:43'!
fibonacci

	self error: self class negativeFibonacciErrorDescription! !


!Negativo methodsFor: 'testing' stamp: 'TA 10/1/2018 12:27:46'!
isNegative

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: #'Numero-Exercise'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'error descriptions' stamp: 'T 9/29/2018 15:01:33'!
negativeFibonacciErrorDescription

	^ ' Fibonacci no est� definido aqu� para enteros negativos'! !


!Negativo class methodsFor: 'instance creation' stamp: 'T 9/29/2018 14:56:39'!
isFor: aValue

	^ aValue < 0! !

!Negativo class methodsFor: 'instance creation' stamp: 'TA 10/1/2018 12:17:59'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(self isFor: aValue) ifTrue: [^self new initializeWith: aValue].
	
	^Entero with: aValue
	
	! !


!classDefinition: #Uno category: #'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 15:00:35'!
fibonacci

	^ self! !


!Uno methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:20:55'!
createFractionWith: aDividend
	
	^aDividend! !

!Uno methodsFor: 'fraction auxiliars' stamp: 'TA 9/29/2018 20:32:50'!
isAValidDenominator

	 self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'! !


!Uno methodsFor: 'value' stamp: 'TA 10/1/2018 12:28:22'!
integerValue

	^1! !


!Uno methodsFor: 'testing' stamp: 'TA 10/1/2018 12:27:56'!
isOne

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Exercise'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'T 9/29/2018 14:56:44'!
isFor: aValue

	^ aValue = 1! !

!Uno class methodsFor: 'instance creation' stamp: 'TA 10/1/2018 12:28:47'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	
	(self isFor: aValue) ifTrue: [^self new].
	
	^Entero with: aValue
	
	! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:47:14'!
* aMultiplier 
	
	^ aMultiplier productFraction: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:48:29'!
+ anAdder 
	
	^ anAdder sumFraction: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:49:53'!
- aSubtrahend

	^ aSubtrahend  substractFraction: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'T 9/29/2018 14:48:54'!
/ aDivisor 
	
	^ aDivisor divideFraction: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'TA 9/29/2018 20:35:23'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	
	aNumerator isAValidNumerator.
	aDenominator isAValidDenominator. 
	
	numerator := aNumerator.
	denominator := aDenominator 
	! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:03'!
divideFraction: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:09'!
divideInteger: aDividend

	^ aDividend * denominator / numerator! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:18'!
productFraction: aMultiplier

	^(aMultiplier numerator * numerator) / (aMultiplier denominator * denominator)
	! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:23'!
productInteger: aMultiplier

	^ aMultiplier * numerator / denominator! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:35'!
substractFraction: aMinuend

	| newNumerator newDenominator |
	
	newNumerator := (aMinuend numerator * denominator) - (aMinuend denominator * numerator).
	newDenominator := aMinuend denominator * denominator.
	
	^newNumerator / newDenominator 

! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:39'!
substractInteger: aMinuend

	^ aMinuend * denominator - numerator / denominator! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:52'!
sumFraction: anAdder

	| newNumerator newDenominator |
	
	newNumerator := (anAdder numerator * denominator) + (anAdder denominator * numerator).
	newDenominator := anAdder denominator * denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'operation auxiliars' stamp: 'TA 10/1/2018 12:40:57'!
sumInteger: anAdder

	^ anAdder * denominator + numerator / denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'TA 9/29/2018 20:02:43'!
with: aDividend over: aDivisor

	^aDivisor divisorForFractionWith: aDividend.
	! !
