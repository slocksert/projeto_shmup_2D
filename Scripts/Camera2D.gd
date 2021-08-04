extends Camera2D

var time = 0
var stg = 0

func _ready():
	pass 

func _process(delta):
	if stg > 0:
		time += 100 * delta
		global_position = Vector2(stg,stg).rotated(time)
		stg = lerp(stg, 0, 1)
		
func treme(f):
	stg = f
