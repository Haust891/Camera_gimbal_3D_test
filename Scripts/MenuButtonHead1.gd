extends MenuButton

var popup
onready var mesh = get_parent().get_parent().get_node("Head/MeshInstance")
onready var information = get_parent().get_parent().get_node("WindowDialogTextHead")
onready var cameragimbal = get_parent().get_parent().get_node("CameraGimbal")
onready var head = get_parent().get_parent().get_node("Head")

func _ready():
	popup = get_popup()
	
	popup.connect("id_pressed", self, "_on_item_pressed")
	
func _on_item_pressed(ID):
	if(ID == 0):
		if (mesh.visible == true):
			mesh.visible = false
		elif (mesh.visible == false):
			mesh.visible = true
	if(ID == 1):
		information.show()
	if(ID == 2):
		cameragimbal.translation = head.translation
