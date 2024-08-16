extends Node2D

signal gameLost

@export var speed : int = 10

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
	if framesSinceFoodReevaluation >15:
		reevaluateFood()
	var targetDir = (closestFood.position - position).normalized()
	position = position + targetDir*speed * (delta*20)


func reevaluateFood():
	closestFood = foodList.reduce(func(max, food): return food if (
		(food.position.x-position.x)^2+(food.position.y-position.y)^2>max
	) else max)
	pass

func updateFood():
	foodList= get_tree().root.get_nodes_in_group("food")
	pass

func updateSize():
	scale = 1+ 0.1*size

func _on_area_2d_body_entered(body):
	#check if body is food
	if(body.is_in_group("food")):
		size += body.nutritionalValue
		updateSize()
		body.queue_free()
		pass
	elif(body.name =="player"):
		gameLost.emit()
	pass # Replace with function body.
