extends Spatial

var mouse_sensitivity = 0.005
var mouse_control = false
var zoom_speed = 0.09
var zoom = 1.5
export var min_zoom = 0.4
export var max_zoom = 3.0


func _process(delta):
	scale = lerp(scale, Vector3.ONE * zoom, zoom_speed)
	check_mouse_control()
	
#uses mouse input to pan camera
func _unhandled_input(event):
	#Change Vector3.DOWN and .RIGHT for inversion of camera motion
	if mouse_control and event is InputEventMouseMotion:
		if event.relative.x != 0:
			rotate_object_local(Vector3.DOWN, event.relative.x * mouse_sensitivity)
		if event.relative.y != 0:
			$InnerGimbal.rotate_object_local(Vector3.RIGHT, event.relative.y * mouse_sensitivity)
	if event.is_action_pressed("cam_zoom_in"):
		zoom -= zoom_speed
	if event.is_action_pressed("cam_zoom_out"):
		zoom += zoom_speed
	zoom = clamp(zoom, min_zoom, max_zoom)

#controls if mouse 3 button is pressed
func check_mouse_control():
	if Input.is_action_pressed("mouse_3"):
		mouse_control = true
	else:
		mouse_control = false
		
