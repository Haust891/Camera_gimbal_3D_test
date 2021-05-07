extends MenuButton

var popup
onready var anot3 = get_parent().get_parent().get_node("WindowDialog3")
onready var tween = get_parent().get_parent().get_node("Tween")
onready var cameragimbal = get_parent().get_parent().get_node("CameraGimbal")
onready var innergimbal = get_parent().get_parent().get_node("CameraGimbal/InnerGimbal")


func _ready():
	popup = get_popup()
	
	popup.connect("id_pressed", self, "_on_item_pressed")
	
func _on_item_pressed(ID):
	if(ID == 0):
		var rd_x = Vector3(-0, -165.298309, 0)
		var rd_y = Vector3(54.144501, 0, 0)
		tween.interpolate_property(cameragimbal, "rotation_degrees", cameragimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.interpolate_property(innergimbal, "rotation_degrees", innergimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		anot3.show()
