extends AnimationPlayer

var flash_duration_timer = Timer.new()

var flash_duration = 1.0

func _ready():
	set_timer()
	EventBus.connect("hit",self,"on_hit_start")

func set_timer():
	flash_duration_timer.set_one_shot(true)
	flash_duration_timer.set_wait_time(flash_duration)
	flash_duration_timer.connect("timeout",self,"on_flash_timeout")
	add_child(flash_duration_timer)

func on_hit_start():
	flash_duration_timer.start()

func on_flash_timeout():
	self.stop()
	seek(0,true)
