extends Area2D

var damage = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_as_toplevel(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()


func _on_NormalSlash_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(damage)

