extends Node2D

export var BattleTheme = "res://assets/music/BattleTheme.mp3"

func _ready():
	MusicPlayer.play_music(BattleTheme)
	Globlas.score = 0
