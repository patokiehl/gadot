extends Spatial

var pieces = []
var tile_size = Vector2.ZERO
const board_size = Vector2(11,11)
const ray_length = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	#Load pieces
	for i in range (1,16):
		pieces.append(load("res://assets/Piece_id_" + str(i) + ".tscn"))
		
	tile_size = Vector2(
		get_node("Cursor").texture.get_height(),
		get_node("Cursor").texture.get_width()
	)
	#tile_size = Vector2(get_node("Cursor").size.x,get_node("Cursor").size.y)
	
	#Scale Board
	#var board = get_node("Floor")
	#for child in board.get_children():
	#	child.set_scale(Vector3(2*board_size.x, 1, 2*board_size.y))
	#	child.transform.translate(Vector3(board_size.x,1,board_size.y))
		
	#Scale Cursor
	var cursor = get_node("Cursor")
	cursor.set_scale(Vector3(0.5 * board_size.x, 0.5 * board_size.y, 1))
	
func spawn_shape(position):
	randomize()
	var new_shape = pieces[(randi() % len(pieces))].instance()#piece.instance()
	#print(pieces)
	#fnew_shape.
	add_child(new_shape)
		
	for node in new_shape.get_children():
		for child in node.get_children():
			child.translate(position)

func _input(event):
	if event is InputEventMouseButton:
		var cast = raycast_from_mouse(get_viewport().get_mouse_position(), 1)
		if cast.get("position"):
			#print(cast.position)
			#print(tile_size)
			var tile_hovered = world_to_grid(cast.position)#Vector3(position.x / 2), 0, floor(cast.position.z / 2))
			#print("tile_hovered:",tile_hovered)
			#print(grid_to_world(Vector3(2 * tile_hovered.x, 5, 2 * tile_hovered.y)))
			#spawn_shape(grid_to_world(Vector3(2 * tile_hovered.x, 5, 2 * tile_hovered.z)))
			spawn_shape(Vector3(cast.position.x, 5, cast.position.z))
			
	if event is InputEventMouseMotion:
		var cast = raycast_from_mouse(get_viewport().get_mouse_position(), 1)
		if cast.get("position"):
			#print(cast.position)
			#print(tile_size)
			var tile_hovered = world_to_grid(cast.position)#Vector3(position.x / 2), 0, floor(cast.position.z / 2))
			print(tile_hovered)
			
			var cursor = get_node("Cursor")
			cursor.translation = tile_hovered

	if event.is_action_pressed("ui_left"):
		randomize()
		var new_shape = pieces[(randi() % len(pieces))].instance()#piece.instance()
		#print(pieces)
		#fnew_shape.
		add_child(new_shape)
		
		var position = Vector3((randi() % 9)*2, 5, (randi() % 9) * 2)
		for node in new_shape.get_children():
			for child in node.get_children():
				child.translate(position)


func raycast_from_mouse(m_pos,collision_mask):
	var cam = get_node("Camera")
	var ray_start = cam.project_ray_origin(m_pos)
	var ray_end = ray_start + cam.project_ray_normal(m_pos) * ray_length
	var space_state = get_world().direct_space_state
	return space_state.intersect_ray(ray_start,ray_end, [], collision_mask)#["position"]

func world_to_grid(pos):
	var v = pos / Vector3(4,4,4)#tile_size
	return Vector3(floor(v.x), floor(v.y), floor(v.z))
	
func grid_to_world(pos):
	print("pos:", pos)
	var v = pos * Vector3(4,4,4)#tile_size
	print("v:", v)
	return v + Vector3(4,4,4) #/2.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
