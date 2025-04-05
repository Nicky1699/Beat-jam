extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var beat  =get_tree().get_first_node_in_group("note")
@onready var ui = get_tree().get_first_node_in_group("UI")


var in_box_a = false
var in_box_s = false
var in_box_d = false
var in_box_f = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("a") and in_box_a == true: 
		player.is_move = true
		ui.shoot_bar +=20
		queue_free()
	if Input.is_action_just_pressed("s") and in_box_s == true:
		player.is_move = true
		ui.shoot_bar +=20
		queue_free()
	if Input.is_action_just_pressed("d") and in_box_d == true:
		player.is_move = true
		ui.shoot_bar +=20
		queue_free()
	if Input.is_action_just_pressed("f") and in_box_f == true:
		player.is_move = true
		ui.shoot_bar +=20
		queue_free()

func  _physics_process(delta: float) -> void:
	position += Vector2(0,180) *delta



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
