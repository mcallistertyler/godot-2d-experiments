extends Node2D

export (String, "N", "S", "E", "W") var cardinal_direction = "N"
export (float) var speed = 100.0
var velocity = Vector2()

func _process(delta):
	if not get_node("VisibilityNotifier2D").is_on_screen():
		queue_free()
	match cardinal_direction:
		"N":
			position += transform.y * (speed * -1) * delta
		"S":
			position += transform.y * speed * delta
		"E":
			position += transform.x * speed * delta
		"W":
			position += transform.x * (speed * -1) * delta
		_:
			print("Received invalid direction, defaulting to North")
			position += transform.y * (speed * -1) * delta
