extends Node2D

#@onready var level = $Base
@onready var score = $CanvasLayer/Control/Score
@onready var player = $player


func add_num():
	score.text = str(int(score.text) + 1)



func _on_player_enemy_hit_player():
	if player.health >= 0:
	
