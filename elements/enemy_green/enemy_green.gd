extends CharacterBody2D

const PROJECTILE_SCENE = preload("res://elements/enemy_projectile/enemy_projectile.tscn")

@onready var raycast_left := $RayCastLeft
@onready var raycast_right := $RayCastRight
@onready var animation_enemy_green := $AnimatedSprite2D

func _physics_process(_delta):
	if raycast_left.is_colliding() or raycast_right.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")

func destroy():
	Globals.change_points(10)
	Events.enemy_died.emit()
	animation_enemy_green.play("death")
	queue_free()

func shot():
	var projectile = PROJECTILE_SCENE.instantiate()
	projectile.global_position += global_position + Vector2(0, -20)
	add_child(projectile)

func _on_death_timer_timeout():
	pass
