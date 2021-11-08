extends Area2D

export var speed = 110

func _process(delta):
#moving by itself to the left side of the screen
	global_position.x -= speed *delta
#elimate if it's out of the screen
	if global_position.x < -10:
		queue_free()

func _on_Fly_Projectile_area_entered(_area):
	queue_free()
