extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var grey = preload("res://Assets/tileGrey.png")
var red = preload("res://Assets/tileRed.png")
var blue = preload("res://Assets/tileBlue.png")
var green = preload("res://Assets/tileGreen.png")
var yellow = preload("res://Assets/tileYellow.png")

onready var sprite = get_node("Sprite")
var score = 10

func _ready():
   if get_parent().name == "Grey Tiles":
       sprite.set_texture(grey)
   if get_parent().name == "Red Tiles":
       sprite.set_texture(red)
       score = 20
   if get_parent().name == "Yellow Tiles":
       sprite.set_texture(yellow)
       score = 30
   if get_parent().name == "Green Tiles":
       sprite.set_texture(green)
       score = 40
   if get_parent().name == "Blue Tiles":
       sprite.set_texture(blue)
       score = 50