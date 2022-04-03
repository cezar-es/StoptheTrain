extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var quietNow = 0
var questGiven = 0
var questEnded = 0
var okayStop = 0
var stop = 0
var gotIdea = 0

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
	if stop == 1:
		title.text = "June"
		dialogue.text = "..."
		yield()
	elif okayStop == 1:
		title.text = "June"
		dialogue.text = "Give me some peace, I'm sure you have better stuff to do."
		stop = 1
		yield()
		emit_signal("dialogueEnd")
	elif questEnded == 1:
		title.text = "June"
		dialogue.text = "My brother gave it to mee, but I collect only elephant figurines."
		okayStop = 1
		yield()
		emit_signal("dialogueEnd")
	elif quietNow == 1:
		title.text = "June"
		dialogue.text = "Wow, you managed to shut him up."
		yield()
		dialogue.text = "That's impressive."
		yield()
		dialogue.text = "Take this rooster figurine, I've heard you arguing with the driver so maybe this will help."
		yield()
		title.text = "Mark"
		dialogue.text = "Hey, thanks!"
		yield()
		title.text = "June"
		dialogue.text = "You two could be a little quieter too."
		yield()
		questEnded = 1
		emit_signal("giveItem",7)
		emit_signal("dialogueEnd")
	elif gotIdea == 1:
		title.text = "June"
		dialogue.text = "Do something before I resort to violence."
		yield()
		emit_signal("dialogueEnd")
	elif questGiven == 1:
		title.text = "June"
		dialogue.text = "He's still as loud as before."
		yield()
		title.text = "Mark"
		dialogue.text = "Do you have any idea what could shut him up?"
		yield()
		title.text = "June"
		dialogue.text = "I don't know. Music? Candy? Bullet?"
		yield()
		title.text = "Mark"
		dialogue.text = "...I'll continue searching, bye."
		yield()
		gotIdea = 1
		emit_signal("dialogueEnd")
	else:
		title.text = "June"
		dialogue.text = "AGHH won't he ever shut up?!"
		yield()
		dialogue.text = "Hey, you!"
		yield()
		title.text = "Mark"
		dialogue.text = "Me?"
		yield()
		title.text = "June"
		dialogue.text = "Yes, you."
		yield()
		dialogue.text = "You seem worried - so if you help me with my problem, I'll help you with yours."
		yield()
		dialogue.text = "This man keeps shouting and pestering me."
		yield()
		dialogue.text = "Please shut him up."
		yield()
		title.text = "Mark"
		dialogue.text = "Well, if you're going to help with my problem, then I'll see what I can do."
		yield()
		questGiven = 1
		emit_signal("dialogueEnd")



func _on_endTrolling():
	quietNow = 1
	$AnimatedSprite.animation = "calm"
