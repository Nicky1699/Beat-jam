extends Node2D


var can_bullet : bool
var can_slash :  bool
@onready var timer_tunnner: Node2D = $level_1/UI/timer_tunnner

@onready var bullet: Timer = $bullet


@onready var _bullet =get_tree().get_first_node_in_group("bullet")
@onready var _slash =get_tree().get_first_node_in_group("slash")

@onready var shoot_points: Marker2D = $shoot_points
@onready var slash_node =  preload("res://Scenes/Entity/slash.tscn")
@onready var bullet_node = preload("res://Scenes/Projectiles/boss_bullet.tscn")

var time_up : bool = false
var timer_108 = false

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
	get_tree().change_scene_to_file("res://Scenes/Levels/bonus.tscn")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("slash") or area.is_in_group("bullet"):
		area.dmg =100
		print(area.dmg)
	if time_up == true:
		area.speed = 400
	if timer_108 == true:
		area.speed = 450


func _on_bullet_speed_timeout() -> void:
	time_up = true


func _on_timer_timeout() -> void:
	timer_108 = true
