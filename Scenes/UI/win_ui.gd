extends Node2D


@onready var timer_tunnner: Node2D = $timer_tunnner
@onready var animation_player_2: AnimationPlayer = $CanvasLayer/AnimationPlayer2

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	animation_player.play("idle")
	


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main_page.tscn")


func _on_bonus_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/bonus.tscn")
	
	
