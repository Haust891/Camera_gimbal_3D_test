extends ColorRect

export(String, FILE, "*.tscn") var next_file_path

onready var _anim_player = $AnimationPlayer

func _ready():
	_anim_player.play_backwards("Fade")
	
func transition_to(_next_scene = next_file_path):
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	
	get_tree().change_scene(_next_scene)

