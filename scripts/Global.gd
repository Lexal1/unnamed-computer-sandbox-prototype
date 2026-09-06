extends Node

const SYNTH_1 = preload("res://assets/audio/synth1.ogg")
const SYNTH_2 = preload("res://assets/audio/synth2.ogg")
const SYNTH_3 = preload("res://assets/audio/synth3.ogg")
const SYNTH_4 = preload("uid://cr4lfh73qb7nc")
const SYNTH_5 = preload("uid://bhyawgcw5kpfy")
const SYNTH_6 = preload("uid://dq4a2b17kusep")

@onready var music_timer: Timer = $Music/Timer
@onready var music: AudioStreamPlayer = $Music
@onready var music_two: AudioStreamPlayer = $Music/MusicTwo

const CHUNK_SIZE = Vector3(16,32,16)

const TEXTURE_ATLAS_SIZE = Vector2(4,4)

var time = Time.get_time_dict_from_system()

var world_seed = Time.get_unix_time_from_system()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug2b"):
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

func _on_timer_timeout() -> void:
	print(time.get("hour"))
	@warning_ignore("standalone_ternary")
	music_two.play() if time.get("hour") > 21 or time.get("hour") < 7 else music.play()
	@warning_ignore("standalone_ternary")
	await music.finished if music.playing else await music_two.finished
	#SHUT UPPPPPPPPP
	music_timer.wait_time = randi_range(9,99)
	music_timer.start()
