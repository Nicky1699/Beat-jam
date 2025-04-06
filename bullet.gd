extends Area2D


@onready var boss= get_tree().get_first_node_in_group("boss")
@onready var ui = get_tree().get_first_node_in_group("UI")

var direction:Vector2
@export var speed  =200




func _physics_process(delta):
	direction  = (boss.position - position).normalized()
	position += direction * speed * delta



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("boss"):
		boss.boss_health -=30
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("slash"):
		area.queue_free()
