extends KinematicBody2D

export var speed = 400  # How fast the player will move (pixels/sec).
var acceleration = 100
onready var playback = $AnimationTree.get("parameters/playback")

#func _ready():
	
var velocity = Vector2.ZERO
func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity,Vector2.UP) #Vector2()  # The player's movement vector.
	var target_vel_x = Input.get_action_strength("mov_der") - Input.get_action_strength("mov_izq")
	var target_vel_y = Input.get_action_strength("mov_abajo") - Input.get_action_strength("mov_arriba")
	velocity.x = lerp(velocity.x, target_vel_x * speed, 0.5)
	velocity.y = lerp(velocity.y, target_vel_y * speed, 0.5)
	#if Input.is_action_pressed("mov_der"):
		#print("der")
		#velocity.x += 1
	#if Input.is_action_pressed("mov_izq"):
		#velocity.x -= 1
	#if Input.is_action_pressed("mov_abajo"):
		#velocity.y += 1
	#if Input.is_action_pressed("mov_arriba"):
		#velocity.y -= 1
	#if velocity.length() > 0:
		#velocity = velocity.normalized()*speed
	#position += velocity * delta
	
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
		
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#velocity
		if is_on_wall():
			velocity.y=0
		if is_on_floor():
			velocity.x=0
		print("Collided with: ", collision.collider.name)
