extends Sprite

var speed = 256
var tile_size = 32

var last_position = Vector2()
var target_position = Vector2()
var movedir = Vector2()

onready var ray = $RayCast2D

func _ready():
	position = position.snapped(Vector2(tile_size, tile_size))
	last_position = position
	target_position = position
	
func _process(delta):
	# movement
	if ray.is_colliding():
		position = last_position
		target_position = last_position
	else:
		position += speed * movedir * delta
		if position.distance_to(last_position) >= tile_size - (speed * delta):
			position = target_position
	
	# idle
	if position == target_position:
		get_movedir()
		last_position = position
		target_position += movedir * tile_size
		
func get_movedir():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	# no diagonal movement
	if movedir.x != 0 && movedir.y != 0:
		movedir = Vector2.ZERO
		
	if movedir != Vector2.ZERO:
		ray.cast_to = movedir * tile_size / 2
