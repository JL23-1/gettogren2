extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	position.y -= 75


func _on_bullet_body_entered(body):
	var currentScene = get_tree().get_current_scene().get_filename()
	print("die") # for Debug
	get_tree().change_scene(currentScene)


func _on_bullet_area_entered(area):
	get_parent().remove_child(self)
