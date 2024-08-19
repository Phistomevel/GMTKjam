extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalAudioPlayer.play_menu_music()

func _on_start_game_button_pressed():
	GlobalAudioPlayer.play_click()
	get_tree().change_scene_to_file("res://level scenes/level_one.tscn")


func _on_options_button_pressed():
	GlobalAudioPlayer.play_click()
	add_child(preload("res://scene prefabs/sound_settings.tscn").instantiate())
