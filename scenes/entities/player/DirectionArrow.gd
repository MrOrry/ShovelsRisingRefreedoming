extends Sprite

var radius = 20
onready var spawn_point = $SpawnPoint

func _physics_process(delta):
	look_at(get_global_mouse_position())
	position = get_global_mouse_position().normalized()

func spawn_attack(attack):
	attack.global_position = spawn_point.global_position
	attack.look_at(get_global_mouse_position())
	add_child(attack)

#func player_dash(dash_speed, delta):
#	var velocity = (spawn_point.global_position - get_parent().global_position ) * delta * dash_speed
#	get_parent().move_and_slide(velocity)
