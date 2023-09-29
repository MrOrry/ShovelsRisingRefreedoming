extends Node2D

onready var body = $Body
onready var arm = $Arm
onready var sword = $Sword
onready var head = $Head
# Called when the node enters the scene tree for the first time.
func _ready():
	sword.modulate = Globlas.swordColor
	arm.modulate = Globlas.armColor
	body.modulate = Globlas.bodyColor
	head.modulate = Globlas.headColor

