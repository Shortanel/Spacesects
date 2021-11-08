extends Control

func _ready():
	$Game_over_overlay/Score_number.text = "%s" % Global.score

func _on_Retry_pressed():
	Global.score =0
	get_tree().change_scene("res://Scene/World/World.tscn")

func _on_Main_menu_pressed():
	Global.score =0
	get_tree().change_scene("res://Scene/UI/Title_screen.tscn")
