extends Node

const SYNTH_1 = preload("res://assets/audio/synth1.ogg")
const SYNTH_2 = preload("res://assets/audio/synth2.ogg")
const SYNTH_3 = preload("res://assets/audio/synth3.ogg")
const SYNTH_5 = preload("uid://bhyawgcw5kpfy")
const SYNTH_6 = preload("uid://dq4a2b17kusep")

@onready var music_timer: Timer = $Music/Timer
@onready var music: AudioStreamPlayer = $Music

const CHUNK_SIZE = Vector3(16,32,16)

const TEXTURE_ATLAS_SIZE = Vector2(4,4)

func _process(delta: float) -> void:
	await music_timer.timeout
	music.play()
	await music.finished
	music_timer.wait_time = randi_range(99,99)
	music_timer.start()
	
