extends Node2D

@onready var foodSprites = [
	preload("res://assets/Food/randombakterie_blau.png"),
	preload("res://assets/Food/randombakterie_kartoffel.png"),
	preload("res://assets/Food/randombakterie_lila.png"),
	preload("res://assets/Food/randombakterie_orange.png"),
	preload("res://assets/Food/randombakterie_pink.png"),
	preload("res://assets/Food/randombakterie_tuerkis.png"),
	preload("res://assets/Food/randombakterie2_blauorange.png"),
	preload("res://assets/Food/randombakterie2_lilagruen.png"),
	preload("res://assets/Food/randombakterie2_orangeblau.png"),
	preload("res://assets/Food/randombakterie2_tuerkisrot.png")
	]

var foodShapes = [
	[Vector2(-10, -28), Vector2(-15, -26), Vector2(-21, -20), Vector2(-24, -10), Vector2(-25, -2), Vector2(-21, 13), Vector2(-13, 27), Vector2(-2, 35), Vector2(3, 35), Vector2(8, 33), Vector2(15, 25), Vector2(16, 18), Vector2(12, 9), Vector2(7, 3), Vector2(0, -10), Vector2(-3, -21), Vector2(-5, -25)],
	[Vector2(10, -36), Vector2(13, -20), Vector2(18, 3), Vector2(24, 21), Vector2(24, 34), Vector2(10, 39), Vector2(-7, 31), Vector2(-22, 6), Vector2(-27, -16), Vector2(-26, -20), Vector2(-21, -26), Vector2(-10, -33), Vector2(4, -37)]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	#first_level_dialogue()
	GlobalAudioPlayer.play_first_level_music()
	%CanvasLayer.visible = false
	#get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause()
	
	
	
	if !%VisualNovel:
		%CanvasLayer.visible = true
		%Sprite2D.visible = false
		get_tree().paused = false

func randomPointOnMap():
	var a = randf()
	var b = randf()
	return Vector2(b * 900 * cos(2 * PI * (a/b)), b * 900 * sin(2 * PI * (a/b)))

func spawnFood():
	var newFood = preload("res://scene prefabs/food.tscn").instantiate()
	newFood.global_position = randomPointOnMap()
	var variate = randi_range(0,9)
	newFood.sprite = foodSprites[variate]
	newFood.rotation = randf_range(0, 2*PI)
	newFood.nutritionalValue = 2
	if variate < 6:
		newFood.shape = PackedVector2Array(foodShapes[0])
	else:
		newFood.shape = PackedVector2Array(foodShapes[1])
	add_child(newFood)

func _on_food_spawn_cooldown_timeout():
	spawnFood()

func spawnAntiFoodBacterium():
	var newBacterium = preload("res://scene prefabs/antifood_bacterium.tscn").instantiate()
	newBacterium.global_position = randomPointOnMap()
	# TODO: Roatation ggf. rausnehmen
	newBacterium.rotation = randf_range(0, 2*PI)
	newBacterium.nutritionalValue = 2
	add_child(newBacterium)

func _on_anti_food_bact_cooldown_timeout():
	spawnAntiFoodBacterium()


func _on_black_hole_size_changed(value):
	$player/Camera2D/CanvasLayer.updateBar(value+20)


func _on_black_hole_below_critical():
	$player/Camera2D/CanvasLayer.startWin()


func _on_black_hole_above_critical():
	$player/Camera2D/CanvasLayer.stopWin()


func _on_canvas_layer_game_won():
	print("Yay")
	# TODO: Besserer Übergang (zwischenszene mit level geschafft) 
	# Fade effekt funktioniert nicht für szenen, die mit dialog beginnen!!!!!
	get_tree().change_scene_to_file("res://level scenes/after_level_one.tscn")
	pass # Replace with function body.


func _on_black_hole_game_lost():
	print("Sadge")
	SceneTransition.change_scene("res://level scenes/game_over_screen.tscn")
	pass # Replace with function body.

func pause():
	get_tree().paused = true
	$player/Camera2D/PauseScreen.visible = true


func first_level_dialogue():
	var dia = preload("res://scene prefabs/visual_novel.tscn").instantiate()
	# TODO: implement actual dialogue
	
	dia.SpeakerList = ["Bill II.", "Computer"]
	dia.Pics = ["res://assets/temp/BillFull.png", "res://assets/temp/JukeBot.png"]
	dia.SpeakerPos = [0, 1]
	dia.ConvoList = ["*Beep* *Beep*", "Emergency! Alert! Alert! A blackhole has appeared in petri dish 02!",
	 "What? Black holes don't just appear out of nowhere!", "Alert! Alert! A black hole has appeared in petri dish 02! Emergency protocol activated!",
	"...I didn't even set an emergency protocol. Anyways, what do I have to do?", "Prevent black hole from reaching CRITICIAL MASS!!! and try to hold it under critical mass for 5 seconds.",
	"Alright, sounds easy enough. Wait, how do I make the black hole have less mass?", "Petri dish 02 contains the special bacteria, which you have developed yourself, that convert matter to antimatter.",
	"Ah yeah, I forgot about that.", "Emergency! Emergency!", "I've heard you the first time!"]
	dia.SpeakerTurn = [1, 1, 0, 1, 0, 1, 0 ,1 ,0, 1, 0]
	# Avatars
	add_child(dia)
