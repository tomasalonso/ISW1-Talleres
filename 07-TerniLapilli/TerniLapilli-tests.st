!classDefinition: #TerniLapilliTest category: #'TerniLapilli-tests'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli-tests'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 14:44:15'!
test01ElPrimeroEsCruz
	
	|  juego |
	juego := TerniLapilli new.
	
	
	self assert: juego siguienteJugador equals: 'cruz'.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 14:44:06'!
test02AgregaBienLaPrimeraFicha
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	
	self assert: juego ficha1cruz equals: (1@1).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:33'!
test03ElSegundoJugadorEsCirculo	

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	
	self assert: juego siguienteJugador equals: 'circulo'.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:30'!
test04AgregaBienLaSegundaFichaYElSiguienteJugadorEsCruz
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	
	self assert: juego ficha1circulo equals: (1@2).
	self assert: juego siguienteJugador equals: 'cruz'.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:25'!
test05AgregaTerceraFichaYSigueCirculo
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (1@3).
	
	
	self assert: juego ficha1cruz equals: (1@1).
	self assert: juego ficha1circulo equals: (1@2).
	self assert: juego ficha2cruz equals: (1@3).
	
	self assert: juego siguienteJugador equals: 'circulo'.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:21'!
test06AgregoTodasLasFichasYUnaDeMas
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
	
	
	self assert: juego ficha1cruz equals: (1@1).
	self assert: juego ficha1circulo equals: (1@2).
	self assert: juego ficha2cruz equals: (1@3).
	self assert: juego ficha2circulo equals: (2@1).
	self assert: juego ficha3cruz equals: (2@2).
	self assert: juego ficha3circulo equals: (2@3).
	
	self 
		should: [juego agregarFicha: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarMasFichas]! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:17'!
test07NoPuedoAgregarFichasAfuera

	|  juego |
	juego := TerniLapilli new.
	
	self 
		should: [juego agregarFicha: (0@0).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarFichasAfueraDelTablero].
		
	self 
		should: [juego agregarFicha: (0@4).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarFichasAfueraDelTablero].
		
	self 
		should: [juego agregarFicha: (4@0).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarFichasAfueraDelTablero].
		
	self 
		should: [juego agregarFicha: (4@4).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarFichasAfueraDelTablero]
		
		! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:13'!
test08NoPuedoAgregarMasDeUnaFichaEnElMismoCasillero

	| juego |
	
	juego := TerniLapilli new.
	
	juego agregarFicha: (1@1).
	
	self 
		should: [juego agregarFicha: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeAgregarMasDeUnaFichaEnElMismoCasillero].! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:02:02'!
test09NoSePuedeMoverCuandoFaltanFichasEnElTablero

	| juego |
	
	juego := TerniLapilli new.
	
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverUnaFichaCuandoFaltanFichasEnElTablero]! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/1/2018 21:42:44'!
test10MoverUnaFichaLaMueve
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
	
	
	juego mover: juego ficha1cruz aLaPosicion: (1@2).
	
	self assert: juego ficha1cruz equals: (1@2).
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:30:45'!
test11SoloMePuedoMoverAPosicionesAdyacentes
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
		
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'TA 11/5/2018 17:32:36'!
test12SoloMePuedoMoverAPosicionesDesocupadas
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesOcupadas].
		
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesOcupadas].
		
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:13:10'!
test13NoMePuedoMoverAfueraDelTablero
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (3@3).
	juego agregarFicha: (2@2).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (0@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverFueraDelTablero].
		
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@0).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverFueraDelTablero].
		
	self 
		should: [juego mover: juego ficha3cruz aLaPosicion: (3@4).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverFueraDelTablero].
		
	self 
		should: [juego mover: juego ficha3cruz aLaPosicion: (4@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverFueraDelTablero].
		! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:30:09'!
test14SeMuevePrimeroCruzYLuegoLeTocaACirculo

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self assert: juego siguienteJugador equals: 'cruz'.
	
	juego mover: juego ficha1cruz aLaPosicion: (1@2).
	
	self assert: juego siguienteJugador equals: 'circulo'.
	
	juego mover: juego ficha1circulo aLaPosicion: (3@1).
	
	self assert: juego siguienteJugador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:30:45'!
test15NoSePuedeMoverUnJugadorEnElTurnoDelOtro

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverEnElTurnoDelOtroJugador].
		
	juego mover: juego ficha1cruz aLaPosicion: (1@2).
		
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverEnElTurnoDelOtroJugador].! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 15:31:03'!
test16NoSePuedeMoverFichasQueNoExisten

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: (3@1) aLaPosicion: (3@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasQueNoExisten].
		
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:18:59'!
test17TresDeCruzEnLaLineaDeArribaGanan

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:19:46'!
test18TresDeCruzEnLaSegundaLineaGanan

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:19:55'!
test19TresDeCruzEnLaTercerLineaGanan

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@3).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:20:13'!
test20TresDeCruzEnLaPrimerLineaEnOtroOrdenGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:20:56'!
test21TresDeCruzEnUnaLineaEnAlgunosOrdenesGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@3).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:21:04'!
test22TresDeCruzEnLaPrimerColumnaGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:21:14'!
test23TresDeCruzEnCualquierColumnaEnCualquierOrdenGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	
	juego := TerniLapilli new.
	juego agregarFicha: (3@3).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (1@2).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:21:30'!
test24TresDeCruzEnLaDiagonalDescendenteEnCualquierOrdenGanan
	
	| juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (3@3).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@3).
	juego agregarFicha: (1@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	
	juego := TerniLapilli new.
	juego agregarFicha: (3@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@2).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:21:43'!
test25TresDeCruzEnLaDiagonalAscendenteEnCualquierOrdenGanan
	
	| juego |
	juego := TerniLapilli new.
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	
	juego := TerniLapilli new.
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 't g 11/7/2018 16:22:08'!
test26CirculoGana
	
	| juego |

	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@3).
 	juego agregarFicha: (2@1).
	
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'circulo'.

	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (1@2).
	juego agregarFicha: (3@3).
	juego agregarFicha: (2@2).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'circulo'.

	juego := TerniLapilli new.
	juego agregarFicha: (1@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (1@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'circulo'.


	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'circulo'.
	! !
