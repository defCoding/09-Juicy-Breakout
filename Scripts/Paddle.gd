extends KinematicBody2D

var new_ball = preload("res://Scenes/Ball.tscn")

func _physics_process(delta):
	position = Vector2(get_viewport().get_mouse_position().x, position.y)
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if not get_parent().get_node("Balls").has_node("Ball"):
			var ball = new_ball.instance()
			ball.position = position - Vector2(0, 32)
			ball.name = "Ball"
			ball.linear_velocity = Vector2(200, -200)
			get_parent().get_node("Balls").add_child(ball)