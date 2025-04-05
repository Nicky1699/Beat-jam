extends Node2D







func _on_s_body_entered(body: Node2D) -> void:
	if body.is_in_group("beat") :
		body.in_box_s = true





func _on_d_body_entered(body: Node2D) -> void:
	if body.is_in_group("beat") :
		body.in_box_d = true



func _on_a_body_entered(body: Node2D) -> void:
	if body.is_in_group("beat"):
		body.in_box_a = true
