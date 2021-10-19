extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var viewport1 = $Viewports/ViewportContainer1/Viewport1
onready var viewport2 = $Viewports/ViewportContainer2/Viewport2
onready var camera1 = $Viewports/ViewportContainer1/Viewport1/Camera2D
onready var camera2 = $Viewports/ViewportContainer2/Viewport2/Camera2D
onready var world = $"Viewports/ViewportContainer1/Viewport1/Mapa1-chrts"
# Called when the node enters the scene tree for the first time.
func _ready():
	viewport2.world_2d = viewport1.world_2d
	camera1.target = world.get_node("Player 1")
	camera2.target = world.get_node("Player 2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
