extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 2


func _physics_process(delta):
	move = Vector2.ZERO
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO
	move = move.normalized()
	move = move_and_collide(move)

func _on_Area2D_body_entered(body):
	if body != self && body.is_in_group("player"):
		print(body)
		player = body

func _on_Area2D_body_exited(body):
	player = null
	

func _on_Timer_timeout():
	pass # Replace with function body.
