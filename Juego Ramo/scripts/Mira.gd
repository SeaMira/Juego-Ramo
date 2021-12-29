extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("mov_abajo"):
		position.y += 500*delta
	elif Input.is_action_pressed("mov_arriba"):
		position.y -= 500*delta
	elif Input.is_action_pressed("mov_izq"):
		position.x -= 500*delta
	elif Input.is_action_pressed("mov_der"):
		position.x += 500*delta
