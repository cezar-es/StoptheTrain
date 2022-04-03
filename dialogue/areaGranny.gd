extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var pennyGiven = 0
var complaint = 0
var candyGiven = 0

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
	if pennyGiven == 0:
		title.text = "Mark"
		dialogue.text = "Excuse me, do you have something that could convince train driver to make train slower?"
		yield()
		title.text = "Granny Agnes"
		dialogue.text = "Oh poor soul, of course I will give you something."
		yield()
		dialogue.text = "There, have a penny. This will surely convince that speedy daredevil to ride more carefully."
		yield()
		title.text = "Mark"
		dialogue.text = "...Thanks, I guess?"
		yield()
		pennyGiven = 1
		emit_signal("giveItem",1)
		emit_signal("dialogueEnd")
	elif complaint == 0:
		title.text = "Granny Agnes"
		dialogue.text = "Grimm is a sweetheart, but I wish he'd slow down a little."
		yield()
		dialogue.text = "He always looks for more and more thrill, but sometimes you need to calm down and enjoy the world at slower pace."
		yield()
		dialogue.text = "Not to mention that he gets very rude when he gets distracted during train rides."
		yield()
		complaint = 1
		emit_signal("dialogueEnd")
	elif candyGiven == 0:
		title.text = "Granny Agnes"
		dialogue.text = "Do you want something else, young man?"
		yield()
		title.text = "Mark"
		dialogue.text = "No, I'm just starting to run out of ideas what could I possibly do."
		yield()
		title.text = "Granny Agnes"
		dialogue.text = "Don't worry, you'll figure something out. I believe in you."
		yield()
		dialogue.text = "Here, have a candy, so cheer up."
		yield()
		candyGiven = 1
		emit_signal("giveItem",6)
		emit_signal("dialogueEnd")
	else:
		title.text = "Granny Agnes"
		dialogue.text = "It's nice day today, won't you agree, dear?"
		yield()
		emit_signal("dialogueEnd")
