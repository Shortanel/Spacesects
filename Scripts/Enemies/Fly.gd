extends Area2D

export var health = 9
export var speed = 70
export var fire_rate = 2
export var points  = 10
var fire_rate_timer = Timer.new()
var fly_can_shoot = true

func _ready():
	$Skin.play()
#set the timer for the fire rate
	set_timer()

func _process(delta):
#moving by itself to the left side of the screen
	global_position.x -= speed * delta
#elimate if it's out of the screen
	if global_position.x < -10:
		queue_free()
#shoot
	if fly_can_shoot == true :
		Methods.play_sound("Shoot")
		create_fly_projectile(Global.Fly_projectile,global_position)
		fly_can_shoot = false
		fire_rate_timer.start()

func _on_Fly_area_entered(area):
	if area.name == "Player":
		health = 0
		check_health()
	else:
		health -= 1
		check_health()

func on_shoot_timeout():
	fly_can_shoot =true

func set_timer():
	fire_rate_timer.set_one_shot(true)
	fire_rate_timer.set_wait_time(fire_rate)
	fire_rate_timer.connect("timeout",self,"on_shoot_timeout")
	add_child(fire_rate_timer)

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

func create_fly_projectile(projectile,location):
	var projectile_instance = projectile.instance()
	get_parent().add_child(projectile_instance)
	projectile_instance.global_position = location + Vector2(-10,0)
