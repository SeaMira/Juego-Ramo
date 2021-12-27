extends KinematicBody2D

export var speed = 400  # How fast the player will move (pixels/sec).
onready var playback = $AnimationTree.get("parameters/playback")

var PortalGun = preload("res://scenes/PortalGun.tscn")
var portal_type = Portal2.Type.PORTAL_A
var can_move = true
var facing_right = true



func _physics_process(_delta):
	var velocity = Vector2()  # The player's movement vector.
	velocity.x += Input.get_action_strength("mov_der2") - Input.get_action_strength("mov_izq2")
	velocity.y += Input.get_action_strength("mov_abajo2") - Input.get_action_strength("mov_arriba2")
	if not can_move:
		velocity = Vector2.ZERO
	if velocity.length() > 0:
		velocity = velocity.normalized()*speed
	velocity = move_and_slide(velocity)
	
	#######  Animaciones  #######
	var colision = get_slide_count() > 0
	
	if velocity.x > 0:
		facing_right = true
		playback.travel("der")
	elif velocity.x < 0 :
	   facing_right = false
	   playback.travel("izq")
	elif velocity.x == 0 and Input.is_action_just_released("mov_der2") or colision and Input.is_action_pressed("mov_der2") or Input.is_action_pressed("mov_der2") and Input.is_action_pressed("mov_izq2") and playback.get_current_node() == "der" :
	   playback.travel("der_idle")
	elif velocity.x == 0 and Input.is_action_just_released("mov_izq2") or colision and Input.is_action_pressed("mov_izq2") or Input.is_action_pressed("mov_der2") and Input.is_action_pressed("mov_izq2") and playback.get_current_node() == "izq" :
	   playback.travel("izq_idle")		
			
	if velocity.y > 0 :
	   playback.travel("abajo")
	   $BulletSpawn.set_position(Vector2(-26.197, 23.357))
	elif velocity.y < 0: 	  
	   playback.travel("arriba")
	   $BulletSpawn.set_position(Vector2(29.803, 3.357))
	elif velocity.y == 0 and Input.is_action_just_released("mov_abajo2") or colision and Input.is_action_pressed("mov_abajo2") or Input.is_action_pressed("mov_abajo2") and Input.is_action_pressed("mov_arriba2") and playback.get_current_node()== "abajo" :
		playback.travel("idle")
		$BulletSpawn.set_position(Vector2(-26.197, 23.357))
	elif velocity.y == 0 and Input.is_action_just_released("mov_arriba2") or colision and Input.is_action_pressed("mov_arriba2") or Input.is_action_pressed("mov_abajo2") and Input.is_action_pressed("mov_arriba2") and playback.get_current_node()== "arriba":
		playback.travel("arriba_idle") 
		$BulletSpawn.set_position(Vector2(29.803, 3.357))
	
	if playback.get_current_node() == "der" or playback.get_current_node() == "izq" or playback.get_current_node() == "der_idle" or playback.get_current_node() == "izq_idle":
		$BulletSpawn.set_position(Vector2(0, 20.526))
		
	if Input.is_action_just_pressed("punch"):
		weapon()
		
#	if Input.is_action_just_pressed("punch"):
#		if portal_type == Portal.Type.PORTAL_A:
#			portal_type = Portal.Type.PORTAL_B
#		elif portal_type == Portal.Type.PORTAL_B:
#			portal_type = Portal.Type.PORTAL_A
		
func weapon():
	var b = PortalGun.instance()
	b.portal_type = portal_type
	owner.add_child(b)
	b.transform = $BulletSpawn.global_transform
	if facing_right: 
		if Input.is_action_pressed("mov_abajo2") or playback.get_current_node() == "idle" :
			b.rotation = PI/2
			
		elif Input.is_action_pressed("mov_arriba2") or playback.get_current_node() == "arriba_idle":
			b.rotation = -PI/2
			
	else: 		
		if Input.is_action_pressed("mov_abajo2") or playback.get_current_node() == "idle" :
			b.rotation = PI/2
		elif Input.is_action_pressed("mov_arriba2") or playback.get_current_node() == "arriba_idle":
			b.rotation = -PI/2
		else:
			b.rotation = PI
		
