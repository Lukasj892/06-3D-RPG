extends Spatial

var Zombies = preload("res://NPC/Enemy.tscn")

func _process(_delta):
	if Global.score < 20:
		$Spawn_Timer.wait_time = 2
	elif Global.score >= 20 and Global.score <= 40:
		$Spawn_Timer.wait_time = 1.5
	elif Global.score >= 40 and Global.score <= 50:
		$Spawn_Timer.wait_time = 1
	elif Global.score >= 50:
		$Spawn_Timer.wait_time = 0.5

func _on_Spawn_Timer_timeout():
	var zombie = Zombies.instance()
	add_child(zombie)
	
	var spawn_points = get_tree().get_nodes_in_group("spawn")
	var spawn = spawn_points[randi() % spawn_points.size()]
	
	var spawn_pos = spawn.translation
	zombie.translation = spawn_pos
