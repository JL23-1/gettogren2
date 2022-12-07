extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spin = 0
func _process (delta):
#	 movement inputs
	if Input.is_action_pressed("move_right"):
		spin += 0.1
	elif Input.is_action_pressed("move_left"):
		spin -= 0.1
	set_rotation(spin)
#	print ("a") #for debugging
