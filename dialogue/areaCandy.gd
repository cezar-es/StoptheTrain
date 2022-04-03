extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var candyGiven = 0
var pondering = 0

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
	if candyGiven == 0:
		if $Timer.is_stopped()||get_parent().itemsLeft == 1:
			title.text = "Bob"
			dialogue.text = "Okay, I won't eat my candy."
			yield()
			dialogue.text = "Do you want it?"
			yield()
			title.text = "Mark"
			dialogue.text = "Yes, sure."
			yield()
			title.text = "Bob"
			dialogue.text = "Here you go."
			$AnimatedSprite.animation = "nocandy"
			yield()
			dialogue.text = "...Now I regret it."
			yield()
			dialogue.text = "Give it back."
			yield()
			title.text = "Mark"
			dialogue.text = "No."
			yield()
			candyGiven = 1
			emit_signal("giveItem",6)
			emit_signal("dialogueEnd")
		elif pondering == 0:
			title.text = "Bob"
			dialogue.text = "I'm pondering if I want to eat my candy."
			yield()
			title.text = "Mark"
			dialogue.text = "If you don't want it, can I have it?"
			yield()
			title.text = "Bob"
			dialogue.text = "Yes, but come back when I end pondering."
			yield()
			pondering = 1
			emit_signal("dialogueEnd")
		else:
			title.text = "Bob"
			dialogue.text = "Still pondering, come back later."
			yield()
			emit_signal("dialogueEnd")
	else:
		title.text = "Bob"
		dialogue.text = "Give my candy back."
		yield()
		title.text = "Mark"
		dialogue.text = "No."
		yield()
		emit_signal("dialogueEnd")
