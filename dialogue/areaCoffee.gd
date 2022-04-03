extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var coffeeOrdered = 0
var annoyed = 0
var coffeeGot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue = get_node("../DialB/DialogueBox")
	title = get_node("../DialB/TitleBox")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func talkingStart(items):
	talkState = talking(items)

func talkingContinue():
	talkState = talkState.resume();

func talking(items):
	if coffeeOrdered == 0:
		title.text = "Barista"
		dialogue.text = "Good morning, what can I serve you today?"
		yield()
		title.text = "Mark"
		dialogue.text = "Any coffee is fine, thanks."
		yield()
		title.text = "Barista"
		dialogue.text = "Please choose one."
		yield()
		title.text = "Mark"
		dialogue.text = "No seriously, I don't have time for that. I'll come back for it, see you later!"
		yield()
		title.text = "Barista"
		dialogue.text = "..."
		yield()
		dialogue.text = "Haven't he realised yet that talking is free action?"
		yield()
		coffeeOrdered = 1
		$Timer.start()
		emit_signal("dialogueEnd")
	elif coffeeGot == 1 && annoyed<4:
		title.text = "Barista"
		dialogue.text = "If you want to order anything else, jest tell me."
		yield()
		emit_signal("dialogueEnd")
	elif coffeeGot == 1 && annoyed>=4:
		title.text = "Barista"
		dialogue.text = "Stop wasting my time."
		yield()
		emit_signal("dialogueEnd")
	elif $Timer.is_stopped()==true && annoyed<4:
		title.text = "Barista"
		dialogue.text = "Here's your coffee sir."
		yield()
		title.text = "Mark"
		dialogue.text = "Thank you so much!"
		yield()
		title.text = "Barista"
		dialogue.text = "Have a nice day!"
		yield()
		coffeeGot = 1
		emit_signal("giveItem",4)
		emit_signal("dialogueEnd")
	elif $Timer.is_stopped()==true && annoyed>=4:
		title.text = "Barista"
		dialogue.text = "There's the coffee, yes it is done, now stop pestering me."
		yield()
		title.text = "Mark"
		dialogue.text = "Thank you so much!"
		yield()
		title.text = "Barista"
		dialogue.text = "Please go away."
		yield()
		coffeeGot = 1
		emit_signal("giveItem",4)
		emit_signal("dialogueEnd")
	elif $Timer.time_left>0 && annoyed==0:
		title.text = "Mark"
		dialogue.text = "Is it done?"
		yield()
		title.text = "Barista"
		dialogue.text = "Not yet, please wait a bit."
		yield()
		annoyed+=1
		emit_signal("dialogueEnd")
	elif $Timer.time_left>0 && annoyed==1:
		title.text = "Mark"
		dialogue.text = "Is it done?"
		yield()
		title.text = "Barista"
		dialogue.text = "No, please wait patiently."
		yield()
		annoyed+=1
		emit_signal("dialogueEnd")
	elif $Timer.time_left>0 && annoyed==2:
		title.text = "Mark"
		dialogue.text = "Is it done?"
		yield()
		title.text = "Barista"
		dialogue.text = "It takes some time to make a coffee, please let me do my job."
		yield()
		annoyed+=1
		emit_signal("dialogueEnd")
	elif $Timer.time_left>0 && annoyed==3:
		title.text = "Mark"
		dialogue.text = "Is it done?"
		yield()
		title.text = "Barista"
		dialogue.text = "God damnit, no it isn't done."
		$AnimatedSprite.animation = "wrath"
		yield()
		annoyed+=1
		emit_signal("dialogueEnd")
	elif $Timer.time_left>0 && annoyed>=4:
		title.text = "Mark"
		dialogue.text = "Is it done?"
		yield()
		title.text = "Barista"
		dialogue.text = "GFHJGFHO0PS NO."
		yield()
		annoyed+=1
		emit_signal("dialogueEnd")
