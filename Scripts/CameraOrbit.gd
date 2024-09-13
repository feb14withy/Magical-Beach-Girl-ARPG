extends Node3D
# look stats
var lookSensitivity : float = 15.0
var minLookAngle : float = -20.0
var maxLookAngle : float = 75.0
# vectors
var mouseDelta = Vector2()
# components
@onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# get the rotation to apply to the camera and playe
	var rot = Vector3(mouseDelta.y, mouseDelta.x, 0) * lookSensitivity * delta
	# camera vertical rotation
	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle)
	# player horizontal rotation
	player.rotation_degrees.y -= rot.y
	# clear the mouse movement vector
	mouseDelta = Vector2()
	pass

# called when an input is detected
func _input (event):
	# set "mouseDelta" when we move our mouse
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
