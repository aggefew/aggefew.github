extends Area2D

onready var sprite = $sprite


export var speed = 100
export var moveDist = 100

onready var startX : float = position.x
onready var targetX : float = position.x + moveDist
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func move_to(current, to, step):
	var temp = current
	
	if temp < to:
		sprite.flip_h = true
		
		temp += step
		
		if temp > to:
			temp = to
	else:
		sprite.flip_h = false
		
		temp -= step
		
		if temp < to:
			temp = to
	
	return temp
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position.x = move_to(position.x, targetX, speed*delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func kill():
	queue_free()

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die() # Replace with function body.
