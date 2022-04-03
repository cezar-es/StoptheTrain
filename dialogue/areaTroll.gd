extends Area2D

var talkState
var dialogue
var title

signal dialogueEnd
signal giveItem(itemid)
signal loseItem(itemid)
signal tradeComplete

var candyEaten = 0
var teethStuck = 0

signal endTrolling

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
	#get_node("../TimeLeft/Timer").paused = false
	var hasCandy = 0
	if teethStuck == 1:
		title.text = "Very annoying man"
		dialogue.text = "..."
		yield()
		emit_signal("dialogueEnd")
	else:
		for item in items:
			if item == 6:
				hasCandy = 1
				if candyEaten==0:
					title.text = "Very annoying man"
					dialogue.text = "OoOoOh A cAnDy!"
					yield()
					dialogue.text = "YuMmY!"
					yield()
					dialogue.text = "BrInG mE mOrE! mOrE!"
					yield()
					emit_signal("loseItem",6)
					candyEaten = 1
					emit_signal("dialogueEnd")
					break
				else:
					title.text = "Very annoying man"
					dialogue.text = "CaNdYyYyYyYyYyY!"
					yield()
					dialogue.text = "...it sticks my teeth together..."
					$AnimatedSprite.animation = "no"
					yield()
					dialogue.text = "..."
					yield()
					teethStuck = 1
					emit_signal("loseItem",6)
					emit_signal("endTrolling")
					emit_signal("dialogueEnd")
					break
		if hasCandy == 0:
			title.text = "Very annoying man"
			dialogue.text = "HeY i'm VeRy AnNoYiNg MaN!"
			yield()
			dialogue.text = "AnD i LoVe To Be AnNoYiNg!"
			yield()
			dialogue.text = "HoW iS yOuR dAy?!"
			yield()
			dialogue.text = "My DaY iS cOoL!"
			yield()
			dialogue.text = "SiNcE tImE dOeSn't StOp WhEn YoU tAlK tO mE!"
			yield()
			dialogue.text = "(Or It UsEd To BuT iT wAs UnFaIr, PrEtEnD iT's ThErE!)"
			yield()
			dialogue.text = "(YoU cAn JuSt MaSh Z bUtToN!)"
			yield()
			dialogue.text = "HaHaHa, SuRpRiSeD?!"
			yield()
			dialogue.text = "Oh YeS, iMaGiNe WaStInG aLl Of YoUr TiMe BeCaUsE oF mE!"
			yield()
			dialogue.text = "I'M tHe MaStEr Of BrEaKiNg ThE fOuRtH wAlL!"
			yield()
			dialogue.text = "ThErE'S sOmE fIlLeR tExT tO pRoLoNg ThIs CoNvErSaTiOn!"
			yield()
			dialogue.text = "AnD sOmE mOrE!"
			yield()
			dialogue.text = "AnD mOrE!"
			yield()
			dialogue.text = "TaLkInG lIkE tHaT hUrTs!"
			yield()
			dialogue.text = "BuT iT dOeSn't MaTtEr!"
			yield()
			dialogue.text = "SiNcE iT'S aNnOyInG!"
			yield()
			dialogue.text = "AnD gAmE lOsInG fOr YoU!"
			yield()
			dialogue.text = "I mEaN, yOu'rE gOiNg To LoSe AnYwAyS!"
			yield()
			dialogue.text = "YoU'Re JuSt DeLaYiNg ThE iNeViTaBlE!"
			yield()
			dialogue.text = "HaHaHaHaHa!"
			yield()
			dialogue.text = "YoU'Re WaStInG yOuR tImE aNyWaYs, So YoU cAn WaStE iT tOgEtHeR wItH mE!"
			yield()
			dialogue.text = "I'M pRoBaBlY sPeAkInG tOo MuCh AbOuT tHe GaMe, BuT aT tHiS pOiNt YoU'Re PrObAbLy JuSt MaShInG z AnYwAyS!"
			yield()
			dialogue.text = "So I cAn SaY a LoT oF sTuFf!"
			yield()
			dialogue.text = "EvEn CoMpLeTeLy UnReLaTeD tO tHe GaMe!"
			yield()
			dialogue.text = "Oh, RiGhT, yOu'rE sTiLl LiStEnInG tO mE?!"
			yield()
			dialogue.text = "GoOd!"
			yield()
			dialogue.text = "BeCaUsE i JuSt LoSt ThE gAmE!"
			yield()
			dialogue.text = "HoW iS tHe MaShInG z BuTtOn GoInG?!"
			yield()
			dialogue.text = "Be CaReFuL nOt To MaSh ToO mUcH oR yOu WiLl StArT tHe CoNvErSaTiOn AgAiN!"
			yield()
			dialogue.text = "I wArNeD yOu!"
			yield()
			dialogue.text = "HoNeStLy I'M oUt Of ThInGs To SaY!"
			yield()
			dialogue.text = "ShSdHfGhGhDfGhDf RaNdOm FiLlEr OnCe AgAiN!"
			yield()
			dialogue.text = "ByE!"
			yield()
			dialogue.text = "HuH!"
			yield()
			dialogue.text = "DiD yOu StOp MaShInG bEcAuSe YoU sAw 'ByE'?!"
			yield()
			dialogue.text = "JuSt AcCoRdInG tO pLaN!"
			yield()
			dialogue.text = "(TrAnSlAtIoN nOtE: 'PlAn' mEaNs 'pLaN')!"
			yield()
			dialogue.text = "OkAy ThE cAsE cHaNgE rUiNeD iT!"
			yield()
			dialogue.text = "BoReD? tOo BaD, wE'Re JuSt StArTiNgAnD i LoVe To Be AnNoYiNg!"
			yield()
			dialogue.text = "DoN'T rEfReSh YoUr GaMe BeCaUsE oF iT!"
			yield()
			dialogue.text = "ShDfO fIlLeR tExT!"
			yield()
			dialogue.text = "HaPpY jApEs DaY!"
			yield()
			emit_signal("dialogueEnd")
