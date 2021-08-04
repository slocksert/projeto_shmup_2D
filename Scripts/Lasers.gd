extends Node2D

export(NodePath) var Ship

func _ready():
	if Ship:
		Ship = get_node(Ship)
	else:
		set_process(false)
		
func _process(delta):
	global_position.x = (Ship.global_position.x - 100) * 0.002 * -200

