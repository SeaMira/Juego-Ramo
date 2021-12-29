extends Node2D

export var start_enemies = 4 setget set_enemie

func set_enemie(value):
	start_enemies = value
	if start_enemies <= 0:
		get_tree().change_scene("res://scenes/finPelea.tscn")

