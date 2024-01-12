extends CharacterBody2D

const PROJECTILE_SCENE = preload("res://elements/projectile/projectile.tscn")
const SPEED = 150.0

@onready var animation = $AnimatedSprite2D

var can_shoot = true

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept") && can_shoot:
		shot()
		can_shoot = false
	
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()

func shot():
	var projectile = PROJECTILE_SCENE.instantiate()
	projectile.global_position = global_position + Vector2(0,-13) 
	add_child(projectile)
	$ShotSound.play()
	projectile.tree_exited.connect(on_projectile_destroyed)

func on_projectile_destroyed():
	can_shoot = true

func take_damage():
	Globals.change_lives(-1)
	animation.play("death")
	$ExplosionSound.play()
	$AnimatedSprite2D/Timer.start()

func _on_timer_timeout():
	animation.play("idle")
