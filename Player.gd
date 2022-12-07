extends KinematicBody2D
# physics
var accel : int = 100
var max_speed : int = 500
var jumpForce : int = 500
var gravity : int = 500
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
	if Input.is_action_pressed("move_left"):
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
	if is_on_wall() and Input.is_action_pressed("move_left") and Input.is_action_just_pressed("jump") and !is_on_floor():
		vel.y = -500
		#vel.x = 600
	elif is_on_wall() and Input.is_action_pressed("move_right") and Input.is_action_just_pressed("jump") and !is_on_floor():
		vel.y = -500
		#vel.x = -600



func _on_exit_body_entered(body):
	get_tree().quit()


func _on_level1_body_entered(body):
	get_tree().change_scene("res://level1.tscn")


func _on_level2_body_entered(body):
	get_tree().change_scene("res://level2.tscn")


func _on_level3_body_entered(body):
	get_tree().change_scene("res://level3.tscn")


func _on_level4_body_entered(body):
	get_tree().change_scene("res://level4.tscn")


func _on_level5_body_entered(body):
	get_tree().change_scene("res://level5.tscn")


func _on_level6_body_entered(body):
	get_tree().change_scene("res://main.tscn")


func _on_secret_body_entered(body):
	get_tree().change_scene("res://secret.tscn")
