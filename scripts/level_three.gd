extends Node2D

signal gameOver

var progress : int = 0

func _ready():
	%EXIT.visible = false
	%ExitArea.monitoring = false


func _process(delta):
	if(progress > 4):
		%EXIT.visible = true
		%ExitArea.monitoring = true
	

func _on_exit_area_body_entered(body):
	if(body.name =="player"):
		gameOver.emit()
	pass 




func _on_fuel_area_body_entered(body):
	if(body.is_in_group("fuel")):
		body.queue_free()
		%FUEL.visible = false
		%FuelArea.monitoring = false
		progress += 1
	pass




func _on_fuel_area_2_body_entered(body):
	if(body.is_in_group("fuel")):
		body.queue_free()
		%FUEL2.visible = false
		%FuelArea2.monitoring = false
		progress += 1
	pass


func _on_fuel_area_3_body_entered(body):
	if(body.is_in_group("fuel")):
		body.queue_free()
		%FUEL3.visible = false
		%FuelArea3.monitoring = false
		progress += 1
	pass


func _on_fuel_area_4_body_entered(body):
	if(body.is_in_group("fuel")):
		body.queue_free()
		%FUEL4.visible = false
		%FuelArea4.monitoring = false
		progress += 1
	pass


func _on_fuel_area_5_body_entered(body):
	if(body.is_in_group("fuel")):
		body.queue_free()
		%FUEL5.visible = false
		%FuelArea5.monitoring = false
		progress += 1
	pass
