extends Control


@onready var player = get_tree().get_first_node_in_group("player")
@export var bullet_node = preload("res://Scenes/Projectiles/bullet.tscn")
@onready var ui_pause = preload("res://Scenes/UI/pause_ui.tscn")


@onready var contiue: TextureButton = $esc/pause_ui/contiue
@onready var continue_text: RichTextLabel = $esc/pause_ui/continue_text
@onready var exit: TextureButton = $esc/pause_ui/exit
@onready var exit_text: RichTextLabel = $esc/pause_ui/exit_text



var _health :float= 100:
	set(value):
		_health = value
		$player_health.value = value
		if _health <=0:
			print("death")

var shoot_bar :float= 0:
	set(value):
		shoot_bar = value
		$shoot_bar.value = value
		if shoot_bar ==100:
			shoot()
			shoot_bar =0

var boss_health :float= 100:
	set(value):
		boss_health = value
		$boss_health.value = value
		if boss_health <=0:
			print("boss_death")



func shoot():
	var bullet =bullet_node.instantiate()
	bullet.position = $"../player/Marker2D2".global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)


func _on_esc_pressed() -> void:
	print("dowoooooooooooooooooooooooooooooooooooo")
	get_tree().change_scene_to_file("res://Scenes/UI/pause_ui.tscn")
