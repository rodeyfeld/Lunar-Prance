extends Node2D


@onready var moon_path = $MoonPath
@onready var moon_path_follow_2d = $MoonPath/PathFollow2D


func _ready():
	var moon_arc_points = draw_moon_arc()

	for point in moon_arc_points:
		moon_path.curve.add_point(point)

func _draw():
	draw_moon_arc()

func _physics_process(_delta):

	moon_path_follow_2d.progress_ratio -= .0002
	if moon_path_follow_2d.progress_ratio <= 0.0:
		moon_path_follow_2d.progress_ratio = 99.0
		
func draw_moon_arc():
	var center = Vector2(320, 325)
	var radius = 300
	var angle_from = -90
	var angle_to = 90
	var nb_points = 32
	var points_arc = PackedVector2Array()
	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	
	return points_arc
