extends Node2D

signal gameOver

var progress : int = 0
var fuel1 : bool = true
var fuel2 : bool = true
var fuel3 : bool = true
var fuel4 : bool = true
var fuel5 : bool = true


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
