extends Node


var stored_positions_x = []
var stored_positions_y = []
var count = 0

onready var itemList = get_node("ItemList")

func _ready():
	$Head2/MeshInstance.visible = false
	$Head/MeshInstance.visible = true
	$TextAnnot1.visible = false
	$TextAnnot2.visible = false
	$TextAnnot3.visible = false

func _process(delta):
	if ($Head/MeshInstance.visible == true):
		$TextHead.visible = true
	else:
		$TextHead.visible = false
		
	if ($Head2/MeshInstance.visible == true):
		$TextHead2.visible = true
	else:
		$TextHead2.visible = false

#tweens camera to selected position
func _on_ItemList_item_activated(index):
	var tween = $Tween
	var rd_x = stored_positions_x[index]
	var rd_y = stored_positions_y[index]
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

#saves a position in arrays and creates item on itemlist
func _on_ButtonSavePosition_pressed():
	var rd_x = $CameraGimbal.rotation_degrees
	var rd_y = $CameraGimbal/InnerGimbal.rotation_degrees
		
	stored_positions_x.append(rd_x)
	stored_positions_y.append(rd_y)
	
	var positionname = "Position "
	itemList.add_item(positionname + str(1+count))
	count += 1
		
	print('stored positions x ', stored_positions_x)
	print('stored positions y ',stored_positions_y)


func _on_ButtonScreenCapture_pressed():
	var image = get_viewport().get_texture().get_data()
	var time = OS.get_datetime()
	var path = "res://screenshots/screenshot"
	var pathtime = (path + var2str(time["hour"]) + var2str(time["minute"]) + var2str(time["second"]) + ".png")
	image.flip_y()
	image.save_png(pathtime)
	print(pathtime)


func _on_ButtonHead2_pressed():
	if ($Head2/MeshInstance.visible == true):
		$Head2/MeshInstance.visible = false
	elif ($Head2/MeshInstance.visible == false):
		$Head2/MeshInstance.visible = true


func _on_ButtonHead1_pressed():
	if ($Head/MeshInstance.visible == true):
		$Head/MeshInstance.visible = false
	elif ($Head/MeshInstance.visible == false):
		$Head/MeshInstance.visible = true


func _on_ButtonAnnot1_pressed():
	var tween = $Tween
	var rd_x = Vector3(-0, -136.93692, 0)
	var rd_y = Vector3(-28.934364, 0, 0)
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$TextAnnot1.visible = true


func _on_ButtonAnnot2_pressed():
	var tween = $Tween
	var rd_x = Vector3(-0, -0.572958, 0)
	var rd_y = Vector3(-33.518044, 0, 0)
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$TextAnnot2.visible = true
	


func _on_ButtonXAnnot1_pressed():
	$TextAnnot1.visible = false


func _on_ButtonXAnnot2_pressed():
	$TextAnnot2.visible = false


func _on_ButtonAnnot3_pressed():
	var tween = $Tween
	var rd_x = Vector3(-0, -165.298309, 0)
	var rd_y = Vector3(54.144501, 0, 0)
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$TextAnnot3.visible = true


func _on_ButtonXAnnot3_pressed():
	$TextAnnot3.visible = false
