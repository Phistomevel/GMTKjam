extends Node2D


func _on_visual_novel_finished():
	
	SceneTransition.change_scene("res://level scenes/level_two.tscn")
	get_tree().paused=false
