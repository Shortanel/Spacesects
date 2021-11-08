extends AnimatedSprite

func _ready():
	play()

func _on_Timer_timeout():
	queue_free()
