extends CharacterBody2D


@onready var bullet_node = preload("res://Scenes/Projectiles/boss_bullet.tscn")
@onready var player = get_tree().get_first_node_in_group("player")

@onready var slash_node= preload("res://Scenes/Entity/slash.tscn")

@onready var down: RayCast2D = $up
@onready var up: RayCast2D =$down


var boss_health :float= 100:
	set(value):
		boss_health = value
		$"../UI/boss_health".value = value
		if boss_health <=0:
			get_tree().change_scene_to_file("res://Scenes/UI/win_ui.tscn" )



var can_up : bool =  true
var can_down : bool =  true

var not_front : bool 

var is_move = false


func _physics_process(delta: float) -> void:
	_movement(delta)

	


func _movement(delta):
	if up.is_colliding():
		can_up =false
		can_down = true
	elif down.is_colliding():
		can_down =false
		can_up = true
		
	if can_down==true:
		position += Vector2(0,1)
		#is_move= false
	elif can_up==true:
		position -= Vector2(0,1)
		#is_move= false
	move_and_slide()

func shoot():
	var bullet =slash_node.instantiate()
	bullet.position = $Marker2D.global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)
	





func _on_fire_rate_timeout() -> void:
	shoot()
