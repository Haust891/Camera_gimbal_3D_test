extends Node

onready var _transition_rect = $SceneTransitionRect

func _ready():
	$AudioStreamPlayer2.play()

func _on_Button_pressed():
	$AudioStreamPlayer.play()
	$Tween.interpolate_property($AudioStreamPlayer2, "volume_db",-8,-80,1.00,Tween.TRANS_SINE,Tween.EASE_IN,0)
	$Tween.start()
	
func _on_AudioStreamPlayer_finished():
	#get_tree().change_scene("res://Scene.tscn")
	_transition_rect.transition_to("res://Scene.tscn")
