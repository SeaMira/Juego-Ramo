extends Node

const MAX_LIFE = 20
var life = MAX_LIFE

var health_bar: TextureProgress

func loseHP():
	life -= 1
	if is_instance_valid(health_bar):
		health_bar.update_health()
	if life <= 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
