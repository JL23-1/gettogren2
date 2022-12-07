extends Sprite

var Bullet = preload("res://bullet.tscn") 
var _timer = null
var _firerate = null

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.5)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

func shoot():
	var bullet = Bullet.instance()
	add_child(bullet)

func _on_Timer_timeout():
	shoot()
