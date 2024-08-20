extends Node2D

signal gameLost
signal sizeChanged(value)
signal belowCritical
signal aboveCritical

var speed : int

var size
var foodList
var closestFood

var framesSinceFoodReevaluation : int


# Called when the node enters the scene tree for the first time.
func _ready():
	foodList= get_tree().get_nodes_in_group("food")
	reevaluateFood()
	framesSinceFoodReevaluation = 0
	speed = 30
	size = 50
	updateSize()
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
		position = position + 0.025*targetDir*speed * (delta*20)


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
	speed = size*2
	sizeChanged.emit(size)
	if size < -5:
		belowCritical.emit()
	elif size > -5:
		aboveCritical.emit()
	if size >= 80:
		gameLost.emit()

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
