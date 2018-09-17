!classDefinition: #I category: #'Numeros De Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros De Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'Operadores' stamp: 'T 9/17/2018 15:59:47'!
* unMultiplicando

	^ unMultiplicando! !

!I class methodsFor: 'Operadores' stamp: 'T 9/17/2018 16:00:25'!
+ unSumando

	^ unSumando next! !

!I class methodsFor: 'Operadores' stamp: 'T 9/17/2018 16:00:33'!
- unSustraendo

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'Operadores' stamp: 'T 9/17/2018 15:58:32'!
/ unDivisor

	(unDivisor > self) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^ unDivisor vecesQueDivideA: self! !

!I class methodsFor: 'Operadores' stamp: 'T 9/17/2018 15:39:32'!
> unNumeroDePeano

	^false! !

!I class methodsFor: 'Operadores' stamp: 'ARM 9/6/2018 21:29:22'!
next

	^II! !


!I class methodsFor: 'Auxiliares' stamp: 'T 9/17/2018 16:02:49'!
menos: unMinuendo

	^ unMinuendo previous! !

!I class methodsFor: 'Auxiliares' stamp: 'T 9/17/2018 16:03:10'!
vecesQueDivideA: unDividendo

	^ unDividendo! !


!I class methodsFor: 'Errores' stamp: 'T 9/17/2018 15:29:13'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un divisor mayor que el dividendo'! !

!I class methodsFor: 'Errores' stamp: 'T 9/17/2018 11:01:02'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'No se puede restar un numero menor a un numero mayor o igual'! !


!classDefinition: #II category: #'Numeros De Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros De Peano'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 16:01:38'!
* unMultiplicando

	^ self previous * unMultiplicando + unMultiplicando! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 16:01:51'!
+ unSumando

	^self previous + unSumando next! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 16:01:59'!
- unSustraendo

	^ unSustraendo menos: self! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 15:58:28'!
/ unDivisor

	(unDivisor > self) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^ unDivisor vecesQueDivideA: self! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 15:39:25'!
> unNumeroDePeano

	(unNumeroDePeano = I) ifTrue: [^true].

	^ self previous > unNumeroDePeano previous! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 09:25:31'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next previous: self.
	].
	^next! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 09:25:21'!
previous

	^prev! !

!II class methodsFor: 'Operadores' stamp: 'T 9/17/2018 09:25:31'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !


!II class methodsFor: 'Auxiliares' stamp: 'T 9/17/2018 16:02:40'!
menos: unMinuendo

	^ unMinuendo previous - self previous! !

!II class methodsFor: 'Auxiliares' stamp: 'T 9/17/2018 16:03:20'!
vecesQueDivideA: unDividendo

	(unDividendo = self) ifTrue: [^I].
	(self > (unDividendo-self)) ifTrue: [^I].

	^ (self vecesQueDivideA: (unDividendo-self)) + I! !


!II class methodsFor: 'Errores' stamp: 'T 9/17/2018 15:29:28'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un divisor mayor que el dividendo'! !


!II class methodsFor: 'as yet unclassified' stamp: 'T 9/17/2018 16:06:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := I.! !

II initializeAfterFileIn!