!classDefinition: #EstadoDeTerniLapilli category: #TerniLapilli!
Object subclass: #EstadoDeTerniLapilli
	instanceVariableNames: 'juego'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!EstadoDeTerniLapilli methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 15:18:12'!
agregarFicha: unaCoordenada
	
	self subclassResponsibility ! !

!EstadoDeTerniLapilli methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 15:18:32'!
mover: unaFicha aLaPosicion: unaCoordenada

	self subclassResponsibility ! !


!EstadoDeTerniLapilli methodsFor: 'initialization' stamp: 'TA 11/8/2018 15:18:22'!
initializeFor: unJuego

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeTerniLapilli class' category: #TerniLapilli!
EstadoDeTerniLapilli class
	instanceVariableNames: ''!

!EstadoDeTerniLapilli class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 14:49:52'!
EstadoPara: unJuego

 |tipoDeJuego|

tipoDeJuego := self subclasses detect: [ :unTipoDeJuego | unTipoDeJuego isFor: unJuego].

^tipoDeJuego for: unJuego.! !

!EstadoDeTerniLapilli class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 15:17:50'!
for: unJuego

	^self subclassResponsibility ! !

!EstadoDeTerniLapilli class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 15:17:47'!
isFor: unJuego

	^self subclassResponsibility ! !


!classDefinition: #EstadoAgregandoFichas category: #TerniLapilli!
EstadoDeTerniLapilli subclass: #EstadoAgregandoFichas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!EstadoAgregandoFichas methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 14:53:54'!
agregarFicha: unaCoordenada
	
	juego safeAgregarFicha: unaCoordenada.
! !

!EstadoAgregandoFichas methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 14:54:11'!
mover: unaFicha aLaPosicion: unaCoordenada

	juego MoverConFaltaDeFichas.! !


!EstadoAgregandoFichas methodsFor: 'initialization' stamp: 'TA 11/8/2018 14:50:59'!
initializeFor: unJuego

	juego := unJuego.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoAgregandoFichas class' category: #TerniLapilli!
EstadoAgregandoFichas class
	instanceVariableNames: ''!

!EstadoAgregandoFichas class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 15:06:22'!
for: unJuego

	^self new initializeFor: unJuego! !

!EstadoAgregandoFichas class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 15:34:00'!
isFor: unJuego

	^(unJuego cantidadDeFichas < 6) and: [unJuego juegoTerminado not].! !


!classDefinition: #EstadoDeJuegoTerminado category: #TerniLapilli!
EstadoDeTerniLapilli subclass: #EstadoDeJuegoTerminado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!EstadoDeJuegoTerminado methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 15:23:49'!
agregarFicha: unaCoordenada
	
	juego agregarFichasConTableroCompleto.! !

!EstadoDeJuegoTerminado methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 14:37:33'!
mover: unaFicha aLaPosicion: unaCoordenada

	juego MoverConJuegoTerminado.! !


!EstadoDeJuegoTerminado methodsFor: 'initialization' stamp: 'TA 11/8/2018 13:41:52'!
initializeFor: unJuego

	juego := unJuego.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeJuegoTerminado class' category: #TerniLapilli!
EstadoDeJuegoTerminado class
	instanceVariableNames: ''!

!EstadoDeJuegoTerminado class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 13:42:29'!
for: unJuego

	^self new initializeFor: unJuego.! !

!EstadoDeJuegoTerminado class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 13:41:41'!
isFor: unJuego

	^unJuego  juegoTerminado.! !


!classDefinition: #EstadoEnJuego category: #TerniLapilli!
EstadoDeTerniLapilli subclass: #EstadoEnJuego
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!EstadoEnJuego methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 15:23:43'!
agregarFicha: unaCoordenada
	
	juego agregarFichasConTableroCompleto.! !

!EstadoEnJuego methodsFor: 'acciones del juego' stamp: 'TA 11/8/2018 14:54:45'!
mover: unaFicha aLaPosicion: unaCoordenada
	
	juego safeMover: unaFicha aLaPosicion: unaCoordenada.
! !


!EstadoEnJuego methodsFor: 'initialization' stamp: 'TA 11/8/2018 14:50:56'!
initializeFor: unJuego

	juego := unJuego.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoEnJuego class' category: #TerniLapilli!
EstadoEnJuego class
	instanceVariableNames: ''!

!EstadoEnJuego class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 15:06:34'!
for: unJuego

	^self new initializeFor: unJuego! !

!EstadoEnJuego class methodsFor: 'instance creation' stamp: 'TA 11/8/2018 15:25:55'!
isFor: unJuego

	^(unJuego cantidadDeFichas = 6) and: [unJuego  juegoTerminado not].! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'fichasDeCruz fichasDeCirculo fichas ganador siguienteJugador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/8/2018 15:24:36'!
cantidadDeFichas

	^ fichas size! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/8/2018 15:50:50'!
cantidadDeFichasDeCirculo

	^ fichas size // 2! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/8/2018 15:50:44'!
cantidadDeFichasDeCruz

	^ fichas size+1 // 2! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/1/2018 20:06:01'!
ficha1circulo

	^fichas at: 2! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/1/2018 20:03:39'!
ficha1cruz

	^fichas at: 1! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/1/2018 20:06:10'!
ficha2circulo

	^fichas at: 4! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/1/2018 20:06:06'!
ficha2cruz

	^fichas at: 3! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/1/2018 20:04:12'!
ficha3circulo

	^fichas at: 6! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/1/2018 20:06:15'!
ficha3cruz

	^fichas at: 5! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/6/2018 15:20:26'!
fichasDeCirculo

	^OrderedCollection with: (fichas at: 2) with: (fichas at: 4) with: (fichas at: 6)! !

!TerniLapilli methodsFor: 'accessing' stamp: 'TA 11/6/2018 15:20:08'!
fichasDeCruz

	^OrderedCollection with: (fichas at: 1) with: (fichas at: 3) with: (fichas at: 5)! !

!TerniLapilli methodsFor: 'accessing' stamp: 't g 11/7/2018 16:18:15'!
ganador

	^ganador ! !

!TerniLapilli methodsFor: 'accessing' stamp: 't g 11/7/2018 15:01:59'!
siguienteJugador

	^siguienteJugador! !


!TerniLapilli methodsFor: 'initialization' stamp: 'TA 11/8/2018 15:42:59'!
initialize
	
	siguienteJugador := 'cruz'.
	fichas := OrderedCollection new.
	fichasDeCruz := OrderedCollection new.
	fichasDeCirculo := OrderedCollection new.
	ganador := 'ninguno'.
	^self.
	! !


!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/8/2018 13:10:12'!
diagonalAscendente

	^ (OrderedCollection with: (3@1) with: (1@3) with: (2@2))! !

!TerniLapilli methodsFor: 'testing' stamp: 't g 11/7/2018 14:57:37'!
ficha: unaFicha aDistanciaUnoDe: otraFicha

	^unaFicha eightNeighbors includes: otraFicha ! !

!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/5/2018 20:07:26'!
ficha: unaFicha delJugador: jugador

	^((self fichasDeCruz includes: unaFicha) and: (jugador = 'cruz')) or: 
	  ((self fichasDeCirculo includes: unaFicha) and: (jugador = 'circulo')).! !

!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/8/2018 12:59:02'!
gano: unEquipo
	
	^(self ganoPorFilas: unEquipo) or: [(self ganoPorColumnas: unEquipo) or: [self ganoPorDiagonales: unEquipo]].! !

!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/8/2018 13:09:26'!
ganoPorColumnas: unEquipo

	^unEquipo allSatisfy: [:ficha | (ficha y) = (unEquipo at:1) y].! !

!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/8/2018 13:09:12'!
ganoPorDiagonales: unEquipo

	^(unEquipo allSatisfy: [:ficha | (ficha y) = (ficha x)]) or: [unEquipo allSatisfy: [:ficha | self diagonalAscendente includes: ficha]].! !

!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/8/2018 13:09:35'!
ganoPorFilas: unEquipo

	^unEquipo allSatisfy: [:ficha | (ficha x) = (unEquipo at:1) x].! !

!TerniLapilli methodsFor: 'testing' stamp: 'TA 11/8/2018 15:46:55'!
juegoTerminado

	
	((self cantidadDeFichasDeCruz = 3) and: [self gano: self fichasDeCruz]) ifTrue: [ganador := 'cruz'. ^true].
	
	((self cantidadDeFichasDeCirculo = 3) and: [self gano: self fichasDeCirculo]) ifTrue: [ganador := 'circulo'. ^true].
	
	^false! !


!TerniLapilli methodsFor: 'playing' stamp: 'TA 11/8/2018 15:02:55'!
agregarFicha: unaCoordenada

	| estado |
	estado := (EstadoDeTerniLapilli EstadoPara: self).
	estado agregarFicha: unaCoordenada.
	
! !

!TerniLapilli methodsFor: 'playing' stamp: 'TA 11/8/2018 14:57:26'!
mover: unaFicha aLaPosicion: unaCoordenada
	
	(EstadoDeTerniLapilli EstadoPara: self) mover: unaFicha aLaPosicion: unaCoordenada.

	! !

!TerniLapilli methodsFor: 'playing' stamp: 'TA 11/8/2018 14:40:43'!
safeAgregarFicha: unaCoordenada

	((unaCoordenada x between: 1 and: 3) and: [unaCoordenada y between: 1 and: 3])
		ifFalse: [ self error: self class noSePuedenAgregarFichasAfueraDelTablero ].
	
	(fichas allSatisfy: [:unaFicha | (unaFicha = unaCoordenada) not ]) ifFalse: [ self error: self class noSePuedeAgregarMasDeUnaFichaEnElMismoCasillero ].
 	fichas add: unaCoordenada.
	
	self pasarTurno.! !

!TerniLapilli methodsFor: 'playing' stamp: 'TA 11/8/2018 14:55:33'!
safeMover: unaFicha aLaPosicion: unaCoordenada

	| posicionDeUnaFicha |
	
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


!TerniLapilli methodsFor: 'auxiliares de estado' stamp: 'TA 11/8/2018 14:38:22'!
MoverConFaltaDeFichas

	self error: self class noSePuedeMoverUnaFichaCuandoFaltanFichasEnElTablero.! !

!TerniLapilli methodsFor: 'auxiliares de estado' stamp: 'TA 11/8/2018 14:37:21'!
MoverConJuegoTerminado

	self error: self class noSePuedenMoverFichasConElJuegoTerminado! !

!TerniLapilli methodsFor: 'auxiliares de estado' stamp: 'TA 11/8/2018 15:23:31'!
agregarFichasConTableroCompleto

	 self error: self class noSePuedenAgregarMasFichas.! !


!TerniLapilli methodsFor: 'auxiliares' stamp: 't g 11/7/2018 15:01:59'!
pasarTurno

 (siguienteJugador = 'circulo') ifTrue: [siguienteJugador := 'cruz'] ifFalse: [siguienteJugador  := 'circulo']! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/1/2018 20:42:04'!
noSePuedeAgregarMasDeUnaFichaEnElMismoCasillero

	^ 'No se pueden agregar más de una ficha en el mismo casillero.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/5/2018 17:11:24'!
noSePuedeMoverAPosicionesNoAdyacentes

	^ 'No se puede mover a posiciones no adyacentes, es imposible saltar posiciones.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/5/2018 17:32:12'!
noSePuedeMoverAPosicionesOcupadas

	^ 'No se puede mover a posiciones ya ocupadas, es imposible pisar fichas.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/5/2018 17:46:04'!
noSePuedeMoverEnElTurnoDelOtroJugador

	^ 'No se puede mover en el turno de otro jugador'.! !

!TerniLapilli class methodsFor: 'error' stamp: 't g 11/7/2018 15:07:03'!
noSePuedeMoverFueraDelTablero

	^ 'No se puede mover una ficha fuera del tablero'.! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/1/2018 20:54:26'!
noSePuedeMoverUnaFichaCuandoFaltanFichasEnElTablero

	^ 'No se puede mover una ficha cuando faltan fichas en el tablero.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/1/2018 20:10:38'!
noSePuedenAgregarFichasAfueraDelTablero

	^ 'No se pueden agregar fichas por fuera del tabler de 3 X 3.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/1/2018 20:02:33'!
noSePuedenAgregarMasFichas

	^ 'No se pueden agregar más fichas. Ya hay 6.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/5/2018 19:44:55'!
noSePuedenMoverFichasConElJuegoTerminado

	^ 'El juego terminó, ya no se pueden mover fichas'.! !

!TerniLapilli class methodsFor: 'error' stamp: 'TA 11/5/2018 18:31:12'!
noSePuedenMoverFichasQueNoExisten

	^ 'No se pueden mover fichas que no existen'.! !


!TerniLapilli class methodsFor: 'instance creation' stamp: 'TA 11/1/2018 19:33:19'!
new
	^super new initialize. ! !
