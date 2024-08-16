extends RigidBody2D

@export var sprite : Texture2D
@export var shape  : Shape2D

var nutritionalValue : int #idk rename when you find a different name

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("./Sprite2D").texture = sprite
	get_node("./CollisionShape2D").shape = shape
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("");
	pass # Replace with function body.
