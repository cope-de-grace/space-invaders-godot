extends Node2D

const  GAME_OVER_SCENE = preload("res://elements/ui/game_over/game_over.tscn")

func _ready():
	Events.lives_changed.connect(func(lives): check_game_over())
	Events.enemy_died.connect(check_game_over)

func check_game_over():
	if Globals.lives <= 0:
		add_child(GAME_OVER_SCENE.instantiate())
		Globals.lives = 3
