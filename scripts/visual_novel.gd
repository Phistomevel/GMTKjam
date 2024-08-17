extends Control

@export_group("Charaktere")
@export var SpeakerList : Array[String] = []
@export var SpeakerPics : Array[Resource] = []
@export var SpeakerPos : Array[int] = []

@export_group("Inhalt")
@export_multiline var ConvoList : Array[String] = []
@export var SpeakerTurn : Array[int] = []

@export_group("Avatar")
@export var LeftPos : Vector2 = Vector2(127, -40)
@export var LeftScale : Vector2 = Vector2(1, 1)
@export var RightPos : Vector2 = Vector2(891, -40)
@export var RightScale : Vector2 = Vector2(1, 1)

@onready var Text = $TextForm/TextMargin/Text
@onready var SpeakerText = $SpeakerForm/SpeakerMargin/SpeakerName
@onready var SpeakerPic = [$SpeakerPic1, $SpeakerPic2]

var convoind = 0

var lastPos

var tween : Tween
var killtween : Tween

var fin : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$SpeakerPic1.position = LeftPos
	$SpeakerPic1.scale = LeftScale
	$SpeakerPic2.position = RightPos
	$SpeakerPic2.scale = RightScale
	convo()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tween and not tween.is_running():
		fin = true
		tween = null
	if Input.is_action_just_pressed("ui_accept"):
		convo()


func convo():
	if fin:
		convoind += 1
	if convoind < ConvoList.size():
		var curr_speaker = SpeakerTurn[convoind]
		SpeakerText.text = SpeakerList[curr_speaker]
		if lastPos == SpeakerPic[SpeakerPos[curr_speaker-1]]:
			lastPos.modulate = "aaaaaa"
			lastPos = SpeakerPic[SpeakerPos[curr_speaker]]
			lastPos.texture = SpeakerPics[curr_speaker]
			lastPos.visible = true
			lastPos.modulate = "ffffff"
		else:
			lastPos = SpeakerPic[SpeakerPos[curr_speaker]]
			lastPos.texture = SpeakerPics[curr_speaker]
			lastPos.visible = true
		if tween:
			tween.kill()
			tween = null
			Text.visible_ratio = 1
			convoind += 1
		else:
			tween = create_tween()
			Text.visible_ratio = 0
			Text.text = ConvoList[convoind]
			fin = false
			tween.tween_property(Text, "visible_ratio", 1, Text.get_total_character_count()/10.0)
			killtween = tween
	else:
		killtween.kill()
		queue_free()
