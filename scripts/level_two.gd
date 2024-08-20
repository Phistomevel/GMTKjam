extends Node2D

func _ready():
	GlobalAudioPlayer.play_second_level_music()

func _on_level_2_finishline_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scene("res://level scenes/after_level_two_transition.tscn")


func _on_black_hole_level_2_game_lost():
	SceneTransition.change_scene("res://level scenes/game_over_level_2.tscn")
