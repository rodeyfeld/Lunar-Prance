extends Node2D

#@onready var level = $Base
@onready var score = $CanvasLayer/Control/Score
@onready var player = $player
@onready var health_full = $CanvasLayer/Control2/HeartUIFull

const HEART_UI_WIDTH = 15
const HEART_UI_HEIGHT = 15


func _ready():
	health_full.size.x = HEART_UI_WIDTH * player.health
	player.global_position.x = 200

func add_num():
	score.text = str(int(score.text) + 1)


func _on_player_enemy_hit_player():
	health_full.size.x = HEART_UI_WIDTH * player.health
	if player.health <= 0:
		pass
		
	
