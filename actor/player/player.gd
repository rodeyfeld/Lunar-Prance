extends CharacterBody2D

class_name Player

@onready var animation_player = $Area2D2/AnimationPlayer
#@onready var foot_collider = $Area2D2/Area2D/CollisionShape2D
var curr_pos

func _ready():
	velocity.x = 100
	curr_pos = position

func _physics_process(delta):
	velocity.y += 6
	if Input.is_action_just_pressed("jump"):
		curr_pos = position
		velocity.y -= 200
		animation_player.play("jump")
#	move_and_collide(velocity)
	if velocity.y > 6:
		animation_player.play("fall")
	elif velocity.y == 6:
		animation_player.play("run")
	print(velocity)
#	move_and_collide(velocity * delta)
	move_and_slide()

#func _on_animation_player_animation_finished(anim_name):
#	if anim_name == "":
#
#	else:
#		animation_player.play("run")



func _on_foot_area_2d_body_entered(body):
	print("hit_ara")
