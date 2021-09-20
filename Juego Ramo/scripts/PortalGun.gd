extends Area2D



export var SPEED = 1000

var PortalObj = preload("res://scenes/Portal.tscn")

var portal_type = Portal.Type.PORTAL_A

func _physics_process(delta: float) -> void:
	position += transform.x*delta*SPEED
	

func _on_PortalGun_body_entered(body):
	if body.is_in_group("wall"):
		call_deferred("_portal_instance")
		queue_free()
		
	else:
		queue_free()
			

func _portal_instance():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(global_position-transform.x*20, global_position+transform.x*30,[], 1)
	if not result:
		return
	var portal = PortalObj.instance()
	portal.type = portal_type
	match portal_type:
		Portal.Type.PORTAL_A:
			_manage_group(portal, "PORTAL_A")
		Portal.Type.PORTAL_B:
			_manage_group(portal, "PORTAL_B")
			
	
	get_parent().add_child(portal)
	portal.global_position =  result.position
	portal.rotation = result.normal.angle()

func _manage_group(portal, group):
	for p in get_tree().get_nodes_in_group(group):
		p.queue_free()
	portal.add_to_group(group)
#	var shot = Vector2()
#	shot.x = SPEED
#	shot = move_and_collide(shot)
#	if shot:
#	   if shot.collider.name != "Area2D":
#		   print("I collided with ", shot.collider.name)
#		   queue_free()
	   