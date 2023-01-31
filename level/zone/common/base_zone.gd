extends Node2D




@onready var moon = $MoonParallaxBackground/ParallaxLayer/Sprite2D
var reached_apex = false
var level_complete = false

func _physics_process(_delta):
	if moon.global_position.x <= 320:
		reached_apex = true

		
#		

	if reached_apex:
		moon.position.y += .06 
	else:
		moon.position.y -= .06



