extends ParallaxBackground

var LEFT
var RIGHT

func _physics_process(delta):
	movement()
	input()
	scroll_offset += Vector2(0,2)
	
func input():
	LEFT = Input.is_action_pressed("ui_left")
	RIGHT = Input.is_action_pressed("ui_right")
	

func movement():
	if LEFT:
		scroll_offset += Vector2(0.5,0)
	if RIGHT:
		scroll_offset += Vector2(-0.5,0)
