extends CanvasLayer

onready var highscore = $Pause/ButtonArray/HBoxContainer/VBoxContainer/Highscore

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	highscore.text = "Score: " + str(Globlas.score)
	visible = new_pause_state

func _on_LoadoutMenu_pressed():
	pause()
	MusicPlayer.stop()
	SceneManager.change_scene("res://scenes/screens/LoadoutMenu.tscn")

func _on_Player_player_death():
	pause()
