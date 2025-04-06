extends Area2D



var direction
var speed = 250

@onready var health  =get_tree().get_first_node_in_group("UI")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var cam  =get_tree().get_first_node_in_group("camera")

func _ready():

	direction  = (player.position - position).normalized()
	
	
func _physics_process(delta):

	position += direction *speed *delta
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("player"):
		cam.shake(cam.shake(1,1))
		health._health -=30
		queue_free()
	

	
