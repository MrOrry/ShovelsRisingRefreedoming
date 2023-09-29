extends CanvasLayer

func _input(event):
	if event.is_action_pressed("pause"):
		pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	
func _on_Continue_pressed():
	pause()



func _on_LoadoutMenu_pressed():
	pause()
	MusicPlayer.stop()
	SceneManager.change_scene("res://scenes/screens/LoadoutMenu.tscn")
