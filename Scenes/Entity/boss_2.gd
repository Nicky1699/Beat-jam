extends CharacterBody2D


@onready var bullet_node = preload("res://Scenes/Projectiles/boss_bullet.tscn")
@onready var player = get_tree().get_first_node_in_group("player")

@onready var down: RayCast2D = $down
@onready var up: RayCast2D = $up



var can_up : bool =  true
var can_down : bool =  true

var not_front : bool 

var is_move = false


func _physics_process(delta: float) -> void:
	pass

	if not_front == false:
		_movement(delta)
	elif not_front == true:
		move_front()
	
	
func move_front():
	var direction  = (player.position - position).normalized()	
	position += Vector2(-1,0)


func _movement(delta):
	if up.is_colliding():
		can_up =false
		can_down = true
	if down.is_colliding():
		can_down =false
		can_up = true
		
	if can_down==true:
		position += Vector2(0,1) 
		#is_move= false
	if can_up==true:
		position -= Vector2(0,1)
		#is_move= false
	move_and_slide()

func shoot():
	var bullet =bullet_node.instantiate()
	bullet.position = $Marker2D.global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)





func _on_phase__2_timeout() -> void:
	not_front=true


func _on_fire_rate_timeout() -> void:
	if not_front == false:
		shoot()
