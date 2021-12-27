extends Node2D

func _ready():
	$back.grab_focus()
	$AnimationPlayer.play("slide")


func _on_back_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn") # Replace with function body.

