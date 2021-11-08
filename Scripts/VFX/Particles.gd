extends Node2D

func _ready():
	for i in range(1,3):
		get_node("Particle" + str(i)).set("emitting",true)
