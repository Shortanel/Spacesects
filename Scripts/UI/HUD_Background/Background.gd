extends Node2D

func _ready():
	
	Global.big_layer = $ParallaxBackground/big_stars
	Global.small_layer = $ParallaxBackground/small_stars
	
	for item in Global.star_type:
		match item:
			"big":
				for i in range(1,9):
					get_node("ParallaxBackground/big_stars/big_star_" + str(i)).play()
			"small":
				for i in range(1,16):
					get_node("ParallaxBackground/small_stars/small_star_" + str(i)).play()

func _process(delta):
	Methods.star_motion(delta)
