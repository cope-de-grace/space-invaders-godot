extends Node2D

const ROW_STEP = 0.5
const SPEED_BOOST := 0.2

@onready var block_timer := $BlockTimer
@onready var shot_timer := $ShotTimer

var direction := Vector2.RIGHT
var speed := 0.5

func _process(delta: float):
	global_position += direction * speed * delta
	
func change_direction():
	if block_timer.time_left > 0:
		return
	direction = Vector2.LEFT if direction == Vector2.RIGHT else Vector2.RIGHT
	global_position.y += ROW_STEP
	speed += SPEED_BOOST
	block_timer.start()

func _on_shot_timer_timeout():
	var enemies = get_tree().get_nodes_in_group("enemy_green")
	if enemies.size() >0:
		enemies.pick_random().shot()
