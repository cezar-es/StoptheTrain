#Stop the Train 1.0 by oldcezar
#Today spaghetti is on the menu.
#Seriously, don't use this code for reference, it's abomination.
extends Node2D

var gaming = 2 #1 - main game loop, 2 - talking
var inDialogue = 0
var playerSpeed = 160
var currentScreen = 2
var items = [0,0,0,0,0,0,0,0,0,0]
var canTalk = 0
var talkObject
var backScroll = 1
var trainSpeed = 500
var itemsLeft = 5

#Item list for reference:
#0 - none
#1 - penny
#2 - tv
#3 - contract
#4 - coffee
#5 - clock
#6 - candy
#7 - figurine
#8 - gold
#100 - testitem

func _ready():
	playIntro()


func _process(delta):
	#Timer
	if $TimeLeft/Timer.time_left>16:
		if int($TimeLeft/Timer.time_left)%60>=10:
			$TimeLeft.bbcode_text="[center]"+str(int($TimeLeft/Timer.time_left/60))+":"+str(int($TimeLeft/Timer.time_left)%60)+"[/center]"
		else:
			$TimeLeft.bbcode_text="[center]"+str(int($TimeLeft/Timer.time_left/60))+":0"+str(int($TimeLeft/Timer.time_left)%60)+"[/center]"
	else:
		if int($TimeLeft/Timer.time_left)%60>=10:
			$TimeLeft.bbcode_text="[color=red][center]"+str(int($TimeLeft/Timer.time_left/60))+":"+str(int($TimeLeft/Timer.time_left)%60)+"[/center][/color]"
		else:
			$TimeLeft.bbcode_text="[color=red][center]"+str(int($TimeLeft/Timer.time_left/60))+":0"+str(int($TimeLeft/Timer.time_left)%60)+"[/center][/color]"
	#Background scroll
	if backScroll == 1:
		$ScrollingBackground.position.x-=trainSpeed*delta
		if $ScrollingBackground.position.x<-400:
			$ScrollingBackground.position.x=400
	#In main game
	if gaming==1:
		#Movement stuff
		if Input.is_action_pressed("ui_left"):
			$Player.position.x-=playerSpeed*delta
		if Input.is_action_pressed("ui_right"):
			$Player.position.x+=playerSpeed*delta
		if Input.is_action_pressed("ui_down"):
			$Player.position.y+=playerSpeed*delta
		if Input.is_action_pressed("ui_up"):
			$Player.position.y-=playerSpeed*delta
		if currentScreen==2:
			$Player.position.x=clamp($Player.position.x, 50, 330)
			$Player.position.y=clamp($Player.position.y, 265, 400)
		elif currentScreen==0:
			$Player.position.x=clamp($Player.position.x, 125, 750)
			$Player.position.y=clamp($Player.position.y, 265, 400)
		else:
			$Player.position.x=clamp($Player.position.x, 50, 750)
			$Player.position.y=clamp($Player.position.y, 265, 400)
		#Sprite of protagonist
		if Input.is_action_pressed("ui_down")&&!Input.is_action_pressed("ui_up"):
			$Player.animation="vwalk"
		elif Input.is_action_pressed("ui_up")&&!Input.is_action_pressed("ui_down"):
			$Player.animation="bwalk"
		elif Input.is_action_pressed("ui_left")&&!Input.is_action_pressed("ui_right"):
			$Player.animation="walk"
			$Player.flip_h=false
		elif Input.is_action_pressed("ui_right")&&!Input.is_action_pressed("ui_left"):
			$Player.animation="walk"
			$Player.flip_h=true
		else:
			$Player.animation="idle"
		#Screen changing
		if $Player.position.x<100:
			currentScreen-=1
			screenChange(currentScreen)
			$Player.position.x=675
		if $Player.position.x>700:
			currentScreen+=1
			screenChange(currentScreen)
			$Player.position.x=125
		#Talking start
		if canTalk!=0&&Input.is_action_just_pressed("ui_accept"):
			gaming = 2;
			$text1.visible=false
			$TimeLeft/Timer.paused=true
			$areaCoffee/Timer.paused = true
			$areaCandy/Timer.paused = true
			$Player.animation="idle"
			switchToDialogueBox()
			talkObject.talkingStart(items)
	#In talking
	elif gaming==2:
		$GUIBox/Portrait.animation = $DialB/TitleBox.text
		#Next line of dialogue or end of dialogue
		if Input.is_action_just_pressed("ui_accept"):
			talkObject.talkingContinue()

#Functions

func screenChange(newscreen):
	$testarea/Col.disabled = true
	$testarea.visible = false
	$areaGranny/Col.disabled = true
	$areaGranny.visible = false
	$areaDriver/Col.disabled = true
	$areaDriver.visible = false
	$areaSanta/Col.disabled = true
	$areaSanta.visible = false
	$areaSleeping/Col.disabled = true
	$areaSleeping.visible = false
	$areaCoffee/Col.disabled = true
	$areaCoffee.visible = false
	$areaAnnoyed/Col.disabled = true
	$areaAnnoyed.visible = false
	$areaTroll/Col.disabled = true
	$areaTroll.visible = false
	$areaUrgent/Col.disabled = true
	$areaUrgent.visible = false
	$areaJester/Col.disabled = true
	$areaJester.visible = false
	$areaCandy/Col.disabled = true
	$areaCandy.visible = false
	if newscreen == 0:
		$Background.animation = "trainroom0"
		$testarea/Col.disabled = false
		$testarea.visible = true
		$areaSanta/Col.disabled = false
		$areaSanta.visible = true
		$areaCoffee/Col.disabled = false
		$areaCoffee.visible = true
		$areaAnnoyed/Col.disabled = false
		$areaAnnoyed.visible = true
		$areaTroll/Col.disabled = false
		$areaTroll.visible = true
		$areaJester/Col.disabled = false
		$areaJester.visible = true
	if newscreen == 1:
		$Background.animation = "trainroom1"
		$areaGranny/Col.disabled = false
		$areaGranny.visible = true
		$areaSleeping/Col.disabled = false
		$areaSleeping.visible = true
		$areaUrgent/Col.disabled = false
		$areaUrgent.visible = true
		$areaCandy/Col.disabled = false
		$areaCandy.visible = true
	if newscreen == 2:
		$Background.animation = "trainroom2"
		$areaDriver/Col.disabled = false
		$areaDriver.visible = true

func switchToDialogueBox():
	$DialB.visible=true
	$ItemSprites.visible=false
	$GUIBox.animation="DialogueBox"
	$GUIBox/Portrait.visible=true

func switchToItemBox():
	$DialB.visible=false
	$ItemSprites.visible=true
	$GUIBox.animation="ItemBox"
	$GUIBox/Portrait.visible = false

func playIntro():
	talkObject = $EndingHandler
	$EndingHandler.talkingStart(0)

func playOutroGood():
	$Player.visible=false
	$TimeLeft.visible=false
	$TimeLeftBox.visible=false
	gaming = 2;
	$text1.visible=false
	$TimeLeft/Timer.paused=true
	$areaCoffee/Timer.paused = true
	$areaCandy/Timer.paused = true
	switchToDialogueBox()
	talkObject = $EndingHandler
	$EndingHandler.talkingStart(1)

func playOutroBad():
	$Player.visible=false
	$TimeLeft.visible=false
	$TimeLeftBox.visible=false
	gaming = 2;
	$text1.visible=false
	$TimeLeft/Timer.paused=true
	$areaCoffee/Timer.paused = true
	$areaCandy/Timer.paused = true
	switchToDialogueBox()
	talkObject = $EndingHandler
	$EndingHandler.talkingStart(2)


#Triggers

#On dialogue proposition
func _on_PlayerBox_area_entered(talkarea):
	canTalk = 1
	talkObject = talkarea
	$text1.visible=true
func _on_PlayerBox_area_exited(_area):
	canTalk = 0
	$text1.visible=false
func _on_dialogueEnd():
	gaming = 1
	$text1.visible=true
	$TimeLeft/Timer.paused = false
	$areaCandy/Timer.paused = false
	$areaCoffee/Timer.paused = false
	switchToItemBox()
func _on_giveItem(itemid):
	for item in items.size():
		if items[item]==0:
			items[item]=itemid
			get_node("ItemSprites/Item"+str(item+1)).animation = str(itemid)
			break
func _on_loseItem(itemid):
	for item in items.size():
		if items[item]==itemid:
			items[item]=0
			get_node("ItemSprites/Item"+str(item+1)).animation = "0"
			break
func _on_tradeComplete():
	$TimeLeft/Timer.start($TimeLeft/Timer.time_left*2)
	trainSpeed = trainSpeed/2
	itemsLeft -= 1
	if itemsLeft==0:
		playOutroGood()
func _on_Timer_timeout():
	playOutroBad()
func _on_EndingHandler_gameStart():
	$TimeLeft/Timer.start()
	$areaCandy/Timer.start()
	$Player.visible=true
	$areaDriver.visible=true
	$text1.visible=false
	$TimeLeft.visible=true
	$TimeLeftBox.visible=true
