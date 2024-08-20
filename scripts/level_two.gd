extends Node2D

func _ready():
	GlobalAudioPlayer.play_second_level_music()
	

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause()

func _on_level_2_finishline_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scene("res://level scenes/after_level_two_transition.tscn")


func _on_black_hole_level_2_game_lost():
	SceneTransition.change_scene("res://level scenes/game_over_level_2.tscn")


func pause():
	get_tree().paused = true
	$player/Camera2D/PauseScreen.visible = true
