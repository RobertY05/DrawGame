extends Node2D

var speed = 20
var rotation_speed = 5

@export var player_id : int:
	set(id):
		player_id = id
		$InputSynchronizer.set_multiplayer_authority(id)

func _ready():
	modulate.r = randf_range(0.5, 1)
	modulate.g = randf_range(0.5, 1)
	modulate.b = randf_range(0.5, 1)


func _physics_process(_delta):
	if not multiplayer.is_server():
		return
	
	var dir = $InputSynchronizer.direction
	global_position += speed * dir.normalized()
	print(dir)
