extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func open(): #opens the door, to be entered into pressure plate signal
	self.visible = false
	$CollisionShape2D.set_deferred("disabled",true)
	pass
	
	
func close(): #closes the door, ^^
	self.visible = true
	$CollisionShape2D.set_deferred("disabled",false)
	pass

