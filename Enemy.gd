extends KinematicBody2D

const projectile = preload("res://Bullet.tscn")

var test_counter = 0
var test_counter2 = 0
var valid_bullets = []

func _draw():
	# this is bad...but temporary :) 
	var points_array = PoolVector2Array()
	var points_array2 = PoolVector2Array()
	var points_array3 = PoolVector2Array()
	var points_array4 = PoolVector2Array()
	var time_step = 0.02
	var speed = 400
	for i in range(128):
		var time = i * time_step
		var point = Vector2(time * 600, 0)
		points_array.append(Vector2(time * 600, 0))
		points_array2.append(Vector2(0, time * 600))
		points_array3.append(Vector2((time * 600) * -1, 0))
		points_array4.append(Vector2(0, (time * 600) * -1))
	draw_multiline(points_array, Color.whitesmoke, 15.0, false)
	draw_multiline(points_array2, Color.whitesmoke, 15.0, false)
	draw_multiline(points_array3, Color.whitesmoke, 15.0, false)
	draw_multiline(points_array4, Color.whitesmoke, 15.0, false)

func read_bullet_file():
	var bullet_file = File.new()
	bullet_file.open("res://enemy-test-bullet.json", File.READ)
	var bullet_content = bullet_file.get_as_text()
	bullet_file.close()
	var p_bullet = JSON.parse(bullet_content).result
	for bullet in p_bullet["bullet_pool"]:
		print(bullet)
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	read_bullet_file()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	test_counter += 1
	if test_counter % 60 == 0:
		var bullet = projectile.instance()
		bullet.set("cardinal_direction", "S")
		add_child(bullet)
