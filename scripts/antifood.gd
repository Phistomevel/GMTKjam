extends RigidBody2D

@export var sprite : Texture2D
@export var shape  : PackedVector2Array

@export var nutritionalValue : int = 0 #negative!!!

# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite:
		get_node("./Sprite2D").texture = sprite
	if shape:
		get_node("./CollisionShape2D").set_polygon(shape)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("");
	pass # Replace with function body.
