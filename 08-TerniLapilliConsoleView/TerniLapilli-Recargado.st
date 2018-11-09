!classDefinition: #TerniLapilliConsoleTest category: #'TerniLapilli-Recargado'!
TestCase subclass: #TerniLapilliConsoleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli-Recargado'!

!TerniLapilliConsoleTest methodsFor: 'as yet unclassified' stamp: 'A T G 11/8/2018 21:24:23'!
in: aLines nextLines: aNumberLines

	aNumberLines timesRepeat: [ aLines nextLine ].! !

!TerniLapilliConsoleTest methodsFor: 'as yet unclassified' stamp: 'A T G 11/8/2018 21:10:00'!
test01JustOnePlayerAddsATokenAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsole on: game.
	
	game putXAt: 2@2.
	
	lines _ console lines.
	self assert: 'X marco en 2@2' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'as yet unclassified' stamp: 'A T G 11/8/2018 20:48:51'!
test02BothPlayerAddTokensAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsole on: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
		
	lines _ console lines.
	self assert: 'X marco en 1@1' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	self assert: 'O marco en 2@2' equals: lines nextLine.
	self assert: 'Estado: Jugando X' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'as yet unclassified' stamp: 'A T G 11/8/2018 21:36:26'!
test03PlayerOWinsAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsole on: game.
	
	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 3@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.

	lines _ console lines.
	
	self in: lines nextLines: 11.
	
	self assert: 'Estado: Juego terminado - ¡Ganó X!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !


!classDefinition: #TerniLapilliConsole category: #'TerniLapilli-Recargado'!
Object subclass: #TerniLapilliConsole
	instanceVariableNames: 'game lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli-Recargado'!

!TerniLapilliConsole methodsFor: 'initialization' stamp: 'A T G 11/8/2018 20:36:47'!
initializeOn: aTerniLapilli 
	
	game _ aTerniLapilli! !


!TerniLapilliConsole methodsFor: 'accesing' stamp: 'A T G 11/8/2018 20:34:25'!
lines

	^ ReadStream on: game lines contents.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliConsole class' category: #'TerniLapilli-Recargado'!
TerniLapilliConsole class
	instanceVariableNames: ''!

!TerniLapilliConsole class methodsFor: 'instance creation' stamp: 'A T G 11/8/2018 19:46:39'!
on: aTerniLapilli 
	^ self new initializeOn: aTerniLapilli ! !
