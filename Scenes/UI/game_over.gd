extends Node2D


func _on_restart_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main_page.tscn")
