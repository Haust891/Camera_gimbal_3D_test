extends Node


var stored_positions_x = []
var stored_positions_y = []
var count = 0
onready var displaytext = $PanelContainer/VBoxContainer/Panel/RichTextLabel

onready var itemList = get_node("ItemList")

func _ready():
	$AudioStreamPlayer.play()
	$Head2/MeshInstance.visible = false
	$Head/MeshInstance.visible = true
	displaytext.text = $WindowDialogTextHead/TextHead.text
	$WindowDialogStart.show()
	
	

func _process(delta):
	pass
	
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
		$WindowDialogTextHead2.show()
	
	#$CameraGimbal.translation = $Head2.translation


func _on_ButtonHead1_pressed():
	
	if ($Head/MeshInstance.visible == true):
		$Head/MeshInstance.visible = false
	elif ($Head/MeshInstance.visible == false):
		$Head/MeshInstance.visible = true
		$WindowDialogTextHead.show()

	#$CameraGimbal.translation = $Head.translation


func _on_ButtonAnnot1_pressed():
	var tween = $Tween
	var rd_x = Vector3(-0, -136.93692, 0)
	var rd_y = Vector3(-28.934364, 0, 0)
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$WindowDialog1.show()


func _on_ButtonAnnot2_pressed():
	var tween = $Tween
	var rd_x = Vector3(-0, -0.572958, 0)
	var rd_y = Vector3(-33.518044, 0, 0)
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$WindowDialog2.show()
	


func _on_ButtonAnnot3_pressed():
	var tween = $Tween
	var rd_x = Vector3(-0, -165.298309, 0)
	var rd_y = Vector3(54.144501, 0, 0)
	tween.interpolate_property($CameraGimbal, "rotation_degrees", $CameraGimbal.rotation_degrees, rd_x, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($CameraGimbal/InnerGimbal, "rotation_degrees", $CameraGimbal/InnerGimbal.rotation_degrees, rd_y, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$WindowDialog3.show()



func _on_ButtonReturnGimbal_pressed():
	var gimbal = $CameraGimbal
	gimbal.translation = Vector3(0,0,0)


func _on_ButtonFocus1_pressed():
	$CameraGimbal.translation = $Head.translation


func _on_ButtonFocus2_pressed():
	$CameraGimbal.translation = $Head2.translation


func _on_TextureButton_toggled(button_pressed):
	if(button_pressed):
		$AudioStreamPlayer.volume_db = -80
	else:
		$AudioStreamPlayer.volume_db = -3


func _on_ButtonProjectInfo_pressed():
	$WindowDialogProject.show()
