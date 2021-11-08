extends Timer

export (PackedScene)var Fly
#make an instance of a fly in the boundray of screen
func _on_fly_timeout():
	randomize()
	var fly = Fly.instance()
	get_parent().add_child(fly)
	fly.global_position.x = 328
	fly.global_position.y = rand_range(8,172)
