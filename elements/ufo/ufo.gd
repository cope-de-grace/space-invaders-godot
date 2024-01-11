extends Node2D

var direction := Vector2.RIGHT
var speed := 25

func _process(delta: float):
	global_position += direction * speed * delta
