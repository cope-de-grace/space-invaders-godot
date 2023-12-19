extends Node2D

var direction := Vector2.RIGHT
var speed := 50

func _process(delta: float):
	global_position += direction * speed * delta

func destroy():
	Globals.change_points(100)
	Events.enemy_died.emit()
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
