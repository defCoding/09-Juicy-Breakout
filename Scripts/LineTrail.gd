extends Line2D

var target
var point

var trailLength = 15
# Called when the node enters the scene tree for the first time.
func _ready():
	set_end_cap_mode(LINE_CAP_ROUND)
	target = get_parent()

func _physics_process(delta):
	global_position = Vector2(0, 0)
	global_rotation = 0
	point = target.position
	add_point(point)
	while get_point_count() > trailLength:
		remove_point(0)