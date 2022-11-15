extends KinematicBody2D
# physics
var accel : int = 100
var max_speed : int = 300
var jumpForce : int = 450
var gravity : int = 750
var vel : Vector2 = Vector2()
var grounded : bool = false
var jumps : int
# components
onready var sprite = $Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process (delta):
	vel = move_and_slide(vel, Vector2.UP)
	# movement inputs
	if Input.is_action_pressed("move_right"):
		vel.x = min(vel.x+accel, max_speed)
	elif Input.is_action_pressed("move_left"):
		vel.x = max(vel.x-accel, -max_speed)
	else:
		 vel.x = lerp(vel.x, 0, 0.2)
	# gravity
	vel.y += gravity * delta
	# jump input
	if is_on_floor():
		jumps = 1
	if Input.is_action_pressed("jump") and jumps > 0:
		jumps -= 1
		vel.y -= jumpForce
	if is_on_wall() and Input.is_action_pressed("move_left") and Input.is_action_just_pressed("jump"):
		vel.y -= jumpForce
		vel.x = 500
	elif is_on_wall() and Input.is_action_pressed("move_left") and Input.is_action_just_pressed("jump"):
		vel.y -= jumpForce
		vel.x = -500
