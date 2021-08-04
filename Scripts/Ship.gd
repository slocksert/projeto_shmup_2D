extends KinematicBody2D

export var speed = 100.0
var motion = Vector2()
var RIGHT
var LEFT
var UP
var DOWN 
var Laser = preload("res://Cenas/Laser.tscn")
var ATTACK
var allow = true
export(NodePath) var Lasers

func _ready():
	if Lasers:
		get_node(Lasers)
	else:
		Lasers = get_parent()
	
	
func _physics_process(delta):
	input()
	movement()
	attack()
	
func input():
	
	RIGHT = Input.is_action_pressed("ui_right")
	LEFT = Input.is_action_pressed("ui_left")
	UP = Input.is_action_pressed("ui_up")
	DOWN = Input.is_action_pressed("ui_down")
	ATTACK = Input.is_action_pressed("ui_accept")

func movement():
	motion.x = -int(LEFT) + int(RIGHT)
	motion.y = -int(UP) + int(DOWN)
	
	move_and_slide(motion * speed)

	global_position.x = clamp(global_position.x, 1 , 159)
	global_position.y = clamp(global_position.y, 24 , 266)

func attack():
	if !allow:
		return

	if ATTACK:
		if get_tree().get_nodes_in_group("Lasers").size() < 3:
			var Bullet = Laser.instance()
			get_node(Lasers).add_child(Bullet)
			Bullet.global_position = $Bullet.global_position
			allow = false
			yield(get_tree().create_timer(0.2), "timeout")
			allow = true
