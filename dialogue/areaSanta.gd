extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var presentGiven = 0
var gigaPresentGiven = 0
var trash1Given = 0
var trash2Given = 0
var trash3Given = 0
var trash4Given = 0
var pactsCollected = 0
var ohNo = 0
var extraHint = 0

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
	if pactsCollected == 666:
		title.text = "Satan Claus"
		dialogue.text = "AS PROMISED."
		yield()
		emit_signal("giveItem",100)
		pactsCollected = 0
	if presentGiven == 0:
		title.text = "Mark"
		dialogue.text = "Excu- wait, who are you?"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "HOHOHO, DON'T YOU SEE CHILD? I'M SANTA."
		yield()
		title.text = "Mark"
		dialogue.text = "I don't recall Santa having horns."
		yield()
		title.text = "Satan Claus"
		dialogue.text = "LEGENDS ALSO SAY THAT I HAVE A BEARD AND I CLEARLY DON'T HAVE ONE."
		yield()
		dialogue.text = "DON'T JUST BELIEVE IN EVERYTHING YOU HEAR."
		yield()
		dialogue.text = "ANYWAYS JUST TAKE ONE OF PRESENTS."
		yield()
		title.text = "Mark"
		dialogue.text = "*reaches into the bag*"
		yield()
	elif extraHint == 0:
		title.text = "Satan Claus"
		dialogue.text = "YOU ARE GREEDY ONE."
		yield()
		dialogue.text = "GOOD."
		yield()
		title.text = "Mark"
		dialogue.text = "*reaches into the bag*"
		yield()
	else:
		title.text = "Satan Claus"
		dialogue.text = "TAKE THE ITEM OUT WHEN CLOCK ENDS WITH 3 OR 8. PLEASE."
		yield()
	var presentType = int(get_node("../TimeLeft/Timer").time_left)%5
	if presentType == 0 && gigaPresentGiven == 0:
		dialogue.text = "WOAH, is that TV? It's huge!"
		yield()
		dialogue.text = "Thanks Santa!"
		yield()
		title.text = "Satan Claus"
		dialogue.text = ":))"
		yield()
		presentGiven = 1
		gigaPresentGiven = 1
		emit_signal("giveItem",2)
		emit_signal("dialogueEnd")
	if presentType == 0 && gigaPresentGiven == 1:
		dialogue.text = "Another TV!"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "Oh wait, that one is for Timmy, you can't have it."
		yield()
		title.text = "Mark"
		dialogue.text = "...Oh."
		yield()
		emit_signal("dialogueEnd")
	if presentType == 1 && trash1Given == 0:
		dialogue.text = "...A piece of paper?"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "WOW, THAT'S A GOOD ONE, YOU CAN GET *ANYTHING* WITH IT!"
		yield()
		title.text = "Mark"
		dialogue.text = "I'm not that desperate."
		yield()
		presentGiven = 1
		trash1Given = 1
		emit_signal("giveItem",3)
		pactsCollected += 1
		emit_signal("dialogueEnd")
	if presentType == 1 && trash1Given == 1:
		dialogue.text = "Another contract? I'm sorry, but I'll decline."
		yield()
		title.text = "Satan Claus"
		dialogue.text = "COLLECT "+str(665-pactsCollected)+" MORE AND I'LL GIVE YOU SOMETHING EXTRA."
		yield()
		title.text = "Mark"
		dialogue.text = "...?"
		yield()
		pactsCollected += 1
		emit_signal("dialogueEnd")
	if presentType == 2 && trash2Given == 0:
		dialogue.text = "OH GOD WHAT IS IT"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "HONESTLY I DON'T KNOW MYSELF, BUT IT LOOKS NICE."
		yield()
		title.text = "Mark"
		dialogue.text = "please take it away from me"
		yield()
		presentGiven = 1
		trash2Given = 1
		emit_signal("dialogueEnd")
	if presentType == 2 && trash2Given == 1:
		dialogue.text = "WHAT THE HELL NOT THIS AGAIN"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "I DON'T UNDERSTAND WHAT DO YOU DISLIKE ABOUT THIS HUMAN."
		yield()
		title.text = "Mark"
		dialogue.text = "hgdfhdfgsdfa"
		yield()
		emit_signal("dialogueEnd")
	if presentType == 3 && trash3Given == 0:
		dialogue.text = "...A copy of 'Stop the Train'?"
		yield()
		dialogue.text = "I have no idea what is it but it looks really bad."
		yield()
		dialogue.text = "Thanks, but no thanks."
		yield()
		presentGiven = 1
		trash3Given = 1
		emit_signal("dialogueEnd")
	if presentType == 3 && trash3Given == 1 && ohNo == 0:
		dialogue.text = "...'Stop the Train 2'? It really got a sequel?"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "YOU'RE NOT SUPPOSED TO SEE THAT. FORGET ABOUT IT."
		yield()
		dialogue.text = "HERE, HAVE A CANDY INSTEAD."
		yield()
		ohNo = 1
		emit_signal("giveItem",6)
		emit_signal("dialogueEnd")
	if presentType == 3 && trash3Given == 1 && ohNo == 1:
		dialogue.text = "...It got ANOTHER sequel?"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "...PLEASE STOP TAKING ITEM OUT OF THE BAG WHEN LAST NUMBER ON CLOCK IS 3 OR 8."
		yield()
		title.text = "Mark"
		dialogue.text = "What are you talking about?"
		yield()
		extraHint = 1
		emit_signal("dialogueEnd")
	if presentType == 4 && trash4Given == 0:
		dialogue.text = "Christmas sweater."
		yield()
		dialogue.text = "Really?"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "HEY, I ALWAYS LOVED GETTING SWEATERS. NOW I EVEN HAVE A COLLECTION. CAN I HAVE IT?"
		yield()
		title.text = "Mark"
		dialogue.text = "Here, enjoy."
		yield()
		title.text = "Satan Claus"
		dialogue.text = "YAY."
		yield()
		presentGiven = 1
		trash4Given = 1
		emit_signal("dialogueEnd")
	if presentType == 4 && trash4Given == 0:
		dialogue.text = "Another christmas sweater."
		yield()
		dialogue.text = "I guess you want it?"
		yield()
		title.text = "Satan Claus"
		dialogue.text = "YES, PLEASE, THANK YOU."
		yield()
		emit_signal("dialogueEnd")
