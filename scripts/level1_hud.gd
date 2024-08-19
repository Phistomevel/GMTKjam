extends CanvasLayer

signal gameWon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timertext = str(snapped($Timer.time_left, 0.1))
	if timertext.length() == 1:
		timertext = timertext + ".0"
	$TextureRect/Label3.text = timertext


func updateBar(val):
	$TextureRect/ProgressBar.value = val

func startWin():
	if $Timer.is_stopped():
		$Timer.start()
	$TextureRect/Label3.visible = true
	
func stopWin():
	$TextureRect/Label3.visible = false
	if not $Timer.is_stopped():
		$Timer.stop()


func _on_timer_timeout():
	gameWon.emit()
