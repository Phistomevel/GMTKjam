extends Node2D

signal gameOver

var progress : int = 0
var fuel1 : bool = true
var fuel2 : bool = true
var fuel3 : bool = true
var fuel4 : bool = true
var fuel5 : bool = true


func _ready():
	GlobalAudioPlayer.play_third_level_music()
	%EXIT.visible = false
	%ExitArea.monitoring = false


func _process(delta):
	if(progress > 4):
		%EXIT.visible = true
		%ExitArea.monitoring = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		pause()
	

func _on_exit_area_body_entered(body):
	if(body.name =="player"):
		gameOver.emit()
		SceneTransition.change_scene("res://level scenes/after_level_three.tscn")
	pass 




func _on_fuel_area_body_entered(body):
	if(body.is_in_group("fuel") and fuel1):
		body.queue_free()
		%FUEL.visible = false
		%FuelArea.monitoring = false
		progress += 1
		fuel1 = false
	pass




func _on_fuel_area_2_body_entered(body):
	if(body.is_in_group("fuel") and fuel2):
		body.queue_free()
		%FUEL2.visible = false
		%FuelArea2.monitoring = false
		progress += 1
		fuel2 = false
	pass


func _on_fuel_area_3_body_entered(body):
	if(body.is_in_group("fuel") and fuel3):
		body.queue_free()
		%FUEL3.visible = false
		%FuelArea3.monitoring = false
		progress += 1
		fuel3 = false
	pass


func _on_fuel_area_4_body_entered(body):
	if(body.is_in_group("fuel") and fuel4):
		body.queue_free()
		%FUEL4.visible = false
		%FuelArea4.monitoring = false
		progress += 1
		fuel4 = false
	pass


func _on_fuel_area_5_body_entered(body):
	if(body.is_in_group("fuel") and fuel5):
		body.queue_free()
		%FUEL5.visible = false
		%FuelArea5.monitoring = false
		progress += 1
		fuel5 = false
	pass


func _on_black_hole_level_3_game_lost():
	SceneTransition.change_scene("res://level scenes/game_over_level_3.tscn")
	
func pause():
	get_tree().paused = true
	$player/Camera2D/PauseScreen.visible = true
