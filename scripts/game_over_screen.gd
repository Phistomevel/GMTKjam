extends Control


func _on_start_game_button_pressed():
	GlobalAudioPlayer.play_click()
	SceneTransition.change_scene("res://level scenes/level_one.tscn")


func _on_start_game_button_2_pressed():
	GlobalAudioPlayer.play_click()
	SceneTransition.change_scene("res://level scenes/title_page.tscn")


func _on_options_button_pressed():
	GlobalAudioPlayer.play_click()
	add_child(preload("res://scene prefabs/sound_settings.tscn").instantiate())
