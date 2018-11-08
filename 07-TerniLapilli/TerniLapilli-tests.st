!classDefinition: #TerniLapilliTest category: #'TerniLapilli-tests'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli-tests'!

!TerniLapilliTest methodsFor: 'tests' stamp: 't g 11/7/2018 14:44:15'!
test01ElPrimeroEsCruz
	
	|  juego |
	juego := TerniLapilli new.
	
	
	self assert: juego siguienteJugador equals: 'cruz'.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 't g 11/7/2018 14:44:06'!
test02AgregaBienLaPrimeraFicha
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	
	self assert: juego ficha1cruz equals: (1@1).! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/5/2018 17:02:33'!
test03ElSegundoJugadorEsCirculo	

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	
	self assert: juego siguienteJugador equals: 'circulo'.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/5/2018 17:02:30'!
test04AgregaBienLaSegundaFichaYElSiguienteJugadorEsCruz
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	
	self assert: juego ficha1circulo equals: (1@2).
	self assert: juego siguienteJugador equals: 'cruz'.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/5/2018 17:02:25'!
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/5/2018 17:02:21'!
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:18:00'!
test07NoPuedoAgregarFichasAfueraArribaALaIzquierda

	|  juego |
	juego := TerniLapilli new.
	
	self 
		should: [juego agregarFicha: (0@0).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarFichasAfueraDelTablero].
		! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:18:53'!
test08NoPuedoAgregarFichasAfueraArribaALaDerecha

	|  juego |
	juego := TerniLapilli new.
	
	self 
		should: [juego agregarFicha: (0@4).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarFichasAfueraDelTablero].
		! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:17:51'!
test09NoPuedoAgregarFichasAfueraAbajo

	|  juego |
	juego := TerniLapilli new.
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:18:19'!
test10NoPuedoAgregarMasDeUnaFichaEnElMismoCasillero

	| juego |
	
	juego := TerniLapilli new.
	
	juego agregarFicha: (1@1).
	
	self 
		should: [juego agregarFicha: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeAgregarMasDeUnaFichaEnElMismoCasillero].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:18:38'!
test11NoSePuedeMoverCuandoFaltanFichasEnElTablero

	| juego |
	
	juego := TerniLapilli new.
	
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverUnaFichaCuandoFaltanFichasEnElTablero]! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:19:37'!
test12MoverUnaFichaLaMueve
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:51:18'!
test13SoloMePuedoMoverHaciaLaDerechaUnaPosicion
	
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
		
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:50:00'!
test14SoloMePuedoMoverHaciaLaIzquierdaUnaPosicion
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (3@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
	
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 12:39:56'!
test15SoloMePuedoMoverArribaOAbajoUnaPosicion
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (3@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
 
	self 
		should: [juego mover: juego ficha3cruz aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
		self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
	
	
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 11:51:37'!
test16SoloMePuedoMoverAPosicionesDesocupadas
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 12:39:05'!
test17SiOSiMeTengoQueMoverEnMiTurno
	
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedeMoverAPosicionesNoAdyacentes].
		
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:29:20'!
test18SeMuevePrimeroCruzYLuegoLeTocaACirculo

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:29:49'!
test19NoSePuedeMoverUnJugadorEnElTurnoDelOtro

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:30:02'!
test20NoMePuedoMoverAfueraDelTablero
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:30:18'!
test21NoSePuedeMoverFichasQueNoExisten

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:53:01'!
test22TresDeCruzEnLaLineaDeArribaGanan

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (1@1).

	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (2@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:53:43'!
test23TresDeCruzEnLaSegundaLineaGanan

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (2@1).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (1@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:54:38'!
test24TresDeCruzEnLaTercerLineaGanan

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@3).
	juego agregarFicha: (2@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (3@1).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (1@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 15:55:15'!
test25TresDeCruzEnLaPrimerLineaEnOtroOrdenGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (1@3).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
		
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:00:10'!
test26TresDeCruzEnUnaLineaEnAlgunosOrdenesGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (1@3).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@1).
	
	juego mover: juego ficha1cruz aLaPosicion: (2@3).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (1@1).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@3).
	juego agregarFicha: (1@1).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@3).
	
	juego mover: juego ficha1cruz aLaPosicion: (3@2).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (1@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:01:05'!
test27TresDeCruzEnLaPrimerColumnaGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (1@1).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:02:58'!
test28TresDeCruzEnCualquierColumnaEnCualquierOrdenGanan
	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@1).
	juego agregarFicha: (2@3).
 	
	juego mover: juego ficha1cruz aLaPosicion: (1@1).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@3).
	
	juego mover: juego ficha1cruz aLaPosicion: (3@2).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	
	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (1@2).
	
	juego mover: juego ficha1cruz aLaPosicion: (3@3).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:04:49'!
test29TresDeCruzEnLaDiagonalAscendenteEnCualquierOrdenGanan
	
	| juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@3).
	
	juego mover: juego ficha1cruz aLaPosicion: (3@1).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (1@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@3).
	
 	juego mover: juego ficha1cruz aLaPosicion: (3@1).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	
	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@2).
	
	juego mover: juego ficha1cruz aLaPosicion: (2@2).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:06:47'!
test30TresDeCruzEnLaDiagonalDescendenteEnCualquierOrdenGanan
	
	| juego |
	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@2).
	juego agregarFicha: (3@2).
	juego agregarFicha: (3@3).
	juego agregarFicha: (2@3).
	
	juego mover: juego ficha1cruz aLaPosicion: (1@1).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.

	juego := TerniLapilli new.
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@3).
	juego agregarFicha: (1@3).
	
	juego mover: juego ficha1cruz aLaPosicion: (2@2).
 
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (1@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	
	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@3).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@2).
 	
	juego mover: juego ficha1cruz aLaPosicion: (3@3).
	
	self 
		should: [juego mover: juego ficha1circulo aLaPosicion: (3@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'cruz'.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:09:40'!
test31CirculoGanaAlEmpezar
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:14:43'!
test32CirculoGanaAlMover
	
	| juego |

	juego := TerniLapilli new.
	juego agregarFicha: (3@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (3@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@3).
 	juego agregarFicha: (1@1).
		
	juego mover: juego ficha1cruz aLaPosicion: (3@3).
	
	juego mover: juego ficha3circulo aLaPosicion: (2@1).
	
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (3@2).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'circulo'.

	juego := TerniLapilli new.
	juego agregarFicha: (2@1).
	juego agregarFicha: (1@2).
	juego agregarFicha: (2@3).
	juego agregarFicha: (1@1).
	juego agregarFicha: (1@3).
	juego agregarFicha: (3@2).
	
	juego mover: juego ficha1cruz aLaPosicion: (2@2).
	
	juego mover: juego ficha3circulo aLaPosicion: (3@3).
	
	juego mover: juego ficha1cruz aLaPosicion: (3@2).
	
	juego mover: juego ficha1circulo aLaPosicion: (2@2).
	
	
 
	self 
		should: [juego mover: juego ficha1cruz aLaPosicion: (2@1).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenMoverFichasConElJuegoTerminado].
	self assert: juego ganador equals: 'circulo'.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'TA 11/8/2018 16:16:28'!
test33CruzGanaAgregandoFichas

	|  juego |
	juego := TerniLapilli new.
	juego agregarFicha: (1@1).
	juego agregarFicha: (2@2).
	juego agregarFicha: (1@2).
	juego agregarFicha: (3@1).
	juego agregarFicha: (1@3).
	
	self 
		should: [juego agregarFicha: (3@3).] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError  messageText = TerniLapilli noSePuedenAgregarMasFichas].
		
	self assert: juego ganador equals: 'cruz'.! !
