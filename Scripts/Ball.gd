extends RigidBody2D

export var maxspeed = 400
export var minspeed = 200

signal score
signal lives
# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	var WorldNode = get_node("/root/World")
	connect("score", WorldNode, "increase_score")
	connect("lives", WorldNode, "decrease_lives")
	
func _physics_process(delta):
	if (linear_velocity.length() > maxspeed):
		linear_velocity = linear_velocity.normalized() * maxspeed
	elif (linear_velocity.length() < minspeed):
		linear_velocity - linear_velocity.normalized() * minspeed
		
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Tiles"):
			emit_signal("score", body.score)
			body.queue_free()
		elif body.is_in_group("Powerups"):
			print("POWER UP")
			
	if position.y > get_viewport_rect().end.y:
		if get_tree().get_nodes_in_group("Balls").size() <= 1:
			emit_signal("lives")
		queue_free()