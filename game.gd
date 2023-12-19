extends Node2D

const  GAME_OVER_SCENE = preload("res://elements/ui/game_over/game_over.tscn")
const LEVEL_COMPLETE_SCENE = preload("res://elements/ui/level_complete/level_complete.tscn")

func _ready():
	Events.lives_changed.connect(func(lives): check_game_over())
	Events.enemy_died.connect(check_level_complete)

func check_game_over():
	if Globals.lives <= 0:
		add_child(GAME_OVER_SCENE.instantiate())
		Globals.lives = 3
		$Level1Music.stop()
		$FailSound.play()

func check_level_complete():
	var enemies = get_tree().get_nodes_in_group("enemy_green")
	if enemies.size() <= 1:
		add_child(LEVEL_COMPLETE_SCENE.instantiate())
		$Level1Music.stop()
