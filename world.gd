extends Node2D

#@onready var level = $Base
@onready var score = $Control/Score

#
#func _ready():
#	level.connect("update_score", add_num)
	

func add_num():
	score.text = str(int(score.text) + 1)
