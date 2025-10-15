extends Node2D

@export var debug_label : Label

func _ready():
	debug_label.text = "%s : %d\n" % [MultiplayerManager.SERVER_IP, MultiplayerManager.SERVER_PORT]
	if OS.has_feature("dedicated_server"):
		print("Detected dedicated server...")
		debug_label.text += "HOST\n"
		MultiplayerManager.host()

func _process(_delta):
	if Input.is_action_just_pressed("z"):
		debug_label.text += "HOST\n"
		MultiplayerManager.host()
	if Input.is_action_just_pressed("x"):
		debug_label.text += "CLIENT\n"
		MultiplayerManager.join()
