extends Area2D

var player_cant = 0
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player_cant+=1
		
	if player_cant == 2:
		get_tree().change_scene("res://scenes/DialogoFin.tscn")

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		player_cant-=1
