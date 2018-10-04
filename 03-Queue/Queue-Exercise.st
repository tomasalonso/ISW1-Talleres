!classDefinition: #QueueTest category: #'Queue-Exercise'!
TestCase subclass: #QueueTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test01QueueShouldBeEmptyWhenCreated

	| queue |

	queue _ Queue new.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test02EnqueueAddElementsToTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.

	self deny: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test03DequeueRemovesElementsFromTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test04DequeueReturnsFirstEnqueuedObject

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'Something1'.
	secondQueued _ 'Something2'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.
	
	self assert: queue dequeue equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'CGCM 9/27/2018 16:34:58'!
test05QueueBehavesFIFO

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'First'.
	secondQueued _ 'Second'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.

	self assert: queue dequeue equals: firstQueued.
	self assert: queue dequeue equals: secondQueued.
	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test06NextReturnsFirstEnqueuedObject

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	self assert: queue next equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test07NextDoesNotRemoveObjectFromQueue

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	queue next.
	self assert: queue size equals: 1.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test08CanNotDequeueWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.
	
	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test09CanNotDequeueWhenThereAreNoObjectsInTheQueueAndTheQueueHadObjects

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test10CanNotNextWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.

	self
		should: [ queue next ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !


!classDefinition: #DequeueAndNextController category: #'Queue-Exercise'!
Object subclass: #DequeueAndNextController
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DequeueAndNextController class' category: #'Queue-Exercise'!
DequeueAndNextController class
	instanceVariableNames: ''!

!DequeueAndNextController class methodsFor: 'instance creation' stamp: 'T 10/2/2018 20:03:59'!
controllerFor: aQueue

	| queueType |

	queueType _ self subclasses detect: [ :aQueueType | aQueueType isFor: aQueue ].
	
	^ queueType for: aQueue.
	! !


!classDefinition: #EmptyQueue category: #'Queue-Exercise'!
DequeueAndNextController subclass: #EmptyQueue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!EmptyQueue methodsFor: 'safe operations' stamp: 'TA 10/2/2018 13:53:14'!
safeDequeue
	
	self error: Queue queueEmptyErrorDescription
 ! !

!EmptyQueue methodsFor: 'safe operations' stamp: 'TA 10/2/2018 13:53:23'!
safeNext
	
	self error: Queue queueEmptyErrorDescription
 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyQueue class' category: #'Queue-Exercise'!
EmptyQueue class
	instanceVariableNames: ''!

!EmptyQueue class methodsFor: 'instance creation' stamp: 'T 10/2/2018 20:04:49'!
for: aQueue

	^ self new! !

!EmptyQueue class methodsFor: 'instance creation' stamp: 'T 10/2/2018 20:03:07'!
isFor: aQueue

	^ aQueue isEmpty! !


!classDefinition: #QueueWithContent category: #'Queue-Exercise'!
DequeueAndNextController subclass: #QueueWithContent
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueWithContent methodsFor: 'safe operations' stamp: 'T 10/2/2018 20:02:09'!
safeDequeue

	^ queue safeDequeue ! !

!QueueWithContent methodsFor: 'safe operations' stamp: 'TA 10/2/2018 13:54:58'!
safeNext

	^ queue safeNext! !


!QueueWithContent methodsFor: 'initialization' stamp: 'T 10/2/2018 20:05:21'!
initializeFor: aQueue

	queue := aQueue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'QueueWithContent class' category: #'Queue-Exercise'!
QueueWithContent class
	instanceVariableNames: ''!

!QueueWithContent class methodsFor: 'instance creation' stamp: 'T 10/2/2018 20:04:57'!
for: aQueue

	^ self new initializeFor: aQueue! !

!QueueWithContent class methodsFor: 'instance creation' stamp: 'T 10/2/2018 20:03:00'!
isFor: aQueue

	^ aQueue isEmpty not! !


!classDefinition: #Queue category: #'Queue-Exercise'!
Object subclass: #Queue
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!Queue methodsFor: 'initialization' stamp: 't g 10/1/2018 21:44:38'!
initialize

	super initialize.
	contents := OrderedCollection new.! !


!Queue methodsFor: 'operations' stamp: 't g 10/4/2018 15:57:23'!
dequeue
	
	^ (DequeueAndNextController controllerFor: self) safeDequeue	! !

!Queue methodsFor: 'operations' stamp: 't g 10/1/2018 21:46:16'!
enqueue: anObject

	contents addLast: anObject! !

!Queue methodsFor: 'operations' stamp: 't g 10/4/2018 15:57:23'!
next

	^ (DequeueAndNextController controllerFor: self) safeNext	
	! !


!Queue methodsFor: 'testing' stamp: 't g 10/1/2018 21:45:06'!
isEmpty

	^ contents isEmpty! !

!Queue methodsFor: 'testing' stamp: 't g 10/1/2018 21:51:32'!
size

	^ contents size! !


!Queue methodsFor: 'safe operations' stamp: 'T 10/2/2018 20:06:21'!
safeDequeue

	^ contents removeFirst ! !

!Queue methodsFor: 'safe operations' stamp: 'TA 10/2/2018 13:55:46'!
safeNext

	^ contents first! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Queue class' category: #'Queue-Exercise'!
Queue class
	instanceVariableNames: ''!

!Queue class methodsFor: 'error descriptions' stamp: 't g 10/1/2018 21:55:29'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !
