extends TextureRect

onready var animator = $AnimationPlayer

func _ready():
	animator.play("FadeIn")

func move_to_mainmenu():
	SceneManager.change_scene("res://scenes/screens/MainMenu.tscn")
