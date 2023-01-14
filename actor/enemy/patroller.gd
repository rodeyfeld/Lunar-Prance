extends Node2D

@onready var patrol_path = $Path2D/PathFollow2D

func _physics_process(delta):
	patrol_path.progress_ratio += .1 * delta
	if patrol_path.progress_ratio == 1:
		print("done")
