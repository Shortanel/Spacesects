extends Node

func _ready():
	EventBus.connect("create_explosion",self,"create_explosion")
	EventBus.connect("create_laser",self,"create_laser")

func play_sound(sound):
	if Global.Sound_controller != null:
		if Global.Sound_controller.has_node(sound):
			Global.Sound_controller.get_node(sound).play()

func star_motion(delta):
		Global.big_layer.motion_offset.x -= Global.star_type["big"] * delta
		Global.small_layer.motion_offset.x -= Global.star_type["small"] * delta

func create_explosion(explosion, location):
	var explosion_instance = explosion.instance()
	get_parent().add_child(explosion_instance)
	explosion_instance.global_position = location

func create_laser(laser, location):
	for i in range(1,4):
		var laser_instance_i = laser.instance()
		get_parent().add_child(laser_instance_i)
		match i:
			1:
				laser_instance_i.global_position = location + Vector2(11,-4)
			2:
				laser_instance_i.global_position = location + Vector2(13,0)
			3:
				laser_instance_i.global_position = location + Vector2(11,4)





