extends RigidBody2D

export var maxspeed = 400
export var minspeed = 200
onready var WallHitSound = get_node("/root/World/WallHitAudio")
onready var TileHitSound = get_node("/root/World/TileHitAudio")

signal score
signal lives
signal shake
signal victory
# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	var WorldNode = get_node("/root/World")
	var CameraNode = get_node("/root/World/Camera2D")
	
	connect("score", WorldNode, "increase_score")
	connect("lives", WorldNode, "decrease_lives")
	connect("victory", WorldNode, "win_game")
	connect("shake", CameraNode, "start")

func _physics_process(delta):
	if (linear_velocity.length() > maxspeed):
		linear_velocity = linear_velocity.normalized() * maxspeed
	elif (linear_velocity.length() < minspeed):
		linear_velocity - linear_velocity.normalized() * minspeed
	
	$LineTrail.trailLength = linear_velocity.length() / 20
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Tiles"):
			emit_signal("score", body.score)
			body.queue_free()
			emit_signal("shake")
			TileHitSound.play()
			print(get_tree().get_nodes_in_group("Tiles").size())
			if get_tree().get_nodes_in_group("Tiles").size() <= 1:
				emit_signal("victory")
		elif body.name == "Wall" or body.name == "Paddle":
			WallHitSound.play()		
			
	if position.y > get_viewport_rect().end.y:
		queue_free()
		if get_tree().get_nodes_in_group("Balls").size() < 1:
			emit_signal("lives")