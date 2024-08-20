extends CanvasLayer

func _on_button_pressed():
	unpause()

func unpause():
	visible = false
	get_tree().paused = false
