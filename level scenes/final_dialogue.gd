extends Node2D





func _on_visual_novel_finished():
	get_tree().paused=false
	SceneTransition.change_scene("res://level scenes/title_page.tscn")
