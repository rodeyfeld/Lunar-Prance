extends Node2D

const level_1 = "res://world.tscn"
@onready var player = $content/player_container/player
@onready var other = $content/base_zone/BackPath/ParallaxLayer/Node2D/other
@onready var player_action_timer = $content/player_container/player/player_action_timer
@onready var other_action_timer = $content/base_zone/BackPath/ParallaxLayer/Node2D/other/other_action_timer
@onready var player_walk_timer = $content/player_container/player/player_walk_timer
@onready var other_walk_timer = $content/base_zone/BackPath/ParallaxLayer/Node2D/other/other_walk_timer



func _ready():
	if player.mode == player.PLAYER_MODES.MENU:
		other_walk_timer.start()
		player_walk_timer.start()
		player.animation_player.play("walk")
		other.animation_player.play("walk")

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file(level_1)

func _on_player_action_timer_timeout():
	player.velocity.x = 15
	player.animation_player.play("walk")
	player_walk_timer.start()

func _on_other_action_timer_timeout():
	other.velocity.x -= 10
	other.animation_player.play("walk")
	other_walk_timer.start()

func _on_player_walk_timer_timeout():
	player.velocity.x = 0
	if randi() % 2 == 0:
		player.animation_player.play("look_up")
	else:
		player.animation_player.play("look_around")
	player_action_timer.start()
	
func _on_other_walk_timer_timeout():
	other.velocity.x = 0
	if randi() % 2 == 0:
		other.animation_player.play("look_up")
	else:
		other.animation_player.play("look_around")
	other_action_timer.start()

