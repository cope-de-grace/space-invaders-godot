extends CharacterBody2D

@onready var animation_ufo := $AnimatedSprite2D

func destroy():
	Globals.change_points(100)
	Events.enemy_died.emit()
	$"../Destroy".play()
	animation_ufo.play("death")
	animation_ufo.animation_finished

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_animated_sprite_2d_animation_finished():
	queue_free()
