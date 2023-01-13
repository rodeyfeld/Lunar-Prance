extends CharacterBody2D

class_name Player

@onready var animation_player = $Area2D2/AnimationPlayer
@onready var jump_timer = $JumpTimer
@onready var foot_collider = $FootCollider
@onready var foot_area = $FootArea2D

var MAX_SPEED = 100

var is_on_ground = true

func _ready():
	velocity.x = MAX_SPEED

func _physics_process(delta):
	velocity.y += 6
	velocity.x = MAX_SPEED
	if Input.is_action_just_pressed("jump"):
		if jump_timer.get_time_left() > 0:
			print("fall")
#			print(overlapping_bodies)
			if !is_on_ground:
				foot_collider.set_deferred("disabled", true)
			jump_timer.stop()
		else:
			jump_timer.start()
	if velocity.y > 6:
		animation_player.play("fall")
	elif velocity.y == 6:
		animation_player.play("run")
#	print(velocity)
	move_and_slide()

#func _on_animation_player_animation_finished(anim_name):
#	if anim_name == "":
#
#	else:
#		animation_player.play("run")

func jump():
	velocity.y -= 200
	animation_player.play("jump")

func _on_foot_area_2d_body_entered(body):
	is_on_ground = true
	foot_collider.set_deferred("disabled", false)

func _on_jump_timer_timeout():
	jump()


func _on_foot_area_2d_body_exited(body):
	is_on_ground = false
	foot_collider.set_deferred("disabled", false)
