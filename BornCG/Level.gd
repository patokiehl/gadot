extends Spatial

#const piece = load("res://assets/Piece_id_1.tscn")
var pieces = []
var counter = 0

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
		add_child(new_shape)
		print("Before:" + str(new_shape.translation))
		new_shape.translate(Vector3(counter,0, 0))
		#new_shape.translation = Vector3(counter,0, 0)#get_viewport().get_mouse_position()
		print("After:" + str(new_shape.translation))
		for node in new_shape.get_children():
			for child in node.get_children():
				child.translate(Vector3(10,0,0))
				print(child.global_translation)
		counter += 100



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
