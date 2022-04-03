extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var awoken = 0
var doneTalking = 0

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
	if awoken == 0:
		title.text = "Mark"
		dialogue.text = "HELLO? CAN YOU WAKE UP PLEASE SO I CAN HELP SAVE MY GIRLFRIEND?"
		yield()
		dialogue.text = "it's no use, he's not waking up."
		yield()
		var hasCoffee = 0
		for item in items:
			if item == 4:
				hasCoffee = 1
				break
		if hasCoffee == 0:
			dialogue.text = "Maybe there's something that could help."
			yield()
			emit_signal("dialogueEnd")
		else:
			dialogue.text = "Maybe the aroma of coffee will wake him up."
			yield()
			title.text = "Inspector Herrington"
			dialogue.text = "Zzzzz... Hmm?"
			yield()
			dialogue.text = "Is that café au lait?"
			yield()
			dialogue.text = "Thank you young man, is there anything I can do for you?"
			$AnimatedSprite.animation = "awoken"
			yield()
			title.text = "Mark"
			dialogue.text = "I need your help, I need to stop this train before it kills my girlfriend, but the driver wants something in return for slowing down."
			yield()
			title.text = "Inspector Herrington"
			dialogue.text = "Dagnabbit, this is serious! Please take my golden watch. You will need it more than I do."
			yield()
			title.text = "Mark"
			dialogue.text = "Thank you sir!"
			yield()
			title.text = "Inspector Herrington"
			dialogue.text = "Now go and hurry up! I wish you the best of luck!"
			yield()
			awoken = 1
			emit_signal("loseItem",4)
			emit_signal("giveItem",5)
			emit_signal("dialogueEnd")
	elif doneTalking == 0:
		title.text = "Inspector Herrington"
		dialogue.text = "I don't have anything more with myself right now, please try to ask other strangers."
		yield()
		doneTalking = 1
		emit_signal("dialogueEnd")
	else:
		title.text = "Inspector Herrington"
		dialogue.text = "I can invite you to my estate if you want to talk more, but now it isn't the time!"
		yield()
		emit_signal("dialogueEnd")
