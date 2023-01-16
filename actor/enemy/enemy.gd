extends CharacterBody2D

class_name Enemy

@onready var animated_sprite = $AnimatedSprite2D

@export var path_to_follow:Path2D
var is_hit:bool = false

func _on_area_2d_area_entered(_area):
	self.queue_free()

