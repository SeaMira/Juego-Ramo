tool

class_name Portal

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
