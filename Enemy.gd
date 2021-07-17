extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const projectile = preload("res://Bullet.tscn")
var test_counter = 0

func _draw():
	var current_position = position
	var points_array = PoolVector2Array()
	var time_step = 0.02
	var speed = 400
	for i in range(128):
		var time = i * time_step
		var point = Vector2(time * 600, 0)
		points_array.append(point)
	draw_multiline(points_array, Color.whitesmoke, 15.0, false)

# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(get_tree())
