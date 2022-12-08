extends Control

func _ready():
	$ColorRect/Body.text = "You Killed " + str(Global.score) + " Zombies!"



func _on_PlayAgain_pressed():
	get_tree().change_scene("res://Game.tscn")
	Global.score = 0


func _on_Exit_pressed():
	get_tree().quit()
