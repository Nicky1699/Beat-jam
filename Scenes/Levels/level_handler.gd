extends Node2D




func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_3.tscn")

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")
