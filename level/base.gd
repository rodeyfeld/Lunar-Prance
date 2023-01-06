extends Node2D

class_name Base

@onready var ground_path = $GroundPath
@onready var terrain1 = $Terrain1
@onready var terrain2 = $Terrain2
var path_follow_2d = null
var bat
const bat_scene = preload("res://actor/enemy/bat/bat.tscn")
signal update_score

func _ready():
	path_follow_2d = PathFollow2D.new()
	ground_path.add_child(path_follow_2d)
	bat = bat_scene.instantiate()
	path_follow_2d.add_child(bat)


func _physics_process(delta):
	path_follow_2d.progress_ratio += .01
	if path_follow_2d.progress_ratio >= .99:
		if bat.is_hit:
			print(bat.is_hit)
			bat.is_hit = false
		else:
			print("emit")
			emit_signal("update_score")
		path_follow_2d.progress_ratio = 0.0
	print("t1:", terrain1.position.x)
	print("t2:", terrain2.position.x)
	if terrain1.position.x <= -720:
		terrain1.position.x = 720
	elif terrain2.position.x <= -720:
		terrain2.position.x = 720  
	var terrain_movement = 3
#	var terrain_movement = floor(delta * 200)
	terrain1.position.x -= terrain_movement
	terrain2.position.x -= terrain_movement
