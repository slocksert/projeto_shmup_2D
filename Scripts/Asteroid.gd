extends Node2D

var motion = Vector2()
var chosen = 0
onready var speedY = rand_range(30,200)
onready var speedX = rand_range(-60,60)

signal explosao(node)

func _ready():
	randomize()
	for a in $Asteroids.get_children():
		a.visible = false
	chosen = randi() % $Asteroids.get_child_count() + 1
	
	
	var node = get_node("Asteroids/asteroid-" + str(chosen))
	
	node.visible = true
	
	$Area2D/CollisionShape2D.shape.radius = node.texture.get_width() / 2
	
func _process(delta):
	translate(Vector2(speedX,speedY) * delta)
	
	if global_position.x > 220:
		global_position.x = -5
	if global_position.x < -5:
		global_position.x = 220
		
	if global_position.y > 300:
		queue_free()
	
	
func _on_Area2D_area_entered(area):
	get_tree().call_group("Camera", "treme" , 1)
	queue_free()
