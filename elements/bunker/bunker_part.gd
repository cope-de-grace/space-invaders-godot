extends Area2D

@export var sprite: Sprite2D
@export var texture_array: Array[Texture2D]

var damage = 0
const MAX_DAMAGE = 3

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Projectile || body is EnemyProjectile:
		body.queue_free()
		if damage < MAX_DAMAGE:
			damage += 1
			sprite.texture = texture_array[damage - 1]
		else:
			queue_free()


