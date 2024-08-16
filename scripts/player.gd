extends CharacterBody2D

@export var speed : int = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down")).normalized()*delta*speed	
	var collision : KinematicCollision2D = move_and_collide(direction)
	if collision:
		if collision.get_collider().is_in_group("food"):
			collision.get_collider().apply_central_force(100*(collision.get_collider().position-position))
		pass
