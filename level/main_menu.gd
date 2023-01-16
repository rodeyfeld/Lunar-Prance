extends Node2D

const level_1 = "res://world.tscn"

func _on_texture_button_pressed():
	print("pressed")
	get_tree().change_scene_to_file(level_1)
