extends Area2D

var player_cant = 0
func _on_Paso_body_entered(body):
	
	if body.is_in_group("player"):
		player_cant+=1
		
	if player_cant ==2:
		get_tree().change_scene("res://scenes/Dialogointermedio.tscn")
	


func _on_Paso_body_exited(body):
	if body.is_in_group("player"):
		player_cant-=1
