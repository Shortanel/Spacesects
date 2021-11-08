extends Timer

export (PackedScene)var Asteroid 
#make an instance of an asteroid in the boundray of screen

func _on_asteroid_timeout():
	randomize()
	var asteroid = Asteroid.instance()
	add_child(asteroid)
	asteroid.global_position.x = 328
	asteroid.global_position.y = rand_range(8,172)
	
