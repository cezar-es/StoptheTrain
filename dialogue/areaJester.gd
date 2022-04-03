extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var firstTalk = 0
var randomHint = RandomNumberGenerator.new()
var hint = 1
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
	randomHint.randomize()
	hint = randomHint.randi_range(1,5)
	if firstTalk == 0:
		title.text = "Mark"
		dialogue.text = "Huh, who are you and why are you dressed like that?"
		firstTalk = 1
		yield()
		title.text = "Jester"
		dialogue.text = "My name isn't important, but I'm dressed like that because..."
		yield()
		dialogue.text = "Today is Japes Day."
		yield()
		title.text = "Mark"
		dialogue.text = "Ah, that's right!"
		yield()
		dialogue.text = "I don't know what jape are you planning, but you won't fool me, fool!"
		yield()
		dialogue.text = "I was never fooled by anyone on Japes Day! I'm always on guard!"
		yield()
		title.text = "Jester"
		dialogue.text = "Heh, we will see about that... Hehe..."
		yield()
		dialogue.text = "Don't be so paranoid, I'll fool you someday. It's inevitable."
		yield()
	elif hint == 1:
		title.text = "Jester"
		dialogue.text = "Sometimes shortest and easiest way is the best."
		yield()
		dialogue.text = "Why won't you present him something that you got without effort and hope for best?"
		yield()
		title.text = "Mark"
		dialogue.text = "Yes, sure, that'll just make him angry."
		yield()
	elif hint == 2:
		title.text = "Jester"
		dialogue.text = "It takes 45 seconds to make perfect coffee at this bar."
		yield()
		dialogue.text = "You might want to order it while you can."
		yield()
		title.text = "Mark"
		dialogue.text = "That's very arbitrary number if I ever heard one, making coffee doesn't just take specific amount of time."
		yield()
	elif hint == 3:
		title.text = "Jester"
		dialogue.text = "Red usually means danger."
		yield()
		dialogue.text = "Is there time more urgent that when you see danger?"
		yield()
		title.text = "Mark"
		dialogue.text = "THIS IS URGENT ALREADY."
		yield()
	elif hint == 4:
		title.text = "Jester"
		dialogue.text = "If you want something sweet, you might get it just for spending time with someone."
		yield()
		dialogue.text = "But since that's not enough, getting lucky or patient works too."
		yield()
		title.text = "Mark"
		dialogue.text = "What are you talking about?"
		yield()
	elif hint == 5:
		title.text = "Jester"
		dialogue.text = "See that weirdo waving at us? I'm sure there might be some trick to his bag."
		yield()
		dialogue.text = "Remember, time is your friend."
		yield()
		title.text = "Mark"
		dialogue.text = "Time is only thing I don't have right now."
		yield()
	title.text = "Jester"
	dialogue.text = "Happy Japes Day."
	yield()
	emit_signal("dialogueEnd")
