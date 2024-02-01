extends CharacterBody2D

@export var SPEED = 450.0
var direction = Vector2.ZERO

func _ready():
	direction.x = [1,-1].pick_random()
	direction.y = [1, -1].pick_random()

func _physics_process(_delta):
	velocity = direction * SPEED
	move_and_slide()
