extends Node2D

signal gameLost

var speed: int


var rng = RandomNumberGenerator.new()
const riss1 = preload("res://scene prefabs/level2/riss1.tscn")
const riss2 = preload("res://scene prefabs/level2/riss2.tscn")
const riss3 = preload("res://scene prefabs/level2/riss3.tscn")
var size
var foodList
var closestFood

var framesSinceSpawn: int
var framesSinceFoodReevaluation : int


# Called when the node enters the scene tree for the first time.
func _ready():
	foodList= get_tree().get_nodes_in_group("food")
	reevaluateFood()
	framesSinceFoodReevaluation = 0
	framesSinceSpawn = 0
	size = 0
	speed = 0
	var bullet = riss1.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	framesSinceSpawn += 1
	framesSinceFoodReevaluation += 1
	if framesSinceFoodReevaluation >15:
		updateFood()
		reevaluateFood()
		framesSinceFoodReevaluation = 0
	if(not closestFood == null):
		var targetDir = (closestFood.position - position).normalized()
		position = position + 0.1*targetDir*speed * (delta*20)
		if framesSinceSpawn >1000:
			if (framesSinceSpawn%100) == 0:
				speed += 2
			if (framesSinceSpawn%50) == 0:
				var randint = rng.randi_range(0, 10)
				if randint == 1:
					tear1()
				elif randint == 2:
					tear2()
				elif randint == 3:
					tear3()
	if framesSinceSpawn == 2500:
		speed = 30
	if framesSinceSpawn <2500:
		if (framesSinceSpawn%5) == 0:
			size += 0.3
			updateSize()
		if framesSinceSpawn >1000:
			if (framesSinceSpawn%100) == 0:
				speed += 2
	


func reevaluateFood():
	closestFood = foodList.reduce(func(min, food): return food if (
		food.global_position.distance_to(global_position) < min.global_position.distance_to(global_position)
	) else min)
	pass

func updateFood():
	foodList= get_tree().get_nodes_in_group("food")
	pass

func updateSize():
	scale = Vector2(0,0)+ 0.01*size*(Vector2(1,1))

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
	elif(body.is_in_group("collateral")):
		body.queue_free()
		pass
	pass # Replace with function body.


func tear1():
	var riss1 = riss1.instantiate()
	get_parent().add_child(riss1)
	riss1.position = $Marker2D.global_position
	var rot = rng.randf_range(0,6.28)
	riss1.rotation = rot

func tear2():
	var riss2 = riss2.instantiate()
	get_parent().add_child(riss2)
	riss2.position = $Marker2D.global_position
	var rot = rng.randf_range(0,6.28)
	riss2.rotation = rot
	
func tear3():
	var riss3 = riss3.instantiate()
	get_parent().add_child(riss3)
	riss3.position = $Marker2D.global_position
	var rot = rng.randf_range(0,6.28)
	riss3.rotation = rot
