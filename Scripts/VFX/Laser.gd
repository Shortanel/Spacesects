extends Area2D

export var speed = 120

func _ready():
	$Skin.play()

func _process(delta):
#moving by itself to the left side of the screen
	global_position.x += speed *delta
#elimate if it's out of the screen
	if global_position.x > 328:
		queue_free()

func _on_Laser_area_entered(area):
	queue_free()
