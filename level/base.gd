extends Node2D

class_name Base

@onready var ground_path = $GroundPath
@onready var terrain1 = $Terrain1
@onready var terrain2 = $Terrain2
@onready var moon_path = $MoonPath
@onready var moon_path_follow_2d = $MoonPath/PathFollow2D
var ground_path_follow_2d = null

var bat
const bat_scene = preload("res://actor/enemy/bat/bat.tscn")
signal update_score

func _ready():
	ground_path_follow_2d = PathFollow2D.new()
	var moon_arc_points = draw_moon_arc()
	for point in moon_arc_points:
		moon_path.curve.add_point(point)
	ground_path.add_child(ground_path_follow_2d)
	bat = bat_scene.instantiate()
	ground_path_follow_2d.add_child(bat)
	

func _draw():
	draw_moon_arc()

func _physics_process(delta):
	ground_path_follow_2d.progress_ratio += .01
	moon_path_follow_2d.progress_ratio += .001
	if moon_path_follow_2d.progress_ratio >= .99:
		moon_path_follow_2d.progress_ratio = 0.0
	if ground_path_follow_2d.progress_ratio >= .99:
		if bat.is_hit:
			bat.is_hit = false
		else:
			emit_signal("update_score")
		ground_path_follow_2d.progress_ratio = 0.0
	if terrain1.position.x <= -720:
		terrain1.position.x = 720
	elif terrain2.position.x <= -720:
		terrain2.position.x = 720  
	var terrain_movement = 3
#	var terrain_movement = floor(delta * 200)
	terrain1.position.x -= terrain_movement
	terrain2.position.x -= terrain_movement


func draw_moon_arc():
	var center = Vector2(320, 325)
	var radius = 300
	var angle_from = -90
	var angle_to = 90
	var color = Color(1.0, 0.0, 0.0)
	var nb_points = 32
	var points_arc = PackedVector2Array()
	var curve = Curve2D.new()
	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	
	return points_arc
