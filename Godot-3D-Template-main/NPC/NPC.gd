extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome To The Game! Press 'E' To Continue.",
	"Your Life Depends On Your Accuracy With That Firearm.",
	"Eliminate Your Enemies With That Gun, But Be Warned...",
	"You Only Have 1 Magazine.",
	"Press 'E' To Begin."
]

func _ready():
	$AnimationPlayer.play("Idle")
	#Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(_body):
	Dialogue.StartDialogue(dialogue)

func _on_Area_body_exited(_body):
	Dialogue.HideDialogue()

func finished():
	pass
