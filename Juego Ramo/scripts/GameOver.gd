extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("gameOver")
	$VBoxContainer/restart.grab_focus()


func _on_restart_pressed():
	get_tree().change_scene("res://scenes/Main.tscn") # Replace with function body.


func _on_menu_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
