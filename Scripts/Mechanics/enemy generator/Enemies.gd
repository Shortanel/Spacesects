extends Node2D

var asteroid_spawner = preload("res://Scene/Mechanics/Enemy generator/asteroid.tscn")
var fly_spawner = preload("res://Scene/Mechanics/Enemy generator/fly.tscn")

func _ready():
	var asteroid_instance = asteroid_spawner.instance()
	self.add_child(asteroid_instance)
	var fly_instance = fly_spawner.instance()
	self.add_child(fly_instance)
