extends Node2D

var PRE_ASTEROID = preload("res://Cenas/Asteroid.tscn")
var pre_explosion = preload("res://Cenas/explosion.tscn")


export(NodePath) var Ship

func _ready():
	create_asteroid()
	
func create_asteroid():
	var ast = PRE_ASTEROID.instance()
	ast.connect("explosao", self, "ast_destroied")
	ast.global_position = Vector2(rand_range(40,120), -60)
	add_child(ast)
	
	var random_time = rand_range(.2,1)
	
	yield(get_tree().create_timer(random_time),"timeout")
	create_asteroid()

func ast_destroied(ast):
	var e = pre_explosion.instance()
	add_child(e)
	e.global_position = ast.global_position
	
	
	
