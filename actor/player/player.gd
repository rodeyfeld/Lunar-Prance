extends CharacterBody2D

class_name Player

@onready var animation_player = $BodyArea/AnimationPlayer
@onready var jump_timer = $JumpTimer
@onready var player_collider = $PlayerCollider
@onready var foot_area = $FootArea2D
@onready var audio_player = $AudioStreamPlayer
@onready var death_emmiter = $CPUParticles2D
@onready var body_collider = $BodyArea/CollisionShape2D
@export var health:int = 5
var MAX_SPEED = 100
var jump_modifier = 1.0
var is_on_ground = true
var is_alive = true
@export var mode = PLAYER_MODES.MENU

enum PLAYER_MODES {
	PLAY,
	MENU
}

signal player_hit_enemy
signal player_hit_pickup
signal player_complete_level

func _physics_process(_delta):
	if mode == PLAYER_MODES.PLAY and is_alive:
		velocity.y += 6
		velocity.x = MAX_SPEED
		if Input.is_action_just_pressed("jump"):
			if jump_timer.get_time_left() > 0:
				if !is_on_ground:
					player_collider.set_deferred("disabled", true)
				jump_timer.stop()
			else:
				jump_timer.start()
		if velocity.y > 6:
			animation_player.play("fall")
		elif velocity.y == 6:
			animation_player.play("run")
		
		if is_on_floor():
			jump_modifier = 1
		elif jump_modifier >= 0:
			jump_modifier -= .005
	
	move_and_slide()

func jump():
	audio_player.play()
	velocity.y -= 200 * jump_modifier
	animation_player.play("jump")
	
func walk():
	animation_player.play("walk")

func look_around():
	animation_player.play("look_around")

func look_up():
	animation_player.play("look_up")
	
func die():
	is_alive = false
	death_emmiter.emitting = true
	body_collider.set_deferred("disabled", true)
	velocity.x = 0
	animation_player.play("die")
	
	
func _on_foot_area_2d_body_entered(_body):
	is_on_ground = true
	player_collider.set_deferred("disabled", false)

func _on_jump_timer_timeout():
	jump()


func _on_foot_area_2d_body_exited(_body):
	is_on_ground = false
	player_collider.set_deferred("disabled", false)


func _on_body_area_area_entered(area):
	if area.get_collision_layer_value(3):
		health -= 1
		print(health)
		emit_signal("player_hit_enemy")
	elif area.get_collision_layer_value(8):
		emit_signal("player_hit_pickup", 1)
	elif area.get_collision_layer_value(10):
		print("done")
		emit_signal("player_complete_level")
