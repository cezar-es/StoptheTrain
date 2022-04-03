extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var firstTalk = 0
var goldGiven = 0
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
	if firstTalk == 0:
		title.text = "Mark"
		dialogue.text = "Wow, a free gold? My luck is of the charts today!"
		yield()
		dialogue.text = "Um, excuse me, have you already claimed it?"
		yield()
		title.text = "Simon"
		dialogue.text = "No."
		yield()
		title.text = "Mark"
		dialogue.text = "So, could I take it?"
		yield()
		title.text = "Simon"
		dialogue.text = "No."
		yield()
		title.text = "Mark"
		dialogue.text = "W-why? I need it urgently, believe it or not."
		yield()
		title.text = "Simon"
		dialogue.text = "I'm sitting on it."
		yield()
		dialogue.text = "I'm too lazy to move."
		yield()
		dialogue.text = "Ask me when it's really urgent."
		yield()
		firstTalk = 1
		emit_signal("dialogueEnd")
	elif goldGiven == 1:
		title.text = "Simon"
		dialogue.text = "Rude..."
		yield()
		emit_signal("dialogueEnd")
	elif get_node("../TimeLeft/Timer").time_left>16:
		title.text = "Simon"
		dialogue.text = "Doesn't seem urgent to me."
		yield()
		title.text = "Mark"
		dialogue.text = "Agh..."
		yield()
		emit_signal("dialogueEnd")
	elif get_node("../TimeLeft/Timer").time_left<=16:
		title.text = "Mark"
		dialogue.text = "It IS urgent, haven't you heard the whistle?"
		yield()
		title.text = "Simon"
		dialogue.text = "Trains whistle all the time."
		yield()
		title.text = "Mark"
		dialogue.text = "I DON'T HAVE THE TIME!"
		yield()
		dialogue.text = "I'M SORRY!"
		yield()
		title.text = "Simon"
		dialogue.text = "Woah?"
		$AnimatedSprite.animation = "urgent"
		yield()
		emit_signal("giveItem",8)
		goldGiven = 1
		emit_signal("dialogueEnd")
