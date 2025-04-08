extends Control


@onready var player = get_tree().get_first_node_in_group("player")
@export var bullet_node = preload("res://Scenes/Projectiles/bullet.tscn")
@onready var ui_pause = preload("res://Scenes/UI/pause_ui.tscn")


@onready var contiue: TextureButton = $esc/pause_ui/contiue
@onready var continue_text: RichTextLabel = $esc/pause_ui/continue_text
@onready var exit: TextureButton = $esc/pause_ui/exit
@onready var exit_text: RichTextLabel = $esc/pause_ui/exit_text

@export var can_Shoot : bool


var _health :float= 100:
	set(value):
		_health = value
		$player_health.value = value
		if _health <=1:
			get_tree().change_scene_to_file("res://Scenes/UI/game_over.tscn")

var shoot_bar :float= 0:
	set(value):
		shoot_bar = value
		$shoot_bar.value = value
		if shoot_bar ==100 and can_Shoot == true:
			shoot()
			shoot_bar =0


func shoot():
	var bullet =bullet_node.instantiate()
	bullet.position = $"../player/Marker2D2".global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)


func _on_esc_pressed() -> void:
	get_tree().paused = true
	

func _on_play_pressed() -> void:
	get_tree().paused = false
