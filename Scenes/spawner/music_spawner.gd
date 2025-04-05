extends Node2D


@onready var beat_node = preload("res://Scenes/spawner/beat.tscn")






func _on_timer_timeout() -> void:
	spawn_beat()
	#print(spawn_pos())


func spawn_beat():
	var beat = beat_node.instantiate()
	var chn = randi()%4
	if chn == 1:
		beat.rotation = 90
	elif chn ==2:
		beat.rotation = 180
	elif chn ==3:
		beat.rotation = 360
	else:
		beat.rotation = 270
	beat.position = spawn_pos()
	add_child(call_deferred("add_child",beat))

	

	

func spawn_pos():
	var chance = randi() % 3
	match chance:
		0:return %up2.global_position
		1:return %down2.global_position
		2:return %left2.global_position
		3:return #%right2.global_position
	return Vector2.ZERO 
