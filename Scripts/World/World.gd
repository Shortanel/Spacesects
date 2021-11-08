extends Node2D


func _ready():
	Global.World = self

func _exit_tree():
	Global.World = null
