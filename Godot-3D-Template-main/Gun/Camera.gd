extends Camera #Gun Script. Player aims with camera.

var ammo = 30
var mags = 9

onready var ammoText = get_node("/root/Game/UI/Ammo")
onready var player = get_node("/root/Game/Player")

func _ready():
	ammoText.text = "Ammo: " + str(ammo) + " Mags: " + str(mags)

func _physics_process(_delta):
	if Input.is_action_pressed("aim"):
		player.max_speed = 2
		if self.fov > 40:
			self.fov -= 2
	else:
		player.max_speed = 6
		if self.fov < 70:
			self.fov += 2
	
	if Input.is_action_just_pressed("shoot"):
		if ammo > 0:
			if $RayCast.is_colliding():
				#print("Something Was Shot")
				var target = $RayCast.get_collider()
				target.health -= 1
			ammo -= 1
			#print(str("Ammo: " + str(ammo)))
			ammoText.text = "Ammo: " + str(ammo) + " Mags: " + str(mags)
		else:
			Reload()
	
	if Input.is_action_just_pressed("reload") and ammo < 30:
		Reload()
	


func Reload():
	if mags > 0:
		ammo = 30
		mags -= 1
	ammoText.text = "Ammo: " + str(ammo) + " Mags: " + str(mags)
	#print("Mags: " + str(mags))
