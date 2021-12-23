extends Node2D

var creditos = [
	"Outrun Space War\n\n",
	"Créditos para:\n",
	"Tileset:\n",
	"Neo Zero Cyberpunk City Tileset (https://yunusyanin.itch.io/neo-zero-cyberpunk-city-tileset)"
]

func _ready():
	$back.grab_focus()
	$AnimationPlayer.play("slide")
	show_text()


func _on_back_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn") # Replace with function body.

func show_text():
	pass
