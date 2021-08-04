extends Node2D

var speed = 200

func _physics_process(delta):
	translate(Vector2(0,-1) * speed * delta )
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
