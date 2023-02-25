extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (PackedScene) var Lpiece
const piece = preload("res://assets/Piece_id_1.tscn")
var pieces = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range (1,16):
		pieces.append(load("res://assets/Piece_id_" + str(i) + ".tscn"))

func _input(event):
	if event.is_action_pressed("ui_left"):
		randomize()
		var new_shape = pieces[(randi() % len(pieces))].instance()#piece.instance()
		#print(pieces)
		#fnew_shape.
		#new_shape.position = Vector3(0,0,0)#get_viewport().get_mouse_position()
		add_child(new_shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
