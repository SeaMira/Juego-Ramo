extends Navigation2D

export(float) var speed = 50
var path = []
onready var character = $RedSoldier
onready var player1 = get_tree().get_nodes_in_group("player")[0]
onready var player2 = get_tree().get_nodes_in_group("player")[1]
onready var dist_p1 = 0
onready var dist_p2 = 0

func _process(delta):
	var walk_distance = speed * delta
	if character.can_move:
		move_along_path(walk_distance)


func _unhandled_input(event):
	if character.position.distance_to(player1.position) > character.position.distance_to(player2.position):
		_update_navigation_path(character.position, player2.position)
		character.player = player2
	else:
		_update_navigation_path(character.position, player1.position)
		character.player = player1


func move_along_path(distance):
	var last_point = character.position
	var direction = Vector2()
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		direction.x = path[0].x - last_point.x
		direction.y = path[0].y - last_point.y
		character.vect_dir = direction
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			character.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	character.position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = get_simple_path(start_position, end_position, true)
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	path.remove(0)
	set_process(true)
