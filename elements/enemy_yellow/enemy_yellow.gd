extends CharacterBody2D

const PROJECTILE_SCENE = preload("res://elements/enemy_projectile/enemy_projectile.tscn")

@onready var raycast_left := $RayCastLeft
@onready var raycast_right := $RayCastRight
@onready var animation_enemy_green := $AnimatedSprite2D
@onready var enemy := $"."

func _physics_process(_delta):
	if raycast_left.is_colliding() or raycast_right.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")

func destroy():
	Globals.change_points(5)
	Events.enemy_died.emit()
	$EnemyHit.play()
	animation_enemy_green.play("death")
	animation_enemy_green.animation_finished

func shot():
	var projectile = PROJECTILE_SCENE.instantiate()
	add_child(projectile)
	projectile.global_transform = enemy.global_transform

func _on_animated_sprite_2d_animation_finished():
	queue_free()
