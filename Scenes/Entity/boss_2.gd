extends CharacterBody2D


@onready var bullet_node = preload("res://Scenes/Projectiles/boss_bullet.tscn")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var ui  = get_tree().get_first_node_in_group("UI")


@onready var animation_player: AnimationPlayer =$CanvasLayer/AnimationPlayer

@onready var down: RayCast2D = $down
@onready var up: RayCast2D = $up

var boss_health :float= 100:
	set(value):
		boss_health = value
		$"../UI/boss_health".value = value
		if boss_health <=0:
			animation_player.play("fade_out")

func level_change():
		get_tree().change_scene_to_file("res://Scenes/Levels/level_3.tscn" )

var can_up : bool =  true
var can_down : bool =  true

var not_front : bool 

var is_move = false


func _physics_process(delta: float) -> void:
	pass

	if not_front == false:
		_movement(delta)
	elif not_front == true:
		move_front(delta)
	
	
func move_front(delta):
	velocity = (player.position - position).normalized() * 100
	move_and_collide(velocity * delta)


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


func _on_player_hit_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		ui._health -= 100
