extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _init():
	#self.translation = vector
	#print(vector)
	pass

func set_position(vector):
	self.translation = vector
	
func set_translation(vector):
	#self.translation = vector
	print("Start children:")
	for child in self.get_children():
		child.translate(vector)
		#child.translation += vector
		print(child.translation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
