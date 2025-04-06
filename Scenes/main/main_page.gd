extends Control



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")




func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("q"):
		get_tree().quit()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	pass # Replace with function body.
