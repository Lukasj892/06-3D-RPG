extends Control

var dialogue = []
var dialogue_pos = 0

func _ready():
	hide()

func _physics_process(_delta):
	if dialogue.size() and dialogue_pos < dialogue.size():
		var d = "[center]" + dialogue[dialogue_pos] + "[/center]"
		if $DialogueText.bbcode_text != d:
			$DialogueText.bbcode_text = d
		if Input.is_action_just_pressed("action"):
			dialogue_pos += 1
	elif dialogue.size():
		HideDialogue()


func StartDialogue(d):
	dialogue = d.duplicate()
	dialogue_pos = 0
	show()

func HideDialogue():
	dialogue = []
	dialogue_pos = 0
	hide()
