extends Control

export var MenuTheme = "res://assets/music/MainMenuTheme.mp3"

func _ready():
	MusicPlayer.play_music(MenuTheme)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonStart_pressed():
	SceneManager.change_scene("res://scenes/screens/LoadoutMenu.tscn")


func _on_ButtonCredits_pressed():
	SceneManager.change_scene("res://scenes/screens/Credits.tscn")
