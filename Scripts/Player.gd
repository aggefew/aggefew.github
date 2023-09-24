extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score : int = 0

var hp = 3

var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800

var vel : Vector2 = Vector2()
var grounded : bool = false

onready var sprite = $Sprite

onready var ui = get_node("/root/Main/CanvasLayer/UI")

onready var attakArea = get_node("Sprite/HitArea/AttakArea")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	if Input.is_action_pressed("attack"):
		attakArea.disabled = false
	
	if vel.x < 0:
		sprite.flip_h = false
	elif vel.x > 0:
		sprite.flip_h = true
	ui.set_HP_text(hp) 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func die():
	hp -= 1
	
	if hp <= 0:
		get_tree().reload_current_scene()


func collect_coins(value):
	score += value
	ui.set_score_text(score)




func _on_HitArea_body_entered(body):
	if body.name == "Enemy":
		body.kill()
