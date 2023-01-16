extends Node2D


func _on_area_2d_area_entered(_area):
	self.queue_free()
