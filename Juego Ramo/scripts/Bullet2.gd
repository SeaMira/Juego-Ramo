extends KinematicBody2D

var speed = 1000
var dir = Vector2.ZERO

func _physics_process(_delta):
	move_and_slide(dir * speed)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
