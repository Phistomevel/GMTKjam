extends AudioStreamPlayer

# Musik
const menu_music = preload("res://Audio/RandomVibeAudioSample.mp3")
const first_level_music = preload("res://Audio/RandomPuzzleGameAudioSample.mp3")
const second_level_music = preload("res://Audio/RandomHeavyIndustryAudioSample.mp3")
const third_level_music = preload("res://Audio/RandomHecticNightAudioSample.mp3")

# Sound
const click = preload("res://Audio/click.wav")

func _play_music(music: AudioStream, volume=0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
func play_menu_music():
	_play_music(menu_music)
	
func play_first_level_music():
	_play_music(first_level_music, -14.0)
	
func play_second_level_music():
	_play_music(second_level_music, -8.0)
	
func play_third_level_music():
	_play_music(third_level_music, -10.0)
	
func play_sound(sound: AudioStream, volume=-4.0):
	var sound_player = AudioStreamPlayer.new()
	sound_player.name = "sound_Player"
	sound_player.stream = sound
	sound_player.volume_db = volume
	sound_player.bus = "Sound"
	add_child(sound_player)
	sound_player.play()
	
	await sound_player.finished
	
	sound_player.queue_free()
	
func play_click():
	play_sound(click)
