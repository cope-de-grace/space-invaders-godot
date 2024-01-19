extends Node2D

const  GAME_OVER_SCENE = preload("res://elements/ui/game_over/game_over.tscn")
@onready var level_complete = $LevelComplete
@onready var hud = $HUD
var ufo = load("res://elements/ufo/ufo.tscn")

func _ready():
	Events.lives_changed.connect(func(lives): check_game_over())
	Events.enemy_died.connect(check_level_complete)
	MusicMenu.stop_music()

func check_game_over():
	if Globals.lives <= 0:
		add_child(GAME_OVER_SCENE.instantiate())
		Globals.lives = 3
		$Level1Music.stop()
		$FailSound.play()

func check_level_complete():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() <= 1:
		level_complete.show()
		hud.hide()
		$Level1Music.stop()
		$LevelCompleteSound.play()

func _on_spawn_ufo_timer_timeout():
	var spawn_ufo = ufo.instantiate()
	spawn_ufo.position = Vector2 (0, 35)
	add_child(spawn_ufo)
	$UfoSound.play()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
