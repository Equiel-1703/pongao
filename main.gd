extends Node

func _process(_delta):
	$Player1Score.text = str($player1.score)
	$Player2Score.text = str($player2.score)

# Bola entrou no lado esquerdo -> ponto do Player2
func _on_esq_body_entered(body):
	# Deleta bola
	body.queue_free()
	
	$player2.score += 1
	$ball_respawn_timer.start()

# Bola entrou no lado direito -> ponto do Player1
func _on_dir_body_entered(body):
	# Deleta bola
	body.queue_free()
	
	$player1.score += 1
	$ball_respawn_timer.start()

func _on_top_body_entered(body):
	if not body.is_in_group("player"):	
		body.direction.y *= -1

func _on_down_body_entered(body):
	if not body.is_in_group("player"):	
		body.direction.y *= -1

func _on_ball_respawn_timer_timeout():
	var ball_scene = preload("res://minha_bola.tscn")
	var ball_instance = ball_scene.instantiate()
	ball_instance.position = $ball_respawn.position
	
	# Adicionando na cena
	add_child(ball_instance)
