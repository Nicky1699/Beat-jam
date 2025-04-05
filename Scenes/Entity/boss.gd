extends CharacterBody2D








var can_up : bool =  true
var can_down : bool =  true

@onready var down: RayCast2D = $UP
@onready var up: RayCast2D = $DOWN
@onready var front: RayCast2D = $front
@onready var bullet_node = preload("res://Scenes/Projectiles/boss_bullet.tscn")

var is_move = false


func _physics_process(delta: float) -> void:
	#if is_move == true:
	_movement(delta)

	

func _movement(delta):
	if up.is_colliding():
		can_up =false
		can_down = true
	if down.is_colliding():
		can_down =false
		can_up = true
		
	if can_down==true:
		position += Vector2(0,30) *delta
		#is_move= false
	if can_up==true:
		position -= Vector2(0,30) *delta
		#is_move= false

	move_and_slide()

func shoot():
	var bullet =bullet_node.instantiate()
	bullet.position = %Marker2D.global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)




func _on_timer_timeout() -> void:
	shoot()
	
