extends Line2D

var target
var point

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_parent()

func _physics_process(delta):
	global_position = Vector2(0, 0)
	global_rotation = 0
	point = target.position
	add_point(point)