extends Node2D


export var SwordColors = ["ff0000", "0028ff", "fdff00", "00ff10"]
export var HeadColors = ["41574d", "ff0000", "aabd4e", "0070ff"]
export var ArmColors = ["473d43", "ff0000", "006aff", "fdff00"]
export var BodyColors = ["bdb89b", "ff0000", "006aff", "f7ff00"]
# Called when the node enters the scene tree for the first time.

onready var SwordButton = $SwordChanger
onready var ArmButton = $ArmChanger
onready var HeadButton = $HeadChanger
onready var BodyButton = $BodyChanger

onready var PlayerSprite = $Sprite

var currentSwordColor = 0
var currentHeadColor = 0
var currentArmColor = 0
var currentBodyColor = 0

export var MenuTheme = "res://assets/music/MainMenuTheme.mp3"

func _ready():
	MusicPlayer.play_music(MenuTheme)


func _on_ButtonBack_pressed():
	SceneManager.change_scene("res://scenes/screens/MainMenu.tscn")
func _on_ButtonBegin_pressed():
	SceneManager.change_scene("res://scenes/screens/Gameplay.tscn")

func _on_BodyChanger_pressed():
	currentBodyColor += 1
	if currentBodyColor == BodyColors.size():
		currentBodyColor = 0
	BodyButton.modulate = Color(BodyColors[currentBodyColor])
	if currentBodyColor == 0:
		 Globlas.bodyColor = "ffffff"
	else:
		Globlas.bodyColor = Color(BodyColors[currentBodyColor])
	PlayerSprite._ready()

func _on_HeadChanger_pressed():
	currentHeadColor += 1
	if currentHeadColor == HeadColors.size():
		currentHeadColor = 0
	HeadButton.modulate = Color(HeadColors[currentHeadColor])
	if currentHeadColor == 0:
		 Globlas.headColor = "ffffff"
	else:
		Globlas.headColor = Color(HeadColors[currentHeadColor])
	PlayerSprite._ready()

func _on_ArmChanger_pressed():
	currentArmColor += 1
	if currentArmColor == ArmColors.size():
		currentArmColor = 0
	ArmButton.modulate = Color(ArmColors[currentArmColor])
	if currentArmColor == 0:
		 Globlas.armColor = "ffffff"
	else:
		Globlas.armColor = Color(ArmColors[currentArmColor])
	PlayerSprite._ready()

func _on_SwordChanger_pressed():
	currentSwordColor += 1
	if currentSwordColor == SwordColors.size():
		currentSwordColor = 0
	SwordButton.modulate = Color(SwordColors[currentSwordColor])
	if currentSwordColor == 0:
		 Globlas.swordColor = "ffffff"
	else:
		Globlas.swordColor = Color(SwordColors[currentSwordColor])
	PlayerSprite._ready()
