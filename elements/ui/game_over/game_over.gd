extends CanvasLayer

@onready var label_points = $PointsLabel

func _on_button_pressed():
	get_tree().reload_current_scene()

func _ready():
	Events.points_changed.connect(update_points)

func update_points(points: int):
	label_points.text = str(points)
