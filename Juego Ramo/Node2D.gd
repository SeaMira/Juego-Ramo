extends KinematicBody2D

export var speed = 400  # How fast the player will move (pixels/sec).

onready var playback = $AnimationTree.get("parameters/playback")

#func _ready():
	

func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("mov_der"):
		velocity.x += 1
	if Input.is_action_pressed("mov_izq"):
		velocity.x -= 1
	if Input.is_action_pressed("mov_abajo"):
		velocity.y += 1
	if Input.is_action_pressed("mov_arriba"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized()*speed
	position += velocity * delta
	
	if velocity.x > 0:
	   playback.travel("der")
	elif velocity.x < 0 :
	   playback.travel("izq")
	elif velocity.x == 0 and Input.is_action_just_released("mov_der"):
	   playback.travel("der_idle")
	elif velocity.x == 0 and Input.is_action_just_released("mov_izq"):
	   playback.travel("izq_idle")		
			
	if velocity.y > 0:
	   playback.travel("abajo")
	elif velocity.y < 0: 
	   playback.travel("arriba")
	elif velocity.y == 0 and Input.is_action_just_released("mov_abajo"):
		playback.travel("idle")
	elif velocity.y == 0 and Input.is_action_just_released("mov_arriba"):
		playback.travel("arriba_idle")
		
