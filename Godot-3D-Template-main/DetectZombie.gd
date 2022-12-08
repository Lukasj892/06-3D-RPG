extends RayCast

func _process(_delta):
	if self.is_colliding():
		get_tree().change_scene("res://UI/GameOver.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
