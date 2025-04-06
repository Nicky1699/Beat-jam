extends Node2D
 
var time = Global.s_time
 

@onready var boss_2 = preload("res://Scenes/Entity/boss_2.tscn")

var can_run  =true

func _physics_process(delta):
	if can_run == true:
		time = float(time) +delta
		update_ui()
	
func update_ui():
	# Format time with two decimal places
	var formatted_time = str(time)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)  # Take only two decimal places
	
	Global.s_time= formatted_time
		
	$Label.text = formatted_time


func _on_timer_timeout() -> void:
	can_run = false
