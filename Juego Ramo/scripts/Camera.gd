extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if target:
		position = target.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
