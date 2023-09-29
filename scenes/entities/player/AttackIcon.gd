extends TextureRect

var cooldown = false

onready var CDtexture = preload ("res://assets/ui/UI/AttackCD.png")
onready var ReadyTexture = preload ("res://assets/ui/UI/Attack.png")

func _physics_process(delta):
	if get_parent().get_parent().get_parent().can_attack:
		self.texture = ReadyTexture
	else:
		self.texture = CDtexture


