extends CharacterBody2D

class_name Enemy

@onready var animated_sprite = $AnimatedSprite2D
@export var speed:float = 100
@export var path_to_follow:Path2D
var is_hit:bool = false

func _physics_process(delta):
	move_and_slide()


func _on_area_2d_area_entered(_area):
	self.queue_free()


func _on_detection_zone_area_entered(area):
	velocity.x = speed  * -1 
