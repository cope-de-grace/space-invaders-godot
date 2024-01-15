extends CanvasLayer

func _on_continue_pressed():
	get_tree().paused = false
	visible = false

func _on_exit_pressed():
	get_tree().quit()

func _ready():
	if Input.is_action_just_pressed("ui_cancel"):
		if visible == true:
			get_tree().paused == false
			visible == false
		else:
			get_tree().paused = true
			visible = true
