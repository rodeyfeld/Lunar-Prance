extends Node2D

class_name Base

@onready var ground_path = $GroundPath
var path_follow_2d = null
const bat_scene = preload("res://actor/enemy/bat/bat.tscn")


func _ready():
	path_follow_2d = PathFollow2D.new()
	ground_path.add_child(path_follow_2d)
	var bat = bat_scene.instantiate()
	path_follow_2d.add_child(bat)


func _physics_process(delta):
	print(path_follow_2d)
	path_follow_2d.progress_ratio += .01

