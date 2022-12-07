extends KinematicBody

onready var Camera = get_node("/root/Game/Player/Pivot/Camera")
onready var Pivot = get_node("/root/Game/Player/Pivot")

var velocity = Vector3()
var gravity = -9.8
var speed = 0.2
var max_speed = 4
var mouse_sensitivity = 0.002

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$AnimationTree.set("parameters/Move_Shoot/blend_amount", 0.75)

func _physics_process(_delta):
	velocity.y = gravity * _delta
	var falling = velocity.y
	velocity.y = 0
	
	var desired_velocity = get_input() * speed
	if desired_velocity.length() > 0:
		velocity += desired_velocity
	else:
		velocity *= 0.9
	var current_speed = velocity.length()
	velocity = velocity.normalized() * clamp(current_speed, 0, max_speed)
	velocity.y = falling
	
	$AnimationTree.set("parameters/Idle_Run/blend_position", current_speed/max_speed)
	velocity = move_and_slide(velocity, Vector3.UP, true)
	


func _input(_event):
	if _event is InputEventMouseMotion:
		rotate_y(-_event.relative.x * mouse_sensitivity)
		Pivot.rotate_x(_event.relative.y * mouse_sensitivity/2)

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir -= Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	if Input.is_action_pressed("left"):
		input_dir -= Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir
