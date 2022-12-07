extends RayCast

func _process(_delta):
	if self.is_colliding():
		print("L") #Game Over
