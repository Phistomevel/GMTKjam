extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://level scenes/level_one.tscn")


func _on_options_button_pressed():
	print("Somebody didn't code the settings...")
