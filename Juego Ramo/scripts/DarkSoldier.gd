extends KinematicBody2D

var BULLET_SCENE = preload("res://scenes/Bullet.tscn")
var move = Vector2.ZERO
var speed = 2
var in_area = []
export var vect_dir = Vector2.ZERO
export var can_move = false
export var player = false
onready var playback = $AnimationTree.get("parameters/playback")


func _physics_process(delta):
	if in_area.size() > 0:
		can_move = true
	else:
		can_move = false
		player = false
		
	# movimiento
	if vect_dir.angle() < (3*PI / 4) && (PI / 4) <= (vect_dir.angle()):  # abajo
		playback.travel("Down")
	elif (vect_dir.angle()) < (-PI / 4) && (-3*PI / 4) <= (vect_dir.angle()): #arriba
		playback.travel("Up")
	elif (vect_dir.angle()) < (PI / 4) && (-PI / 4) <= (vect_dir.angle()): # derecha
		playback.travel("Right")
	else:
		playback.travel("Left")
	

func _on_Area2D_body_entered(body):
	if body != self && body.is_in_group("player"):
		in_area.append(body)
		player = body
		
func _on_Area2D2_bullet_entered(body):
	if body != self && body.is_in_group("bullet"):
		get_parent().get_parent().start_enemies -= 1
		get_parent().queue_free()

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

	
