extends CharacterBody2D

@export var speed : int = 200
const SPEED = 600.0
const JUMP_VELOCITY = -4000.0
const ANIMATION_PLAYER_PATH = "Node2D"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	get_node(ANIMATION_PLAYER_PATH).set_assigned_animation("Walking")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down")).normalized()*delta*speed	
	if direction !=Vector2(0,0):
		get_node(ANIMATION_PLAYER_PATH).play()
		rotation = direction.angle() + PI/2
	else:
		get_node(ANIMATION_PLAYER_PATH).pause()
	var collision : KinematicCollision2D = move_and_collide(direction)
	if collision:
		if collision.get_collider().is_in_group("food"):
			collision.get_collider().apply_force(200*direction, 200*direction)
		pass
