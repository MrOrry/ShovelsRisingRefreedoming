extends TextureProgress


var min_value_offset = -30
var max_value_offset = 7 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_hp(HP):
	value = HP

func update_max_hp(max_HP):
	max_value = max_HP + max_value_offset
