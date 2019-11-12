extends Area2D

onready var PowerupSound = get_node("/root/World/PowerupAudio")
var new_ball = preload("res://Scenes/Ball.tscn")

func _on_Powerup_body_entered(body):
	if "Ball" in body.name:
		PowerupSound.play()
		queue_free()
		var ball = new_ball.instance()
		ball.position = body.position
		ball.linear_velocity = body.linear_velocity * -1
		ball.get_node("Sprite").set_texture(preload("res://Assets/ballBlue.png"))
		ball.name = "Ball" + str(get_tree().get_nodes_in_group("Balls").size())
		ball.add_to_group("Balls")
		get_parent().get_parent().get_node("Balls").add_child(ball)