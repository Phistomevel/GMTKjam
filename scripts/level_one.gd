extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func randomPointOnMap():
	var a = randf()
	var b = randf()
	return Vector2(b * 800 * cos(2 * PI * (a/b)), b * 800 * sin(2 * PI * (a/b)))

func spawnFood():
	var newFood = preload("res://scene prefabs/food.tscn").instantiate()
	newFood.global_position = randomPointOnMap()
	#TODO: Sprite und Shape des foods einstellen
	add_child(newFood)

func _on_food_spawn_cooldown_timeout():
	spawnFood()

func spawnAntiFoodBacterium():
	# var newBacterium = preload().instantiate()
	pass

func _on_anti_food_bact_cooldown_timeout():
	spawnAntiFoodBacterium()
