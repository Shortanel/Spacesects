extends Node

func _ready():
	Global.Sound_controller = self

func _exit_tree():
	Global.Sound_controller = null
