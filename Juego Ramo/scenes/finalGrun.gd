extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button").hide()
	$AnimationPlayer.play("despegue")
	yield(get_tree().create_timer(5.0), "timeout")
	get_node("Button").show()
	$Button.grab_focus()
	yield(get_tree().create_timer(15.0), "timeout")
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
