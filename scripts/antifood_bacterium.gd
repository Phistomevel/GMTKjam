extends RigidBody2D

@export var sprite : Texture2D
@export var shape  : PackedVector2Array

@export var nutritionalValue : int = 0 #idk rename when you find a different name

@export var rotationSpeed : float = 0.001

@onready var antiFoodSprites = [
	preload("res://assets/Antifood/AntiMatter_1.png"),
	preload("res://assets/Antifood/AntiMatter_2.png"),
	preload("res://assets/Antifood/AntiMatter_3.png")]

var antiFoodShapes = [PackedVector2Array([Vector2(2, -26), Vector2(10, -22), Vector2(18, -15), Vector2(23, -6), Vector2(26, 8), Vector2(26, 15), Vector2(21, 23), Vector2(14, 26), Vector2(6, 26), Vector2(-9, 19), Vector2(-23, 9), Vector2(-26, 3), Vector2(-25, -5), Vector2(-19, -17), Vector2(-11, -26), Vector2(-9, -28), Vector2(-4, -28)]),
PackedVector2Array([Vector2(33, 1), Vector2(33, 1), Vector2(31, -6), Vector2(14, -22), Vector2(7, -24), Vector2(2, -21), Vector2(-12, -5), Vector2(-22, 16), Vector2(-24, 24), Vector2(-21, 25), Vector2(1, 19), Vector2(20, 11), Vector2(33, 3)]),
PackedVector2Array([Vector2(2, -26), Vector2(10, -22), Vector2(18, -15), Vector2(23, -6), Vector2(26, 8), Vector2(26, 15), Vector2(21, 23), Vector2(14, 26), Vector2(6, 26), Vector2(-9, 19), Vector2(-23, 9), Vector2(-26, 3), Vector2(-25, -5), Vector2(-19, -17), Vector2(-11, -26), Vector2(-9, -28), Vector2(-4, -28)])
]

# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite:
		get_node("./Sprite2D").texture = sprite
	if shape:
		get_node("./CollisionShape2D").polygon = shape
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotateAreaSprite(rotationSpeed)


func rotateAreaSprite(rotationSpeed):
	%Sprite2D2.rotate(rotationSpeed)


func _on_body_entered(body):
	print("");
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("food") and not body.is_in_group("antifood_bacterium"):
		var pos = body.global_position
		body.queue_free()
		var spawnAntifood = preload("res://scene prefabs/antifood.tscn").instantiate()
		spawnAntifood.global_position = pos
		spawnAntifood.nutritionalValue = -2 # edit as required
		var variate = randi_range(0,2)
		spawnAntifood.sprite = antiFoodSprites[variate]
		spawnAntifood.shape = PackedVector2Array(antiFoodShapes[variate])
		spawnAntifood.rotation = randf_range(0, 2*PI)
		spawnParticle(pos)
		get_parent().add_child(spawnAntifood)

func spawnParticle(pos):
	%PartikelAntimaterieSpawn.global_position = pos
	%PartikelAntimaterieSpawn.restart()
