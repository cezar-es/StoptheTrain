extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var firstTalk = 0

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
		title.text = "Gremlin"
		dialogue.text = "Oh hi Mark."
		yield()
		title.text = "Mark"
		dialogue.text = "How do you know my name?"
		yield()
		title.text = "Gremlin"
		dialogue.text = "I was here from the very beginning."
		yield()
		dialogue.text = "At first I was just testing the train's engine but now I'm just chilling since my work has been done."
		yield()
		firstTalk = 1
		emit_signal("dialogueEnd")
	if firstTalk == 1:
		title.text = "Gremlin"
		dialogue.text = "Do you want to know more?"
		yield()
		dialogue.text = "There was pretty obnoxious dude sitting close to me."
		yield()
		dialogue.text = "But at some point he disappeared. Strange, huh?"
		yield()
		firstTalk = 2
		emit_signal("dialogueEnd")
	elif firstTalk == 2:
		title.text = "Gremlin"
		dialogue.text = "There's more interesting stuff I saw but it's too early for that."
		yield()
		dialogue.text = "Maybe one day?"
		yield()
		firstTalk = 3
		emit_signal("dialogueEnd")
	else:
		title.text = "Gremlin"
		dialogue.text = "The window next to me is stuck and I can't open it. Agh, so hot..."
		yield()
		emit_signal("dialogueEnd")
