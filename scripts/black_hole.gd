extends Node2D

signal gameLost

@export var speed : int = 3

var size
var foodList
var closestFood

var framesSinceFoodReevaluation : int


# Called when the node enters the scene tree for the first time.
func _ready():
	foodList= get_tree().get_nodes_in_group("food")
	reevaluateFood()
	framesSinceFoodReevaluation = 0
	size = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	framesSinceFoodReevaluation += 1
	if framesSinceFoodReevaluation >15:
		updateFood()
		reevaluateFood()
		framesSinceFoodReevaluation = 0
	if(not closestFood == null):
		var targetDir = (closestFood.position - position).normalized()
		position = position + targetDir*speed * (delta*20)


func reevaluateFood():
	closestFood = foodList.reduce(func(min, food): return food if (
		food.global_position.distance_to(global_position) < min.global_position.distance_to(global_position)
	) else min)
	pass

func updateFood():
	foodList= get_tree().get_nodes_in_group("food")
	pass

func updateSize():
	scale = Vector2(1,1)+ 0.1*size*(Vector2(1,1))

func _on_area_2d_body_entered(body):
	#check if body is food
	if(body.is_in_group("food")):
		size += body.nutritionalValue
		body.queue_free()
		updateSize()
		updateFood()
		reevaluateFood()
		pass
	elif(body.is_in_group("antifood")):
		size += body.nutritionalValue
		body.queue_free()
		updateSize()
		pass
	elif(body.name =="player"):
		gameLost.emit()
	pass # Replace with function body.
