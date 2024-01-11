extends CanvasLayer

@onready var label_points = $PointsLabel

func _on_button_pressed():
	get_tree().reload_current_scene()

@onready var score_label = $MarginContainer2/VBoxContainer/HBoxContainer/Score

func _ready():
	Events.points_changed.connect(update_points)

func update_points(points: int):
	score_label.text = str(points)
