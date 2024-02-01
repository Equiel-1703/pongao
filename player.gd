extends CharacterBody2D

@onready var animated_sprite = $SpritesPlayer1
@export var side = 'p1'

const SPEED = 600.0
var score = 0

func _ready():
	if side=='p1':
		$SpritesPlayer1.visible = true
		$SpritesPlayer2.visible = false
		
		animated_sprite = $SpritesPlayer1
	else:
		$SpritesPlayer1.visible = false
		$SpritesPlayer2.visible = true
		
		animated_sprite = $SpritesPlayer2

func _physics_process(_delta):
	var direction = 0
	if side == 'p1':
		direction = Input.get_axis("move_up_p1", "move_down_p1")
	else:
		direction = Input.get_axis("move_up_p2", "move_down_p2")

	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _on_bounce_area_body_entered(body):
	body.direction.x *= -1
	animated_sprite.animation = "shoot"
	$shoot_timer.start()

func _on_shoot_timer_timeout():
	animated_sprite.animation = "idle"
