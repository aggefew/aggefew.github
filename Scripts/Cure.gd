extends Area2D

onready var win = get_node("/root/Main/CanvasLayer/UI")

func _ready():
	pass # Replace with function body.


func _on_leech_body_entered(body):
	if body.name == "Player":
		pass
