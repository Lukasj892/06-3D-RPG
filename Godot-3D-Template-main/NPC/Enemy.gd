extends KinematicBody

var speed = 0.025
var health = 1

onready var Score = get_node("/root/Game/UI/Score")

func _ready():
	$AnimationPlayer.play("Walk")

func _physics_process(_delta):
	self.translate(Vector3(0, 0, speed))
	
	if health < 1:
		$AnimationPlayer.play("Death")

func _on_AnimationPlayer_animation_finished(anim_name):
	anim_name = "Death"
	Global.score += 1
	Score.text = "Score: " + str(Global.score)
	self.queue_free()
