extends Control

onready var scoreText = get_node("ScoreText")
onready var hp = get_node("HP")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	scoreText.text = "0"

func set_score_text (score):
	scoreText.text = str(score)
	
func set_HP_text(hpval):
	hp.text = str(hpval)
