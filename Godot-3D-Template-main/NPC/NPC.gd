extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"[Press E to continue.]",
	"You gotta hurry! The Zombies are Coming!",
	"You're the only one with a gun, you have to stop them please!"
]

func _ready():
	$AnimationPlayer.play("Idle")


func _on_Area_body_entered(_body):
	Dialogue.StartDialogue(dialogue)

func _on_Area_body_exited(_body):
	Dialogue.HideDialogue()

