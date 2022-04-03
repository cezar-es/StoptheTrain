extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete


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
	var itemGiven = 0
	var anyItem = 0
	for item in items:
		if item != 0:
			anyItem = 1
		if item == 1:
			itemGiven = 1
			title.text = "Train Driver Grimm"
			dialogue.text = "...A penny? Are you fu- Wait."
			yield()
			dialogue.text = "Oh, it's rare limited edition coin from 1776!"
			yield()
			dialogue.text = "Hhm, I guess I *could* accept this... But I must admit, that was desperate of you."
			yield()
			emit_signal("loseItem",1)
			emit_signal("dialogueEnd")
			emit_signal("tradeComplete")
			break
		if item == 2:
			itemGiven = 1
			title.text = "Train Driver Grimm"
			dialogue.text = "...Where did you got that TV? We don't have any on this train."
			yield()
			title.text = "Mark"
			dialogue.text = "It's magic. *winks*"
			yield()
			title.text = "Train Driver Grimm"
			dialogue.text = "Alright? If you can magic me more stuff, that would be great."
			yield()
			emit_signal("loseItem",2)
			emit_signal("dialogueEnd")
			emit_signal("tradeComplete")
			break
		if item == 5:
			itemGiven = 1
			title.text = "Train Driver Grimm"
			dialogue.text = "Hey."
			yield()
			dialogue.text = "Nice clock."
			yield()
			emit_signal("loseItem",5)
			emit_signal("dialogueEnd")
			emit_signal("tradeComplete")
			break
		if item == 7:
			itemGiven = 1
			title.text = "Train Driver Grimm"
			dialogue.text = "Oh, a porcelain rooster!"
			yield()
			dialogue.text = "I actually have a collection of these."
			yield()
			dialogue.text = "It's not worth much, but it's pretty, I'll accept it."
			yield()
			dialogue.text = "This will make a fine addition to my collection."
			yield()
			emit_signal("loseItem",7)
			emit_signal("dialogueEnd")
			emit_signal("tradeComplete")
			break
		if item == 8:
			itemGiven = 1
			title.text = "Train Driver Grimm"
			dialogue.text = "You know, I was the one who put free gold on this train."
			yield()
			dialogue.text = "It feels like cheating the system."
			yield()
			dialogue.text = "But promise is promise, I will slow the train down."
			yield()
			emit_signal("loseItem",8)
			emit_signal("dialogueEnd")
			emit_signal("tradeComplete")
			break
	if itemGiven == 0:
		if anyItem == 1:
			title.text = "Train Driver Grimm"
			dialogue.text = "I'm not slowing for THAT. If you want it that badly, bring me something that has decent monetary value."
			yield()
			emit_signal("dialogueEnd")
		else:
			title.text = "Train Driver Grimm"
			dialogue.text = "So? What are you waiting for? I'm not going to have a change of heart."
			yield()
			dialogue.text = "Recreational train driving is SERIOUS business. SERIOUS."
			yield()
			emit_signal("dialogueEnd")
