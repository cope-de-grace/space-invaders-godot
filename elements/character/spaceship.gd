extends CharacterBody2D

const PROJECTILE_SCENE = preload("res://elements/projectile/projectile.tscn")
const SPEED = 300.0

@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		shot()
	
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()

	if direction == 0:
		animation.play("idle")
	if direction > 0:
		animation.play("right")
	if direction < 0:
		animation.play("left")

func shot():
	var projectile = PROJECTILE_SCENE.instantiate()
	projectile.global_position = global_position + Vector2(0,-13) 
	add_child(projectile)

func take_damage():
	Globals.change_lives(-1)

