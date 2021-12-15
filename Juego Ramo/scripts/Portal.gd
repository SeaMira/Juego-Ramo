tool

class_name Portal2

extends Area2D


enum Type {PORTAL_A, PORTAL_B}
export (Type) var type setget set_type


func set_type(value):
	type = value
	if not $Sprite:
		return
	if type == Type.PORTAL_A:
		$Sprite.modulate = Color("20a5ed")
	elif type == Type.PORTAL_B:
		$Sprite.modulate = Color("d84444")
		
		
func _on_Portal_body_entered(body: Node):
	var portal_target = null
	if Manager.portal_a == self:
		portal_target = Manager.portal_b
	elif Manager.portal_b == self:
		portal_target = Manager.portal_a
		
	if Manager.portal_a and Manager.portal_b:
		if body.is_in_group("player"):
			body.global_position = portal_target.global_position + portal_target.transform.x*70
			body.can_move = false
			yield(get_tree().create_timer(0.2),"timeout")
			body.can_move = true
			
			
