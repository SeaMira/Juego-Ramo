extends Area2D


var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 10
#var life_p1 = get_tree().get_nodes_in_group("player")[0].life
#var life_p2 = get_tree().get_nodes_in_group("player")[1].life

func _on_Bullet_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		if vida.life > 0:
			vida.life -= 0.5
			if vida.life == 0:
				get_tree().change_scene("res://scenes/GameOver.tscn")
		print(vida.life)

func _physics_process(delta):
	look_vec = player.position - global_position
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
