extends Node2D


@onready var timer_tunnner: Node2D = $timer_tunnner

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	animation_player.play("idle")
	
