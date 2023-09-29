extends TextureRect

var cooldown = false

onready var CDtexture = preload ("res://assets/ui/UI/DashCD.png")
onready var ReadyTexture = preload ("res://assets/ui/UI/Dash.png")

func _physics_process(delta):
	if get_parent().get_parent().get_parent().can_dash:
		self.texture = ReadyTexture
	else:
		self.texture = CDtexture

