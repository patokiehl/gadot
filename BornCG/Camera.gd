extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const zoom_amount = Vector3(0.05, 0.05, 0.05)

# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(Vector3.ZERO, Vector3(0,1,0))

func _input(event):
	if event.is_action_pressed("ui_up"):
		self.translation -= zoom_amount
	if event.is_action_pressed("ui_down"):
		self.translation += zoom_amount
	#if event.is_pressed():
		#var position = get_camera_transform()
	#	if event.button_index == BUTTON_WHEEL_UP:
			#move closer to origin
	#		self.translation -= zoom_amount
			
	#	if event.button_index == BUTTON_WHEEL_DOWN:
			#move closer to origin
	#		self.translation += zoom_amount
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
