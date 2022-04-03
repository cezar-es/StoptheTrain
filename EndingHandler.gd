extends Node2D

var talkState
var dialogue
var title

signal dialogueEnd
signal gameStart

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
	if items==0:
		$Images.animation="a1"
		title.text = "Mark"
		dialogue.text = "What a nice day outside, a perfect day for pressing Z to continue."
		yield()
		dialogue.text = "I hope nothing bad happens when I ride this train belonging to amateur train driver."
		yield()
		dialogue.text = "Huh, my phone's ringing."
		yield()
		dialogue.text = "*beep* Hello?"
		yield()
		title.text = "Your neighbor"
		dialogue.text = "Hello. I wanted to say that I kidnapped your girlfriend and tied her to rails of the train R42."
		yield()
		$Images.animation="a2"
		title.text = "Mark"
		dialogue.text = "WHAT? I'm on that train!"
		yield()
		dialogue.text = "And why did you even do that?!"
		yield()
		title.text = "Your neighbor"
		dialogue.text = "You see, I'm actually a serial killer wanted in 73 countries."
		yield()
		dialogue.text = "Soon to be in 74."
		yield()
		dialogue.text = "Anyways I got people to murder so see ya. *beep*"
		yield()
		title.text = "Mark"
		dialogue.text = "What now?! This train could run over her before somebody unties her."
		yield()
		$Images.animation="a3"
		dialogue.text = "MISTER PLEASE SLOW DOWN MY GIRLFRIEND IS TIED TO THE TRACKS."
		yield()
		title.text = "Train Driver Grimm"
		dialogue.text = "Hell no, I didn't invite you to board my train anytime you want so you could interrupt me."
		yield()
		title.text = "Mark"
		dialogue.text = "SHE'S GOING TO DIE."
		yield()
		title.text = "Train Driver Grimm"
		dialogue.text = "STOP YELLING."
		yield()
		dialogue.text = "Let's make a deal:"
		yield()
		dialogue.text = "You bring me right now something that I could sell and buy myself new parts for my beloved train,"
		yield()
		dialogue.text = "and I will slow by 50%, which will DOUBLE the time until crash."
		yield()
		dialogue.text = "Deal?"
		yield()
		title.text = "Mark"
		dialogue.text = "Can I do it multiple times?"
		yield()
		title.text = "Train Driver Grimm"
		dialogue.text = "I mean, if you have so much stuff with you then yes."
		yield()
		title.text = "Mark"
		dialogue.text = "I can't believe you want me to pay you so my girlfriend won't die."
		yield()
		title.text = "Train Driver Grimm"
		dialogue.text = "Listen buddy, recreational train driving is SERIOUS business."
		yield()
		title.text = "Mark"
		dialogue.text = "Okay..."
		yield()
		$Images.visible=false
		emit_signal("dialogueEnd")
		emit_signal("gameStart")
	if items==1:
		$Images.visible=true
		$Images.animation="b1"
		title.text = "Mark"
		dialogue.text = "WHY IS TRAIN STILL GOING?"
		yield()
		title.text = "Train Driver Grimm"
		dialogue.text = "Hey, I never talked about stopping it."
		yield()
		$Images.animation="b2"
		title.text = "Mark"
		dialogue.text = "THEN I'LL STOP IT MYSELF!"
		yield()
		title.text = "Train Driver Grimm"
		dialogue.text = "Wait, you have no idea how it works, you're speeding it up-"
		yield()
		items=2
	if items==2:
		$Images.visible=true
		$Images.animation="c1"
		title.text = "Mark"
		dialogue.text = "*THUD*"
		yield()
		dialogue.text = "..."
		yield()
		dialogue.text = "Oh no..."
		yield()
		$Images.animation="c2"
		dialogue.text = "OH N- *beep*"
		yield()
		dialogue.text = "yes...?"
		yield()
		title.text = "Juliet"
		dialogue.text = "Hi honey, how are you doing?"
		yield()
		$Images.animation="c3"
		title.text = "Mark"
		dialogue.text = "Wait what, are you alive?"
		yield()
		title.text = "Juliet"
		dialogue.text = "What?"
		yield()
		title.text = "Your neighbor"
		dialogue.text = "Hey miss Juliet, who are you talking to?"
		yield()
		title.text = "Juliet"
		dialogue.text = "To my boyfriend, but he's acting strange."
		yield()
		title.text = "Your neighbor"
		dialogue.text = "Hah, probably because I told him that I tied you to train tracks or something."
		yield()
		dialogue.text = "I put doll on the tracks so when he fells the bump he will freak out. I guess it worked."
		yield()
		title.text = "Juliet"
		dialogue.text = "Lol."
		yield()
		title.text = "Your neighbor"
		dialogue.text = "Mark, if you hear this, happy Japes Day!"
		yield()
		title.text = "Mark"
		dialogue.text = "Wha..."
		yield()
		title.text = "Jester"
		dialogue.text = "Oh my, it seems that someone fooled you before I even had the chance."
		yield()
		$Images.animation="c4"
		dialogue.text = "Didn't I tell you? It's inevitable. Being on guard is just delaying it."
		yield()
		dialogue.text = "We're all clowns in this clown world."
		yield()
		dialogue.text = "Don't be so sad now. Let's get coffee and think of the plan to fool your neighbor back!"
		yield()
		title.text = "???"
		dialogue.text = "What kind of revenge will Mark plan?"
		yield()
		dialogue.text = "Well, it's story for another day..."
		yield()
		dialogue.text = "Thanks for playing!"
		get_parent().gaming=0
