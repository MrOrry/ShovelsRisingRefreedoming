extends Area2D

var damage = 10
export var sprite1 : Texture
export var sprite2 : Texture
export var attack_sound : AudioStream
export var attack_hit : AudioStream

onready var audio = $AudioPlayer
onready var sprite = $Sprite
onready var timer = $Timer
var spritecount = 0

func _ready():
	audio.stream = attack_sound
	audio.play()
	timer.start()
	self.set_as_toplevel(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	spritecount += 1
	match spritecount:
		1:
			sprite.texture = sprite1
		2: 
			sprite.texture = sprite2
		_:
			self.queue_free()
	timer.start()

func _on_NormalSlash_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(damage)
		audio.stream = attack_hit
		audio.play()

