!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'fichas ganador siguienteJugador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'nil' stamp: 't g 11/7/2018 16:18:15'!
ganador

	^ganador ! !

!TerniLapilli methodsFor: 'nil' stamp: 't g 11/7/2018 15:01:59'!
siguienteJugador

	^siguienteJugador! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:44:01'!
agregarFicha: unaCoordenada

	(fichas size = 6) ifTrue: [ self error: self class noSePuedenAgregarMasFichas ].
	
	((unaCoordenada x between: 1 and: 3) and: [unaCoordenada y between: 1 and: 3])
		ifFalse: [ self error: self class noSePuedenAgregarFichasAfueraDelTablero ].
	
	(fichas allSatisfy: [:unaFicha | (unaFicha = unaCoordenada) not ]) ifFalse: [ self error: self class noSePuedeAgregarMasDeUnaFichaEnElMismoCasillero ].
 	fichas add: unaCoordenada.
	
	self pasarTurno.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:06:01'!
ficha1circulo

	^fichas at: 2! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:03:39'!
ficha1cruz

	^fichas at: 1! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:06:10'!
ficha2circulo

	^fichas at: 4! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:06:06'!
ficha2cruz

	^fichas at: 3! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:04:12'!
ficha3circulo

	^fichas at: 6! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:06:15'!
ficha3cruz

	^fichas at: 5! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 14:57:37'!
ficha: unaFicha aDistanciaUnoDe: otraFicha

	^unaFicha eightNeighbors includes: otraFicha ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 20:07:26'!
ficha: unaFicha delJugador: jugador

	^((self fichasDeCruz includes: unaFicha) and: (jugador = 'cruz')) or: 
	  ((self fichasDeCirculo includes: unaFicha) and: (jugador = 'circulo')).! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/6/2018 15:20:26'!
fichasDeCirculo

	^OrderedCollection with: (fichas at: 2) with: (fichas at: 4) with: (fichas at: 6)! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'TA 11/6/2018 15:20:08'!
fichasDeCruz

	^OrderedCollection with: (fichas at: 1) with: (fichas at: 3) with: (fichas at: 5)! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:01:59'!
initialize
	
	siguienteJugador := 'cruz'.
	fichas := OrderedCollection new.
	ganador := 'ninguno'.
	^self.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:39:48'!
juegoTerminado

	(self sumasGanadoras includes: (self fichasDeCruz inject: (0@0) into: [:a :c | a + c])) ifTrue: [ganador := 'cruz'. ^true].
	(self sumasGanadoras includes: (self fichasDeCirculo inject: (0@0) into: [:a :c | a + c])) ifTrue: [ganador := 'circulo'. ^true].
	 
	^false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:08:13'!
mover: unaFicha aLaPosicion: unaCoordenada

	| posicionDeUnaFicha |
	
	(fichas size < 6) ifTrue: [self error: self class noSePuedeMoverUnaFichaCuandoFaltanFichasEnElTablero].
	
	self juegoTerminado ifTrue: [self error: self class noSePuedenMoverFichasConElJuegoTerminado].
	
	posicionDeUnaFicha := (fichas findFirst: [:laFicha | laFicha = unaFicha]).
	posicionDeUnaFicha = 0 ifTrue: [self error: self class noSePuedenMoverFichasQueNoExisten].
	
	(self ficha: unaFicha delJugador: siguienteJugador) ifFalse: [self error: self class noSePuedeMoverEnElTurnoDelOtroJugador].
	
	((unaCoordenada x between: 1 and: 3) and: [unaCoordenada y between: 1 and: 3])
		ifFalse: [ self error: self class noSePuedeMoverFueraDelTablero ].
	
	(self ficha: unaFicha aDistanciaUnoDe: unaCoordenada) ifFalse: [self error: self class noSePuedeMoverAPosicionesNoAdyacentes].
	(fichas anySatisfy: [:laFicha | laFicha = unaCoordenada]) ifTrue: [self error: self class noSePuedeMoverAPosicionesOcupadas].
	
	fichas at: posicionDeUnaFicha put: unaCoordenada.
	
	self pasarTurno.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:01:59'!
pasarTurno

 (siguienteJugador = 'circulo') ifTrue: [siguienteJugador := 'cruz'] ifFalse: [siguienteJugador  := 'circulo']! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:38:48'!
sumasGanadoras

	^ (OrderedCollection with: (3@6) with: (6@6) with: (9@6) with: (6@3) with: (6@9))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'nil' stamp: 'TA 11/1/2018 19:33:19'!
new
	^super new initialize. ! !

!TerniLapilli class methodsFor: 'nil' stamp: 'TA 11/1/2018 20:42:04'!
noSePuedeAgregarMasDeUnaFichaEnElMismoCasillero

	^ 'No se pueden agregar más de una ficha en el mismo casillero.'! !

!TerniLapilli class methodsFor: 'nil' stamp: 'TA 11/5/2018 17:46:04'!
noSePuedeMoverEnElTurnoDelOtroJugador

	^ 'No se puede mover en el turno de otro jugador'.! !

!TerniLapilli class methodsFor: 'nil' stamp: 't g 11/7/2018 15:07:03'!
noSePuedeMoverFueraDelTablero

	^ 'No se puede mover una ficha fuera del tablero'.! !

!TerniLapilli class methodsFor: 'nil' stamp: 'TA 11/1/2018 20:02:33'!
noSePuedenAgregarMasFichas

	^ 'No se pueden agregar más fichas. Ya hay 6.'! !

!TerniLapilli class methodsFor: 'nil' stamp: 'TA 11/5/2018 19:44:55'!
noSePuedenMoverFichasConElJuegoTerminado

	^ 'El juego terminó, ya no se pueden mover fichas'.! !

!TerniLapilli class methodsFor: 'nil' stamp: 'TA 11/5/2018 18:31:12'!
noSePuedenMoverFichasQueNoExisten

	^ 'No se pueden mover fichas que no existen'.! !


!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:11:24'!
noSePuedeMoverAPosicionesNoAdyacentes

	^ 'No se puede mover a posiciones no adyacentes, es imposible saltar posiciones.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:32:12'!
noSePuedeMoverAPosicionesOcupadas

	^ 'No se puede mover a posiciones ya ocupadas, es imposible pisar fichas.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:54:26'!
noSePuedeMoverUnaFichaCuandoFaltanFichasEnElTablero

	^ 'No se puede mover una ficha cuando faltan fichas en el tablero.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 20:10:38'!
noSePuedenAgregarFichasAfueraDelTablero

	^ 'No se pueden agregar fichas por fuera del tabler de 3 X 3.'! !
