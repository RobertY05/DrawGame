extends MultiplayerSynchronizer

@export var direction := Vector2.ZERO

func _ready():
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)

func _physics_process(_delta):
	direction = Vector2.ZERO
	if Input.is_action_pressed("w"):
		direction += Vector2.UP
	if Input.is_action_pressed("s"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("a"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("d"):
		direction += Vector2.RIGHT
