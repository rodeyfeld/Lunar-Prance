extends Node2D

const level_1 = "res://world.tscn"
@onready var player = $content/player_container/player
@onready var player_action_timer = $content/player_container/player/player_action_timer
@onready var player_walk_timer = $content/player_container/player/player_walk_timer



func _ready():
	if player.mode == player.PLAYER_MODES.MENU:
		player_walk_timer.start()
		player.walk()

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file(level_1)

func _on_player_action_timer_timeout():
	player.velocity.x = 15
	player.walk()
	player_walk_timer.start()

func _on_player_walk_timer_timeout():
	player.velocity.x = 0
	if randi() % 2 == 0:
		player.look_up()
	else:
		player.look_around()
	player_action_timer.start()
	
