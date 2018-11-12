!classDefinition: #TerniLapilliConsoleViewTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliConsoleViewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 19:22:19'!
functionalException
	^ Error - MessageNotUnderstood.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'A T G 11/8/2018 21:24:23'!
in: aLines nextLines: aNumberLines

	aNumberLines timesRepeat: [ aLines nextLine ].! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:43:14'!
test01JustOnePlayerAddsATokenAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@2.
	
	lines _ console lines.
	self assert: 'X marco en 2@2' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:10'!
test02BothPlayerAddTokensAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
		
	lines _ console lines.
	self assert: 'X marco en 1@1' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	self assert: 'O marco en 2@2' equals: lines nextLine.
	self assert: 'Estado: Jugando X' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:14'!
test03PlayerOWinsWhenPlacingAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 3@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.

	lines _ console lines.
	
	self in: lines nextLines: 11.
	
	self assert: 'Estado: Juego terminado - ¡Ganó O!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:32'!
test04PlayerXWinsWhenPlacingAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 1@2.
	game putOAt: 3@2.
	game putXAt: 1@3.

	lines _ console lines.
	
	self in: lines nextLines: 9.
	
	self assert: 'Estado: Juego terminado - ¡Ganó X!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:37'!
test05XSlidesWithoutWinningAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@2.
	game putOAt: 2@1.
	game putXAt: 3@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@2) to: (1@1).
	
	lines _ console lines.
	
	self in: lines nextLines: 12.
	
	self assert: 'X deslizó hasta 1@1 desde 2@2' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:40'!
test06OSlidesWithoutWinningAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@2.
	game putOAt: 2@1.
	game putXAt: 3@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@2) to: (1@1).
	game slideOFrom: (2@1) to: (2@2).
	
	lines _ console lines.
	
	self in: lines nextLines: 14.
	
	self assert: 'O deslizó hasta 2@2 desde 2@1' equals: lines nextLine.
	self assert: 'Estado: Jugando X' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:44'!
test07XSlidesAndWinsAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@2.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@3.
	game putXAt: 1@3.
	game putOAt: 3@3.
	
	game slideXFrom: (2@2) to: (1@1).
	
	lines _ console lines.
	
	self in: lines nextLines: 12.
	
	self assert: 'X deslizó hasta 1@1 desde 2@2' equals: lines nextLine.
	self assert: 'Estado: Juego terminado - ¡Ganó X!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:46'!
test08OSlidesAndWinsAndConsoleRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@1.
	game putOAt: 2@2.
	game putXAt: 2@3.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@1) to: (3@1).
	game slideOFrom: (2@2) to: (1@1).
	
	lines _ console lines.
	
	self in: lines nextLines: 14.
	
	self assert: 'O deslizó hasta 1@1 desde 2@2' equals: lines nextLine.
	self assert: 'Estado: Juego terminado - ¡Ganó O!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:53:49'!
test09PlayersMakeWrongMarksAndConsoleDoesntRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.

	self
		should: [ game putOAt: 3@3 ]
		raise: self functionalException.
		
		
	game putXAt: 3@3.
	
	self
		should: [ game putXAt: 1@3 ]
		raise: self functionalException.
	
	lines _ console lines.
	
	self in: lines nextLines: 2.
	
	self assert: 'O marco en 2@2' equals: lines nextLine.
	self assert: 'Estado: Jugando X' equals: lines nextLine.
	self assert: 'X marco en 3@3' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:33:31'!
test10PlayersMakeWrongSlidesAndConsoleDoesntRegister

	| game console lines |

	game _ TerniLapilli new.
	console _ TerniLapilliConsoleObserver on: game.
	
	game putXAt: 2@1.
	game putOAt: 2@2.
	game putXAt: 1@1.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@1) to: (3@1).
	
	self
		should: [game slideXFrom: (3@1) to: (2@1).]
		raise: self functionalException.
		
	game slideOFrom: (1@3) to: (2@3).
	
	self
		should: [game slideOFrom: (2@3) to: (1@3).]
		raise: self functionalException.
	
	lines _ console lines.
	
	self in: lines nextLines: 12.
	
	self assert: 'X deslizó hasta 3@1 desde 2@1' equals: lines nextLine.
	self assert: 'Estado: Jugando O' equals: lines nextLine.
	self assert: 'O deslizó hasta 2@3 desde 1@3' equals: lines nextLine.
	self assert: 'Estado: Jugando X' equals: lines nextLine.
	
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 10:58:05'!
test11XmarksAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	lines _ game view board.
	
	self assert: ' | | ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' |X| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' | | ' equals: lines nextLine.
	self assert: 'Playing O' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 00:23:49'!
test12OmarksAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.
	
	lines _  game view board.
	
	self assert: 'O| | ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' |X| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' | | ' equals: lines nextLine.
	self assert: 'Playing X' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:22:52'!
test13BothplayersPutAllTheirMarksAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@1.
	lines _  game view board.
	game putOAt: 2@2.
	lines _  game view board.
	game putXAt: 1@1.
	lines _  game view board.
	game putOAt: 1@2.
	lines _  game view board.
	game putXAt: 3@3.
	lines _  game view board.
	game putOAt: 1@3.
	
	
	lines _  game view board.
	
	self assert: 'X|O|O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'X|O| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' | |X' equals: lines nextLine.
	self assert: 'Playing X' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 00:41:31'!
test14PlayerOWinsWhenPlacingAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	
	lines _  game view board.
	
	self assert: 'O|O|O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'X|X| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' | |X' equals: lines nextLine.
	self assert: 'O Won!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:04:46'!
test15PlayerXWinsWhenPlacingAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 1@3.
	
	
	lines _  game view board.
	
	self assert: 'X|X|X' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'O|O| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' | | ' equals: lines nextLine.
	self assert: 'X Won!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:06:24'!
test16PlayerXSlidesAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@1.
	game putOAt: 3@2.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@1) to: (3@1).
	
	lines _  game view board.
	
	self assert: ' |O|O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' |X| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'X|O|X' equals: lines nextLine.
	self assert: 'Playing O' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:12:47'!
test17BothPlayersSlideAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@1.
	game putOAt: 3@2.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@1) to: (3@1).
	game slideOFrom: (1@2) to: (1@1).
	
	lines _  game view board.
	
	self assert: 'O| |O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' |X| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'X|O|X' equals: lines nextLine.
	self assert: 'Playing X' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:17:04'!
test18PlayerXSlidesAndWinsAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 3@1.
	game putOAt: 2@3.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@2) to: (3@2).
	
	lines _  game view board.
	
	self assert: ' |O|O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' | |O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'X|X|X' equals: lines nextLine.
	self assert: 'X Won!!' equals: lines nextLine.
	
	self assert: lines atEnd.! !

!TerniLapilliConsoleViewTest methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:20:06'!
test19BothPlayersMakeWrongSlidesAndViewRefresh

	| game lines |

	game _ TerniLapilli new.
	
	game putXAt: 2@1.
	game putOAt: 2@2.
	game putXAt: 1@1.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
	game slideXFrom: (2@1) to: (3@1).
	
	self
		should: [game slideXFrom: (3@1) to: (2@1).]
		raise: self functionalException.
		
	game slideOFrom: (1@3) to: (2@3).
	
	self
		should: [game slideOFrom: (2@3) to: (1@3).]
		raise: self functionalException.
	
	
	lines _  game view board.
	
	self assert: 'X|O| ' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: ' |O|O' equals: lines nextLine.
	self assert: '-----' equals: lines nextLine.
	self assert: 'X| |X' equals: lines nextLine.
	self assert: 'Playing X' equals: lines nextLine.
	
	self assert: lines atEnd.! !


!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 11/8/2018 09:51:39'!
assertCanNotMarkAt: aPosition
	self assertCanNotMarkUsing: [ game putXAt: aPosition ].
	self assertCanNotMarkUsing: [ game putOAt: aPosition ].! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 20:12:53'!
assertCanNotMarkUsing: aMarkingClosure
	self
		should: aMarkingClosure 
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionOutsideBoardErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{}
				andOOn:
					{} ].! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:53:12'!
assertGameIsNotOver
	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 08:20:23'!
assertGameIsOver
	self assert: game isOver.
	self deny: game isPlayingX.
	self deny: game isPlayingO.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:59:35'!
assertIsPlayingO
	self assert: game isPlayingO.
	self deny: game isPlayingX.
	self assertGameIsNotOver.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:52:33'!
assertIsPlayingX
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:56:00'!
assertOIsMarkedOn: oPositions
	self
		assert: oPositions size
		equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions ) isEmpty.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 08:38:50'!
assertOWon
	self assertGameIsOver.
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:50:53'!
assertXIsMarkedOn: xPositions
	self
		assert: xPositions size
		equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions ) isEmpty.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:48:39'!
assertXIsMarkedOn: xPositions andOOn: oPositions
	self assertXIsMarkedOn: xPositions .
	self assertOIsMarkedOn: oPositions .! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 08:20:00'!
assertXWon
	self assertGameIsOver.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !


!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 07:25:01'!
functionalException
	^ Error - MessageNotUnderstood.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 09:31:31'!
test01aGameStartsWithAnEmptyBoardAndPlayingX

	game _ TerniLapilli new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 09:33:14'!
test01bGameStartsWithAnEmptyBoardButOCanNotPlayFirst
	
	| oPosition |
	
	game _ TerniLapilli new.
	oPosition _ 2@2.
	
	self should: [ game putOAt: oPosition]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli notOTurnErrorMessage 
				equals: anError messageText.
			self deny: (game isTaken: oPosition) ].			
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:54:38'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	self
		assertXIsMarkedOn:
			{1 @ 1}
		andOOn:
			{}.
	self assertIsPlayingO.
	
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:04:28'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		assertXIsMarkedOn:
			{1 @ 1}
		andOOn:
			{2 @ 2}.
	self assertIsPlayingX.	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:07:30'!
test04CanNotMarkWithXWhenLastMarkWasX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli notXTurnErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{} ].	
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:09:21'!
test05CanNotMarkWithOWhenLastMarkWasO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putOAt: 3 @ 3 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli notOTurnErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{2 @ 2} ].
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:11:07'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 1 @ 1. ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{2 @ 2} ].
				
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:13:58'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{2 @ 2} ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:16:06'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	self
		should: [ game putOAt: 1 @ 1 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{} ].	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:18:11'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 3 @ 3.
	self
		should: [ game putOAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1. 3 @ 3}
				andOOn:
					{2 @ 2} ].
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/8/2018 13:11:55'!
test10AssertThereIsNotWinner
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 2.
	
	self assertGameIsNotOver ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:22:01'!
test11XWinsWhenCompletesRowNumber1
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self assertXWon.
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:30:21'!
test12XWinsWhenCompletesRowNumber2
	game _ TerniLapilli new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assertXWon.

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:31:38'!
test13XWinsWhenCompletesRowNumber3
	
	game _ TerniLapilli new.

	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:35:10'!
test14XWinsWhenCompletesAColumn
	
	game _ TerniLapilli new.

	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:36:18'!
test15XWinsWhenCompletesDiagonalGoingDown
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 3.
	game putXAt: 3 @ 3.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:37:09'!
test16XWinsWhenCompletesDiagonalGoingUp
	game _ TerniLapilli new.

	game putXAt: 1 @ 3.
	game putOAt: 1 @ 2.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 1.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:38:20'!
test17OWinsWhenCompletesARow
	
	game _ TerniLapilli new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 3.
	self assertOWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 09:24:09'!
test18OCanNotMarkWhenXWon
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self
		should: [ game putOAt: 3 @ 1 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self assertOIsMarkedOn:
				{2 @ 1. 3 @ 1} ].
			
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 19:29:18'!
test19XCanNotMarkWhenXWon
	game _ TerniLapilli new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.

	self 
		should: [ game  putXAt: 2 @ 3 ] 
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
				{2 @ 1. 2 @ 2. 2@3}
			 ]
		! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 19:29:30'!
test20XCanNotPlaceMoreThanThreePieces
	game _ TerniLapilli new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 3.
	self
		should: [ game putXAt: 3 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli playerXHasPlacedThreePieces
				equals: anError messageText.
			self assertXIsMarkedOn:
				{2 @ 2. 2 @ 1. 3 @ 1} ].
			
			! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test21XCanSlideWhenAllXPiecesWerePlaced
	game _ TerniLapilli new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game slideXFrom: 2 @ 2 to: 1 @ 2.
	
	self assertXIsMarkedOn: {1 @ 2. 1 @ 3. 2 @ 1}.
	self assertIsPlayingO.	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test22OCanSlideWhenAllOPiecesWerePlaced
	
	game _ TerniLapilli new.
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 1@1 to: 2@2.


	self assertXIsMarkedOn: {1 @ 2. 2 @ 1. 1 @ 3}.
	self assertOIsMarkedOn: {2 @ 2. 3 @ 1. 2 @ 3}.
	self assertIsPlayingX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test23CanNotSlideWithXToAnAlreadyMarkedPositionWithX

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 1@1 to: 2@2.
				
	self 
		should: [ game slideXFrom: 1@2 to: 1@3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{2@2. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test24CanNotSlideWithXToAnAlreadyMarkedPositionWithO

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 1@1 to: 2@2.
				
	self 
		should: [ game slideXFrom: 2@1 to: 3@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{2@2. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test25CanNotSlideWithOToAnAlreadyMarkedPositionWithO
	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
					
	self 
		should: [ game slideOFrom: 1@1 to: 2@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 3@1. 1@3}
				andOOn:
					{1@1. 2@2. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:38'!
test26CanNotSlideWithOToAnAlreadyMarkedPositionWithX
	
	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
					
	self 
		should: [ game slideOFrom: 1@1 to: 2@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{1@1. 3@1. 2@3} ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test27XWinsSliding

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 2@2 to: 3@3.
	game slideXFrom: 1@2 to: 2@2.
					
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:38'!
test28OWinsSliding

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 1@1 to: 2@1.
					
	self assertOWon.
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:38'!
test29XCanNotSlideWhenOWon
	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 1@1 to: 2@1.
					
	self 
		should: [ game slideXFrom: 3@1 to: 3@2. ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2.     3@1. 1@3}
				andOOn:
					{2@1. 2@2. 2@3}  ]
			

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test30OCanNotSlideWhenXWon
	game _ TerniLapilli new.	
	
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	
	game slideXFrom: 2 @ 2 to: 1 @ 2.
	game slideOFrom: 3 @ 1 to: 2 @ 2.
	game slideXFrom: 2 @ 1 to: 3 @ 1.
	game slideOFrom: 2 @ 2 to: 3 @ 3.
	game slideXFrom: 1 @ 2 to: 2 @ 2.
	
	self should: [game slideOFrom: 1 @ 1 to: 2 @ 1 ]
		raise: self functionalException
		withExceptionDo: [ :anError | self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
		self assertXIsMarkedOn:
					{2@2.     3@1. 1@3}
				andOOn:
					{1@1. 3@3. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test30_01CanNotSlideXToAnInvalidPosition

	game _ TerniLapilli new.	
	
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	
	self 
		should: [game slideXFrom: 1 @ 3 to: 0 @ 3]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli illegalMovement.
			self assertXIsMarkedOn: { 2@2. 2@1. 1@3 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test30_02CanNotSlideOToAnInvalidPosition

	game _ TerniLapilli new.	
	
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	
	game slideXFrom: 1 @ 3 to: 1@ 2.
	self 
		should: [ game slideOFrom: 1@1 to: 0@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli illegalMovement.
			self assertOIsMarkedOn: { 1@1. 3@1. 2@3 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test31DifferenceBetweenPositionsShouldNotBeGreaterThanOneWhenSliding
	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 2@3.

	self 
		should: [ game slideXFrom: 3@1 to: 3@3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli illegalMovement equals: anError messageText.
			self assertXIsMarkedOn:
					{2@2. 2@1. 3@1}
				andOOn:
					{1@1. 1@2. 2@3}  ]
			
			

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test32OnlyPermittedXSlidingsBetweenAdjacentsPositions

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 2@2 to: 3@3.	
					
		self 
		should: [ game slideXFrom: 1@2 to: 3@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli illegalMovement equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 3@1. 1@3}
				andOOn:
					{1@1. 3@3. 2@3}   ]
			
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test33OnlyPermittedOSlidingsBetweenAdjacentsPositions
game _ TerniLapilli new.	

	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 2@3.
	
	game slideXFrom: 3@1 to: 3@2.

	self 
		should: [ game slideOFrom: 2@3 to: 3@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli illegalMovement equals: anError messageText.
			self assertXIsMarkedOn:
					{2@2. 2@1. 3@2}
				andOOn:
					{1@1. 1@2. 2@3}  ]
			
			

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 20:34:51'!
test34CanNotMarkOutsideBoard
	game _ TerniLapilli new.
	#(0 4 ) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test35CanNotSlideWithXFromAPositionMarkedWithO

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
			
	self 
		should: [ game slideXFrom: 3@1 to: 3@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli playersCanOnlySlideTheirOwnPieces equals: anError messageText.
			self assertXIsMarkedOn:
					{2@2. 2@1. 1@3}
				andOOn:
					{1@1. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test36CanNotSlideWithOFromAPositionMarkedWithX

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.

	game slideXFrom: 2@2 to: 1@2.
			
	self 
		should: [ game slideOFrom: 2@1 to: 2@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli playersCanOnlySlideTheirOwnPieces equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{1@1. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:49:16'!
test37CanNotSlideXWhenPutingX

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	

	self 
		should: [ game slideXFrom: 2@2 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  playerXHasPiecesToPlace.
			self assertXIsMarkedOn: { 2@2 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:49:30'!
test38CanNotSlideOWhenPuttingO

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 1@3.

	self 
		should: [ game slideOFrom: 1@1 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  playerOHasPiecesToPlace.
			self assertOIsMarkedOn: { 1@1 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:49:49'!
test39CanNotSlideXWhenPlayingO

	game _ TerniLapilli new.	
	game putXAt: 2@2.

	self 
		should: [ game slideXFrom: 2@2 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  notXTurnErrorMessage.
			self assertXIsMarkedOn: { 2@2 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:50:01'!
test40CanNotSlideOWhenPlayingX

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.

	self 
		should: [ game slideOFrom: 1@1 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  notOTurnErrorMessage.
			self assertOIsMarkedOn: { 1@1 } ]
	! !


!classDefinition: #ActiveVariable category: #TerniLapilli!
Object subclass: #ActiveVariable
	instanceVariableNames: 'state observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:21:13'!
addObserver: anObserver

	observers add: anObserver ! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 20:33:01'!
changeStateTo: aState

	state := aState.
	observers do: [ :anObserver | anObserver update: aState].
! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:52:39'!
doesNotUnderstand: aMessage

	^aMessage sendTo: state! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 20:31:39'!
initializeFor: aGame

	state := PlacingX new initializeFor: aGame.
	observers := OrderedCollection new.! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'playerOPositions playerXPositions lastPlay activeVariableState view'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 10/28/2018 15:11:39'!
assertAllPiecesOPlaced

	(self playerOPositions size = 3 ) ifFalse: [ self error: self class playerOHasPiecesToPlace ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 10/28/2018 15:11:20'!
assertAllPiecesXPlaced

	(self playerXPositions size = 3 ) ifFalse: [ self error: self class playerXHasPiecesToPlace ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'HAW 11/8/2018 10:47:35'!
assertIsInBoardBounds: aPosition

	(self isInBoardBounds: aPosition) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TerniLapilli methodsFor: 'assertions' stamp: 'HAW 11/8/2018 09:55:12'!
assertIsLegalMovementFrom: aPosition to: anotherPosition

	(self moveLegalFrom: aPosition to: anotherPosition) ifFalse: [ self error: self class illegalMovement ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 11/6/2018 22:31:24'!
assertThereIsAnOPieceIn: aPosition

	(self playerOPositions includes: aPosition) ifFalse: [ self error: self class playersCanOnlySlideTheirOwnPieces ]! !

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 11/6/2018 22:30:17'!
assertThereIsAnXPieceIn: aPosition

	(self playerXPositions includes: aPosition) ifFalse: [ self error: self class playersCanOnlySlideTheirOwnPieces ]! !


!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:30'!
has: positions threeOf: aPositionComponent

	^positions size >= 3 and: [ (positions collect: aPositionComponent) asBag contents values includes: 3 ]
	! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 11/8/2018 10:58:20'!
hasCompletedColumn: positions

	^ self has: positions threeOf: [ :aPosition | aPosition y ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 11/8/2018 10:58:36'!
hasCompletedRow: positions
	
	^ self has: positions threeOf: [ :aPosition | aPosition x ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:15:47'!
hasDownDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :n | positions includes: n @ (4-n) ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:15:59'!
hasUpDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :n | positions includes: n @ n ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:16:26'!
hasWin: positions

	^ (self hasCompletedRow: positions) 
		or: [ (self hasCompletedColumn: positions) 
		or: [ (self hasUpDiagonal: positions) 
		or: [ self hasDownDiagonal: positions ]]].! !


!TerniLapilli methodsFor: 'initialization' stamp: 'T 11/12/2018 10:20:41'!
initialize

	playerXPositions := OrderedCollection new.
	playerOPositions := OrderedCollection new.
	activeVariableState := ActiveVariable new initializeFor: self.
	lastPlay := String new.
	view := TerniLapilliViewObserver on: self.! !


!TerniLapilli methodsFor: 'marking board' stamp: 'TA 11/11/2018 20:19:11'!
putOAt: aPosition

	self assertIsInBoardBounds: aPosition .
	activeVariableState putOAt: aPosition! !

!TerniLapilli methodsFor: 'marking board' stamp: 'TA 11/11/2018 20:19:11'!
putXAt: aPosition

	self assertIsInBoardBounds: aPosition .
	activeVariableState putXAt: aPosition! !


!TerniLapilli methodsFor: 'marking board - private' stamp: 'TA 11/12/2018 01:03:00'!
changeStateAfterAdding: aPosition to: positions  
 
	|state|

	positions add: aPosition.
	state := TerniLapilliState for: self.
	
	view refreshState: state.
	
	activeVariableState changeStateTo: (state).
	

	
! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'T 11/12/2018 09:42:36'!
putOWhenPlacingOAt: aPosition

	self playerOHasPiecesToPlace.
	self assertIsFree: aPosition.
	
 	lastPlay := PlacingOMove for: aPosition.

	self changeStateAfterAdding: aPosition to: playerOPositions
		! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:39:41'!
putOWhenPlacingXAt: aPosition

	self error: self class notOTurnErrorMessage ! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:08:31'!
putOWhenSlidingOAt: aPoint 
	
	self error: self class eachPlayerOnlyHasThreePieces ! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:38:11'!
putOWhenSlidingXAt: aPosition

	self error: self class notOTurnErrorMessage ! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:39:23'!
putXWhenPlacingOAt: aPoint 
	
	self error: self class notXTurnErrorMessage! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'T 11/12/2018 09:42:14'!
putXWhenPlacingXAt: aPosition

	self playerXHasPiecesToPlace.
	self assertIsFree: aPosition.
	
	lastPlay := PlacingXMove for: aPosition.

	self changeStateAfterAdding: aPosition to: playerXPositions
	
	! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:38:49'!
putXWhenSlidingOAt: aPoint 
	
	self error: self class notXTurnErrorMessage! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 11:59:44'!
putXWhenSlidingXAt: aPoint 
	
	self error: self class eachPlayerOnlyHasThreePieces ! !


!TerniLapilli methodsFor: 'pieces' stamp: 'HAW 11/8/2018 09:58:58'!
playerOHasPiecesToPlace

	 self playerOPositions size < 3 ifFalse: [ self error: self class playerXHasPlacedThreePieces ].
	! !

!TerniLapilli methodsFor: 'pieces' stamp: 'HAW 11/8/2018 09:59:05'!
playerXHasPiecesToPlace

	 self playerXPositions size < 3 ifFalse: [ self error: self class playerXHasPlacedThreePieces ].
	! !


!TerniLapilli methodsFor: 'positions' stamp: 'HAW 11/8/2018 10:49:00'!
moveLegalFrom: aPosition to: anotherPosition
	
	^ (self is: aPosition adjacentTo: anotherPosition) and: [ self isInBoardBounds: anotherPosition ]! !

!TerniLapilli methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TerniLapilli methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TerniLapilli methodsFor: 'sliding' stamp: 'TA 11/11/2018 20:19:11'!
slideOFrom: aPosition to: anotherPosition

	self assertThereIsAnOPieceIn: aPosition.
	activeVariableState slideOFrom: aPosition to: anotherPosition! !

!TerniLapilli methodsFor: 'sliding' stamp: 'TA 11/11/2018 20:19:11'!
slideXFrom: aPosition to: anotherPosition

	self assertThereIsAnXPieceIn: aPosition.
	activeVariableState slideXFrom: aPosition to: anotherPosition! !


!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:41:03'!
slideOWhenPlacingOFrom: aPosition to: anotherPosition

	self error: self class playerOHasPiecesToPlace ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:46:55'!
slideOWhenPlayingXFrom: aPosition to: anotherPosition

	self error: self class notOTurnErrorMessage ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'T 11/12/2018 09:46:07'!
slideOWhenSlidingOFrom: aPosition to: anotherPosition
	
	self assertIsFree: anotherPosition .
	self assertIsLegalMovementFrom: aPosition to: anotherPosition.
	
	playerOPositions remove: aPosition.
	
	lastPlay := SlidingOMove from: aPosition to: anotherPosition.

	self changeStateAfterAdding: anotherPosition to: playerOPositions
	 ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:16:01'!
slideXWhenPlacingXFrom: aPosition to: anotherPosition

	self error: self class playerXHasPiecesToPlace ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:44:53'!
slideXWhenPlayingOFrom: aPosition to: anotherPosition

	self error: self class notXTurnErrorMessage! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'T 11/12/2018 09:45:46'!
slideXWhenSlidingXFrom: aPosition to: anotherPosition
	
	self assertIsFree: anotherPosition .
	self assertIsLegalMovementFrom: aPosition to: anotherPosition.
	
	playerXPositions remove: aPosition.
	
	lastPlay := SlidingXMove from: aPosition to: anotherPosition.

	self changeStateAfterAdding: anotherPosition to: playerXPositions! !


!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 12:19:28'!
does: aNumber distanceOneTo: anotherNumber

	^ (aNumber - anotherNumber) abs < 2 ! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 11:30:51'!
hasXMorePiecesToPlace
	
	^playerXPositions size < 3! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 12:19:28'!
is: aPosition adjacentTo: anotherPosition

	^ (self does: aPosition x distanceOneTo: anotherPosition x) and: [ self does: aPosition y distanceOneTo: anotherPosition y ]
	! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 10:47:53'!
isInBoardBounds: aPosition

	^aPosition between: 1@1 and: 3@3! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 5/31/2018 00:16:45'!
isTaken: aPosition

	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 11:56:45'!
hasPlayerOWon

	^self hasWin: playerOPositions ! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 11:56:55'!
hasPlayerXWon
	
	^self hasWin: playerXPositions ! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'TA 11/11/2018 20:19:11'!
isOver
	
	^activeVariableState isOver! !


!TerniLapilli methodsFor: 'testing playing turn' stamp: 'TA 11/11/2018 20:19:11'!
isPlacingX
	
	^activeVariableState isPlacingX ! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'TA 11/11/2018 20:19:11'!
isPlayingO
	
	^activeVariableState isPlayingO! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'TA 11/11/2018 20:19:11'!
isPlayingX
	
	^activeVariableState isPlayingX ! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'TA 11/11/2018 20:19:11'!
isSlidingX
	
	^activeVariableState isSlidingX! !


!TerniLapilli methodsFor: 'observers' stamp: 'TA 11/11/2018 21:21:53'!
addStateObserver: anObserver

	activeVariableState addObserver: anObserver.! !

!TerniLapilli methodsFor: 'observers' stamp: 'TA 11/11/2018 21:39:16'!
lastPlay
	
	^lastPlay! !

!TerniLapilli methodsFor: 'observers' stamp: 'TA 11/12/2018 00:15:56'!
view
	
	^view.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 10/28/2018 11:12:02'!
eachPlayerOnlyHasThreePieces

	^ 'Each player only has three pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 11/8/2018 09:55:12'!
illegalMovement
	
	^'Movement is not legal'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 22:50:08'!
playerOHasPiecesToPlace

	^ 'Must place all pieces to slide'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 10/28/2018 15:02:06'!
playerOHasPlacedThreePieces

	^ 'Each player only has three pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 22:50:16'!
playerXHasPiecesToPlace

	^ 'Must place all pieces to slide'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 10/28/2018 15:01:23'!
playerXHasPlacedThreePieces

	^ 'Each player only has three pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 22:21:33'!
playersCanOnlySlideTheirOwnPieces

	^ 'Players can only slide their own pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 20:07:12'!
positionOutsideBoardErrorMessage
	^ 'Position is outside board'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TerniLapilliConsoleObserver category: #TerniLapilli!
Object subclass: #TerniLapilliConsoleObserver
	instanceVariableNames: 'game lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliConsoleObserver methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:49:47'!
lines

	^ReadStream on: lines contents.! !

!TerniLapilliConsoleObserver methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:44:14'!
observe: aGame

	game := aGame.
	lines := WriteStream on: String new.
	aGame addStateObserver: self.
	! !

!TerniLapilliConsoleObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:15:04'!
update: aState

	lines nextPutAll: (TerniLapilliLastPlayAsStringVisitor for: game lastPlay) value; newLine.
	lines nextPutAll: (TerniLapilliConsoleStateVisitor for: aState) value; newLine.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliConsoleObserver class' category: #TerniLapilli!
TerniLapilliConsoleObserver class
	instanceVariableNames: ''!

!TerniLapilliConsoleObserver class methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 21:44:07'!
on: aGame

	^self new observe: aGame.! !


!classDefinition: #TerniLapilliConsoleStateVisitor category: #TerniLapilli!
Object subclass: #TerniLapilliConsoleStateVisitor
	instanceVariableNames: 'state line'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliConsoleStateVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:27:04'!
initializeWith: anState

	state := anState.! !

!TerniLapilliConsoleStateVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:30:19'!
value

	state accept: self.
	^line.! !

!TerniLapilliConsoleStateVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:29:43'!
visitOWonState: anState.

	line := 'Estado: Juego terminado - ¡Ganó O!!'.! !

!TerniLapilliConsoleStateVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:29:59'!
visitPlayingO: anState.
	
	line := 'Estado: Jugando O'! !

!TerniLapilliConsoleStateVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:30:03'!
visitPlayingX: anState.

	line := 'Estado: Jugando X'.! !

!TerniLapilliConsoleStateVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:30:06'!
visitXWonState: anState.

	line := 'Estado: Juego terminado - ¡Ganó X!!'
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliConsoleStateVisitor class' category: #TerniLapilli!
TerniLapilliConsoleStateVisitor class
	instanceVariableNames: ''!

!TerniLapilliConsoleStateVisitor class methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:20:16'!
for: anState

	^ self new initializeWith: anState.! !


!classDefinition: #TerniLapilliLastPlayAsStringVisitor category: #TerniLapilli!
Object subclass: #TerniLapilliLastPlayAsStringVisitor
	instanceVariableNames: 'lastPlay line'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliLastPlayAsStringVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:41:25'!
initializeWith: aLastPlay

	lastPlay  := aLastPlay.
	! !

!TerniLapilliLastPlayAsStringVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:33:42'!
value

	lastPlay accept: self.
	
	^line.! !

!TerniLapilliLastPlayAsStringVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:54:44'!
visitPlacingO: aLastPlay

	line := 'O marco en ', (aLastPlay position asString).! !

!TerniLapilliLastPlayAsStringVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:54:36'!
visitPlacingX: aLastPlay

	line := 'X marco en ', (aLastPlay position asString).! !

!TerniLapilliLastPlayAsStringVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:54:52'!
visitSlidingO: aLastPlay

	line := 'O deslizó hasta ', (aLastPlay positionTo asString), ' desde ', (aLastPlay positionFrom asString).! !

!TerniLapilliLastPlayAsStringVisitor methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:55:19'!
visitSlidingX: aLastPlay

	line := 'X deslizó hasta ', (aLastPlay positionTo asString), ' desde ', (aLastPlay positionFrom asString).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliLastPlayAsStringVisitor class' category: #TerniLapilli!
TerniLapilliLastPlayAsStringVisitor class
	instanceVariableNames: ''!

!TerniLapilliLastPlayAsStringVisitor class methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:41:03'!
for: aLastPlay

	^TerniLapilliLastPlayAsStringVisitor new initializeWith: aLastPlay.! !


!classDefinition: #TerniLapilliLastPlayRefreshViewVisitor category: #TerniLapilli!
Object subclass: #TerniLapilliLastPlayRefreshViewVisitor
	instanceVariableNames: 'lastPlay line view'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliLastPlayRefreshViewVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:29:33'!
initializeWith: aLastPlay and: aView.

	lastPlay := aLastPlay.
	view := aView.! !

!TerniLapilliLastPlayRefreshViewVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:32:25'!
value

	lastPlay accept: self.
! !

!TerniLapilliLastPlayRefreshViewVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:31:19'!
visitPlacingO: aLastPlay

	view putOIn: aLastPlay position! !

!TerniLapilliLastPlayRefreshViewVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 10:31:34'!
visitPlacingX: aLastPlay

	view putXIn: aLastPlay position! !

!TerniLapilliLastPlayRefreshViewVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:31:58'!
visitSlidingO: aLastPlay

	view clear: aLastPlay positionFrom.
	view putOIn: aLastPlay positionTo.! !

!TerniLapilliLastPlayRefreshViewVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:32:08'!
visitSlidingX: aLastPlay

	view clear: aLastPlay positionFrom.
	view putXIn: aLastPlay positionTo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliLastPlayRefreshViewVisitor class' category: #TerniLapilli!
TerniLapilliLastPlayRefreshViewVisitor class
	instanceVariableNames: ''!

!TerniLapilliLastPlayRefreshViewVisitor class methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:29:04'!
for: aLastPlay and: aView

	^ self new initializeWith: aLastPlay and: aView.! !


!classDefinition: #TerniLapilliMove category: #TerniLapilli!
Object subclass: #TerniLapilliMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #PlayingOMove category: #TerniLapilli!
TerniLapilliMove subclass: #PlayingOMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #PlacingOMove category: #TerniLapilli!
PlayingOMove subclass: #PlacingOMove
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlacingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:42:54'!
accept: aVisitor

	aVisitor visitPlacingO: self.! !

!PlacingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:36:26'!
initializeWith: aPosition

	position := aPosition ! !

!PlacingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:53:31'!
position

	^position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingOMove class' category: #TerniLapilli!
PlacingOMove class
	instanceVariableNames: ''!

!PlacingOMove class methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:36:37'!
for: aPosition

	^self new initializeWith: aPosition.! !


!classDefinition: #SlidingOMove category: #TerniLapilli!
PlayingOMove subclass: #SlidingOMove
	instanceVariableNames: 'positionTo positionFrom'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:43:10'!
accept: aVisitor

	aVisitor visitSlidingO: self.! !

!SlidingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:57:22'!
initializeWith: aPosition and: anotherPosition

	positionTo := anotherPosition.
	positionFrom := aPosition ! !

!SlidingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:54:11'!
positionFrom

	^positionFrom.! !

!SlidingOMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:54:18'!
positionTo

	^positionTo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingOMove class' category: #TerniLapilli!
SlidingOMove class
	instanceVariableNames: ''!

!SlidingOMove class methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:57:07'!
from: aPosition to: anotherPosition
	
	^self new initializeWith: aPosition and: anotherPosition.! !


!classDefinition: #PlayingXMove category: #TerniLapilli!
TerniLapilliMove subclass: #PlayingXMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #PlacingXMove category: #TerniLapilli!
PlayingXMove subclass: #PlacingXMove
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlacingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:43:32'!
accept: aVisitor

	aVisitor visitPlacingX: self.! !

!PlacingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:36:19'!
initializeWith: aPosition

	position := aPosition ! !

!PlacingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:53:37'!
position

	^position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingXMove class' category: #TerniLapilli!
PlacingXMove class
	instanceVariableNames: ''!

!PlacingXMove class methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:35:56'!
for: aPosition

	^self new initializeWith: aPosition.! !


!classDefinition: #SlidingXMove category: #TerniLapilli!
PlayingXMove subclass: #SlidingXMove
	instanceVariableNames: 'positionTo positionFrom'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:43:44'!
accept: aVisitor

	aVisitor visitSlidingX: self.! !

!SlidingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:57:42'!
initializeWith: aPosition and: anotherPosition

	positionTo := anotherPosition.
	positionFrom := aPosition ! !

!SlidingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:54:04'!
positionFrom

	^positionFrom.! !

!SlidingXMove methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:53:52'!
positionTo

	^positionTo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingXMove class' category: #TerniLapilli!
SlidingXMove class
	instanceVariableNames: ''!

!SlidingXMove class methodsFor: 'as yet unclassified' stamp: 'TA 11/12/2018 01:57:31'!
from: aPosition to: anotherPosition
	
	^self new initializeWith: aPosition and: anotherPosition.! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 12:13:10'!
isOver
	
	^false! !


!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:06:17'!
isPlacingX
	
	^false! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:15:12'!
isPlayingO
	
	^false! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:14:00'!
isPlayingX
	
	^false! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 11:29:36'!
isSlidingX
	
	^false! !


!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:03:55'!
putOAt: aPosition
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:04:00'!
putXAt: aPosition
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPosition
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPosition
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'HAW 11/8/2018 11:21:36'!
for: aTerniLapilli 

	| stateClass |
	
	stateClass := self allSubclasses detect: [:anStateClass | anStateClass isFor: aTerniLapilli ].	
	^stateClass new initializeFor: aTerniLapilli ! !


!TerniLapilliState class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:21:46'!
isFor: aTerniLapilli 

	^self subclassResponsibility ! !


!classDefinition: #GameOverState category: #TerniLapilli!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 12:15:43'!
isOver

	^ true.! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:08:57'!
putOAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:09:02'!
putXAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !


!GameOverState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!GameOverState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOverState class' category: #TerniLapilli!
GameOverState class
	instanceVariableNames: ''!

!GameOverState class methodsFor: 'state selection' stamp: 'TA 11/11/2018 23:13:18'!
isFor: aTerniLapilli 

	^ false! !


!classDefinition: #OWonState category: #TerniLapilli!
GameOverState subclass: #OWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OWonState methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:13:48'!
accept: aVisitor

	aVisitor visitOWonState: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OWonState class' category: #TerniLapilli!
OWonState class
	instanceVariableNames: ''!

!OWonState class methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:12:37'!
isFor: aTerniLapilli


	^aTerniLapilli hasPlayerOWon.! !


!classDefinition: #XWonState category: #TerniLapilli!
GameOverState subclass: #XWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XWonState methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:13:59'!
accept: aVisitor

	aVisitor visitXWonState: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XWonState class' category: #TerniLapilli!
XWonState class
	instanceVariableNames: ''!

!XWonState class methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:13:11'!
isFor: aTerniLapilli

	^aTerniLapilli hasPlayerXWon.! !


!classDefinition: #PlayingO category: #TerniLapilli!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !


!PlayingO methodsFor: 'sliding' stamp: 'TA 11/11/2018 22:58:06'!
accept: aVisitor

	aVisitor visitPlayingO: self.! !

!PlayingO methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion

	game slideXWhenPlayingOFrom: aPosition to: anotherPostion .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TerniLapilli!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:23:04'!
isFor: aTerniLapilli 

	^false! !


!classDefinition: #PlacingO category: #TerniLapilli!
PlayingO subclass: #PlacingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlacingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:10:45'!
putOAt: aPosition

	game putOWhenPlacingOAt: aPosition ! !

!PlacingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 13:05:38'!
putXAt: aPosition

	game putXWhenPlacingOAt: aPosition ! !


!PlacingO methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion

	game slideOWhenPlacingOFrom: aPosition to: anotherPostion .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingO class' category: #TerniLapilli!
PlacingO class
	instanceVariableNames: ''!

!PlacingO class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 12:07:43'!
isFor: aTerniLapilli 

	^aTerniLapilli isPlacingX and: [ aTerniLapilli hasPlayerXWon not ] ! !


!classDefinition: #SlidingO category: #TerniLapilli!
PlayingO subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:11:14'!
putOAt: aPosition

	game putOWhenSlidingOAt: aPosition ! !

!SlidingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:04:38'!
putXAt: aPosition

	game putXWhenSlidingXAt: aPosition ! !


!SlidingO methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion
 
	game slideOWhenSlidingOFrom: aPosition to: anotherPostion .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingO class' category: #TerniLapilli!
SlidingO class
	instanceVariableNames: ''!

!SlidingO class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:57:15'!
isFor: aTerniLapilli 

	^aTerniLapilli isSlidingX and: [ aTerniLapilli hasPlayerXWon not ]! !


!classDefinition: #PlayingX category: #TerniLapilli!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'sliding' stamp: 'TA 11/11/2018 22:57:41'!
accept: aVisitor

	aVisitor visitPlayingX: self.! !

!PlayingX methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion
 
	game slideOWhenPlayingXFrom: aPosition to: anotherPostion .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TerniLapilli!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:25:23'!
isFor: aTerniLapilli 

	^false! !


!classDefinition: #PlacingX category: #TerniLapilli!
PlayingX subclass: #PlacingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlacingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 13:52:28'!
putOAt: aPosition

	game putOWhenPlacingXAt: aPosition ! !

!PlacingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 11:58:08'!
putXAt: aPosition

	game putXWhenPlacingXAt: aPosition ! !


!PlacingX methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion

	game slideXWhenPlacingXFrom: aPosition to: anotherPostion .! !


!PlacingX methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:06:28'!
isPlacingX

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingX class' category: #TerniLapilli!
PlacingX class
	instanceVariableNames: ''!

!PlacingX class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:25:47'!
isFor: aTerniLapilli 

	^aTerniLapilli isPlayingO and: [ aTerniLapilli hasXMorePiecesToPlace]! !


!classDefinition: #SlidingX category: #TerniLapilli!
PlayingX subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 14:51:46'!
putOAt: aPosition

	game putOWhenSlidingXAt: aPosition ! !

!SlidingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:00:12'!
putXAt: aPosition

	game putXWhenSlidingXAt: aPosition ! !


!SlidingX methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion
 
	game slideXWhenSlidingXFrom: aPosition to: anotherPostion .! !


!SlidingX methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 11:29:47'!
isSlidingX

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingX class' category: #TerniLapilli!
SlidingX class
	instanceVariableNames: ''!

!SlidingX class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:57:36'!
isFor: aTerniLapilli 

	^aTerniLapilli isPlayingO and: [ aTerniLapilli hasXMorePiecesToPlace not and: [ aTerniLapilli hasPlayerOWon not ]]! !


!classDefinition: #TerniLapilliViewObserver category: #TerniLapilli!
Object subclass: #TerniLapilliViewObserver
	instanceVariableNames: 'lines game stateLine'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:12:18'!
board

	| content |

	content := String streamContents: [ :stream |
		self printOneLine: (lines at: 1) in: stream.
		self printSeparatorIn: stream.
		self printOneLine: (lines at: 2) in: stream.
		self printSeparatorIn: stream.
		self printOneLine: (lines at: 3) in: stream.
		
		stream nextPutAll: stateLine; newLine.
		].
	
	^ReadStream on: content.! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:25:34'!
clear: aPosition 

	| line |

	line _	lines at: aPosition x.
	line at: aPosition y put: $ .! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:03:11'!
observe: aGame

	game := aGame.
	lines := OrderedCollection new.
	3 timesRepeat: [ lines add: (OrderedCollection with: $ with: $ with: $ ). ].
	aGame addStateObserver: self.
	
	stateLine :='Playing X'.
	
	! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:10:20'!
printOneLine: aLine in: aStream
	
	aStream nextPutAll: (aLine at: 1) asString , '|', (aLine at: 2) asString, '|', (aLine at: 3) asString; newLine.! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:10:42'!
printSeparatorIn: aStream
	
	aStream nextPutAll: '-----'; newLine.! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:25:49'!
putOIn: aPosition 

	| line |
	
	line _ lines at: aPosition x.
	line at: aPosition y put: $O.! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:25:01'!
putXIn: aPosition 

	| line |
	
	line _ lines at: aPosition x.
	line at: aPosition y put: $X.! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 09:34:33'!
refreshState: anState

	(anState isKindOf: OWonState) ifTrue: [stateLine := 'O Won!!'].
	(anState isKindOf: XWonState) ifTrue: [stateLine := 'X Won!!'].
	! !

!TerniLapilliViewObserver methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:14:50'!
update: aState

	stateLine := (TerniLapilliViewStateVisitor for: aState) value.
	(TerniLapilliLastPlayRefreshViewVisitor for: game lastPlay and: self) value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliViewObserver class' category: #TerniLapilli!
TerniLapilliViewObserver class
	instanceVariableNames: ''!

!TerniLapilliViewObserver class methodsFor: 'as yet unclassified' stamp: 'TA 11/11/2018 23:50:04'!
on: aGame

	^self new observe: aGame.! !


!classDefinition: #TerniLapilliViewStateVisitor category: #TerniLapilli!
Object subclass: #TerniLapilliViewStateVisitor
	instanceVariableNames: 'state line'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliViewStateVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:16:14'!
initializeWith: anState

	state := anState.! !

!TerniLapilliViewStateVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:16:19'!
value

	state accept: self.
	^line.! !

!TerniLapilliViewStateVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:17:55'!
visitOWonState: anState.

	line := 'O Won!!'.! !

!TerniLapilliViewStateVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:18:03'!
visitPlayingO: anState.
	
	line := 'Playing O'! !

!TerniLapilliViewStateVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:18:16'!
visitPlayingX: anState.

	line := 'Playing X'.! !

!TerniLapilliViewStateVisitor methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:17:45'!
visitXWonState: anState.

	line := 'X Won!!'
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliViewStateVisitor class' category: #TerniLapilli!
TerniLapilliViewStateVisitor class
	instanceVariableNames: ''!

!TerniLapilliViewStateVisitor class methodsFor: 'as yet unclassified' stamp: 'T 11/12/2018 11:20:23'!
for: anState

	^ self new initializeWith: anState.! !
