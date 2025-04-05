class_name Boss_handler
extends CharacterBody2D








var can_up : bool =  true
var can_down : bool =  true

var down
var up


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
		position += Vector2(0,30) 
		#is_move= false
	if can_up==true:
		position -= Vector2(0,30)
		#is_move= false
	move_and_slide()






func _on_timer_timeout() -> void:
	pass
	
