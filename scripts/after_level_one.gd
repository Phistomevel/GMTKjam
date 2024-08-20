extends Node2D

func _process(delta):
	if !%VisualNovel:
		SceneTransition.change_scene("res://level scenes/level_two.tscn")
