extends Spatial

#const piece = load("res://assets/Piece_id_1.tscn")
var pieces = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range (1,16):
		pieces.append(load("res://assets/Piece_id_" + str(i) + ".tscn"))

func _input(event):
	if event.is_action_pressed("ui_left"):
		randomize()
		var position = Vector3(randi() % 4,0,randi() % 4)
		var new_shape = pieces[(randi() % len(pieces))].instance()#piece.instance()
		#pieces[0].
		#var piece = load("res://assets/Piece_id_1.tscn")
		#new_shape.
		#new_shape.set_position(position)
		#print(pieces)
		#fnew_shape.
		#print(position)
		#new_shape.translation = position#get_viewport().get_mouse_position()
		new_shape.set_translation(position)
		add_child(new_shape)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
