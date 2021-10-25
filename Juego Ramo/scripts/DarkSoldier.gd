extends KinematicBody2D

var BULLET_SCENE = preload("res://scenes/Bullet.tscn")
var move = Vector2.ZERO
var speed = 2
var in_area = []
export var can_move = false
export var player = false


func _physics_process(delta):
	if in_area.size() > 0:
		can_move = true
		#fire()
	else:
		can_move = false
		player = false

func _on_Area2D_body_entered(body):
	if body != self && body.is_in_group("player"):
		in_area.append(body)
		player = body

func _on_Area2D_body_exited(body):
	var i = in_area.find(body)
	if i != -1:
		in_area.remove(i)

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1.5)
	
func _on_Timer_timeout():
	if player:
		fire()
