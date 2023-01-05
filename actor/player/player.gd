extends CharacterBody2D

class_name Player

@onready var animation_player = $Area2D2/AnimationPlayer
@onready var foot_collider = $Area2D2/Area2D/CollisionShape2D


	

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		print("jump")
		animation_player.play("jump")
	move_and_slide()


func _on_animation_player_animation_finished(anim_name):
	animation_player.play("run")

