extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(5), "timeout")
	$AnimationPlayer.play("faade out")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://scenes/Menu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
