extends Camera #Gun Script. Player aims with camera.

var ammo = 30
var mags = 2

onready var ammoText = get_node("/root/Game/UI/Ammo")

func _physics_process(_delta):
	if Input.is_action_just_pressed("shoot"):
		if ammo > 0:
			$RayCast.enabled = true
			ammo -= 1
			#print(str("Ammo: " + str(ammo)))
			ammoText.text = "Ammo: " + str(ammo) + " Mags: " + str(mags)
		else:
			Reload()
	else:
		$RayCast.enabled = false
	
	if Input.is_action_just_pressed("reload") and ammo < 30:
		Reload()

func Reload():
	if mags > 0:
		ammo = 30
		mags -= 1
	ammoText.text = "Ammo: " + str(ammo) + " Mags: " + str(mags)
	#print("Mags: " + str(mags))
