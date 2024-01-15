extends Node

var menu_music = load("res://music/keygen_slowed_reverb.mp3")

func play_music():
	$MusicMenu.stream = menu_music
	$MusicMenu.play()

func stop_music():
	$MusicMenu.stream = menu_music
	$MusicMenu.stop()
