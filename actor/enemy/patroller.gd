extends Node2D

@onready var patrol_path = $Path2D/PathFollow2D

func _physics_process(delta):
#	print(patrol_path.progress)
	patrol_path.progress += 100 * delta
