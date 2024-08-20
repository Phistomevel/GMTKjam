extends Control


func _on_start_game_button_pressed():
	GlobalAudioPlayer.play_click()
	get_tree().change_scene_to_file("res://level scenes/after_level_one.tscn")


func _on_options_button_pressed():
	GlobalAudioPlayer.play_click()
	add_child(preload("res://scene prefabs/sound_settings.tscn").instantiate())
