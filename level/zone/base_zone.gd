extends Node2D



@onready var cloud_path_follow_2d = $CloudBackground/Path2D/PathFollow2D
@onready var cloud_container = $CloudBackground
var clouds = null

func _ready():
	clouds = get_tree().get_nodes_in_group("clouds")
	for cloud in clouds:
		cloud.progress_ratio = randf_range(0, 1)



func _physics_process(_delta):
	for cloud in clouds:
		cloud.progress_ratio += .001
		if cloud.progress_ratio == 1:
			cloud.progress_ratio = 0

