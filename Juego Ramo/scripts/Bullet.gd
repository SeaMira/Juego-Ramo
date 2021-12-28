extends Area2D


var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 10


func _on_Bullet_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		vida.loseHP()
	elif body.is_in_group("wall"):
		queue_free()

func _physics_process(delta):
	look_vec = player.position - global_position
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
