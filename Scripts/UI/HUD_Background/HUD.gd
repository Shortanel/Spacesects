extends CanvasLayer

onready var score: Label = get_node("Score")

func _ready():
	EventBus.connect("score",self,"_score_update")
	EventBus.connect("transmit_health",self,"change_health")
#this is for playing hearts animations
	for x in range(1,4):
		get_node("Heart"+str(x)).play() 

func _score_update():
	score.text = "SCORE: %s " % Global.score

func change_health(health):
#and this for delete them if player take damage
	if Global.Player != null :
		match health:
			1:
				$Heart1.animation = "death"
			2:
				$Heart2.animation = "death"
			3:
				$Heart3.animation = "death"
			4:
				continue
