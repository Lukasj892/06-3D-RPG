extends Node

var score = 0

func _unhandled_input(_event):
	if Input.is_action_pressed("menu"):
		get_tree().quit()

func UpdateScore(s):
	score += s
	get_node("/root/Game/UI/Score").text = str(score)
	
