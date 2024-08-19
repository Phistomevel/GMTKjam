extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_return_button_pressed():
	print("pressed")
	queue_free()


func _on_audio_slider_master_value_changed(value):
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/MasterValue.text = str(value*100)+"%"


func _on_audio_slider_music_value_changed(value):
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/MusicValue.text = str(value*100)+"%"


func _on_audio_slider_sound_value_changed(value):
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/SoundValue.text = str(value*100)+"%"
