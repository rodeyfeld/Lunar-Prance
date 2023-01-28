extends Node2D




@onready var moon = $MoonParallaxBackground/ParallaxLayer/Sprite2D
var reached_apex = false

func _physics_process(delta):
	if moon.position.y < -350:
		reached_apex = true
		
	if reached_apex:
		moon.position.y += .1 
	else:
		moon.position.y -= .1
	
#	moon.global_position.x -= .1
	
