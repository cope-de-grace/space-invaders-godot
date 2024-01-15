extends CanvasLayer

@onready var points_label = $MarginContainer2/VBoxContainer/HBoxContainer/Points

func _ready():
	Events.points_changed.connect(update_points)

func update_points(points: int):
	points_label.text = str(points)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
