extends Area2D

export var health  = 6
export var speed = 110
export var points = 5

func _ready():
	$Skin.play()
	$Particles.set("emitting",true)
	add_to_group("enemies")

func _process(delta):
#moving by itself to the left side of the screen
	global_position.x -= speed * delta
#elimate if it's out of the screen
	if global_position.x < -10:
		queue_free()

func _on_Asteroid_area_entered(_area):
		health -= 1
		check_health()

func check_health(): 
	#check if enemy he still has health
	if health <= 0:
		Methods.play_sound("Explosion")
		EventBus.emit_signal("create_explosion",Global.Explosion,global_position)
		Global.score += points
		EventBus.emit_signal("score")
		queue_free()  
	else:
		Methods.play_sound("Hit")
		$Skin/AnimationPlayer.play("Flash")
		EventBus.emit_signal("hit")
