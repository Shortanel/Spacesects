extends Area2D

var fire_rate_timer = Timer.new()
var invincible_timer = Timer.new()
var fire_rate = 0.25
export var health = 4
export var speed = 80
var player_can_shoot = true
var invincible = false

func _ready():
	$Skin.play()
	set_fire_rate_timer()
	set_invincible_timer()
	Global.Player = self

func _exit_tree():
	Global.Player = null

func _process(delta):
#screen restrain
	position.x = clamp(position.x,8,Global.screen_width-8)
	position.y = clamp(position.y,8,Global.screen_height-8)
	
# shoot 
	if Input.is_action_pressed("Shoot") and player_can_shoot:
		Methods.play_sound("Shoot")
		EventBus.emit_signal("create_laser",Global.Laser,global_position)
		player_can_shoot = false
		fire_rate_timer.start()

	var player_velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		player_velocity.x +=1
	if Input.is_action_pressed("ui_left"):
		player_velocity.x -=1
	if Input.is_action_pressed("ui_down"):
		player_velocity.y +=1
	if Input.is_action_pressed("ui_up"):
		player_velocity.y -=1
	position += player_velocity.normalized() * speed * delta

func _on_Player_area_entered(_area):
#change player health if it's hit
	if(not invincible):
		health -= 1
		check_health()
		EventBus.emit_signal("transmit_health",health)
		invincible = true
		invincible_timer.start()


func on_shoot_timeout():
	player_can_shoot = true

func on_invincible_timeout():
	invincible = false

func set_fire_rate_timer():
	fire_rate_timer.set_one_shot(true)
	fire_rate_timer.set_wait_time(fire_rate)
	fire_rate_timer.connect("timeout",self,"on_shoot_timeout")
	add_child(fire_rate_timer)

func set_invincible_timer():
	invincible_timer.set_one_shot(true)
	invincible_timer.set_wait_time(1.0)
	invincible_timer.connect("timeout",self,"on_invincible_timeout")
	add_child(invincible_timer)

func check_health(): 
	#check if player he still has health
	if health <= 0:
		Methods.play_sound("Explosion")
		EventBus.emit_signal("create_explosion",Global.Explosion,global_position)
		queue_free()  
		get_tree().change_scene("res://Scene/UI/Game_over.tscn")
	else:
		Methods.play_sound("Hit")
		$Skin/Hit_animation.play("Flash")
		EventBus.emit_signal("hit")
