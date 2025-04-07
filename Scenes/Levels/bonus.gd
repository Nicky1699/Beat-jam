extends Node2D


var can_bullet : bool
var can_slash :  bool
@onready var timer_tunnner: Node2D = $level_1/UI/timer_tunnner

@onready var bullet: Timer = $bullet


@onready var shoot_points: Marker2D = $shoot_points
@onready var slash_node =  preload("res://Scenes/Entity/slash.tscn")
@onready var bullet_node = preload("res://Scenes/Projectiles/boss_bullet.tscn")

func shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = $shoot_points.global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)
	
func slash_shoot():
	var bullet = slash_node.instantiate()
	bullet.position = $shoot_points.global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)
	



func _on_bullet_timeout() -> void:
	var chance = randi()%2
	match chance:
		0:
			shoot()
		1:
			slash_shoot()
	
	


func _on_game_over_timeout() -> void:
	print("game over")
