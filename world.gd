extends Node2D

#@onready var level = $Base
@onready var score = $hud_layer/hud/score_container/score_label
@onready var player = $player
@onready var health_full = $hud_layer/hud/health_container/health_patch
@onready var zone = $base_zone
const HEART_UI_WIDTH = 15
const HEART_UI_HEIGHT = 15




func _ready():
	health_full.size.x = HEART_UI_WIDTH * player.health
	player.global_position.x = 200

func _on_player_player_hit_enemy():
	health_full.size.x = HEART_UI_WIDTH * player.health
	if player.health <= 0:
		pass

func _on_player_player_hit_pickup(val):
	score.text = str(int(score.text) + val)
