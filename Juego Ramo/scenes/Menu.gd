extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play(0)
	$AudioStreamPlayer.stop()
	$VBoxContainer/Start.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://scenes/introhistoria.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Creditos.tscn")
