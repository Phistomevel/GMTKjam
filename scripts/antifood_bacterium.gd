extends RigidBody2D

@export var sprite : Texture2D
@export var shape  : Shape2D

@export var nutritionalValue : int = 0 #idk rename when you find a different name

# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite:
		get_node("./Sprite2D").texture = sprite
	if shape:
		get_node("./CollisionShape2D").shape = shape
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("");
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("food") and not body.is_in_group("antifood_bacterium"):
		var pos = body.global_position
		body.queue_free()
		var spawnAntifood = preload("res://scene prefabs/antifood.tscn").instantiate()
		spawnAntifood.global_position = pos
		spawnAntifood.nutritionalValue = -2
		get_parent().add_child(spawnAntifood)
