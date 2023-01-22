extends Node2D


func _on_area_2d_area_entered(_area):
	print("hi")
	$AnimationPlayer.play("picked_up")

func _on_animation_player_animation_finished(anim_name):
	self.queue_free()
