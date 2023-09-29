extends KinematicBody2D

export var HP = 10
export var max_speed = 200
export var acceleration = 5000

export var attack_scene = preload ("res://scenes/entities/enemies/CarpinchoAttack.tscn")
export var can_attack = true
export var attack_range = 100
export var attack_speed = 1.0
export var attack_damage = 10
export var state = "walking"
#export var offset = Vector2(0,0)

onready var animator = $AnimationPlayer
onready var sprite = $Sprite
var direction
var player: Node2D = null
var velocity: Vector2 = Vector2.ZERO

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]  # Assuming there's only one player in the "Player" group

func _process(delta):
	match state:
		"walking":
			chase_player(delta)
		"attacking":
			attacking()
		"staggered":
			stagger()

func chase_player(delta):
	if player != null:
		direction = (player.global_position - global_position)
		direction = direction.normalized()
		velocity = direction * acceleration * delta
		velocity.limit_length(max_speed)
		
		# Check if the player is not within attack range
		if global_position.distance_to(player.global_position) >= attack_range:
			
#			Animate & change facing
			animator.play("Walk")
			if velocity.x < 0:
				sprite.flip_h = true
			else:
				sprite.flip_h = false
			move_and_slide(velocity)
			
			# Enemy in range, transition to attack
		else:
			velocity = Vector2.ZERO
			animator.stop()
			state = "attacking"
	else:
		velocity = Vector2.ZERO

func attacking():
	velocity = Vector2.ZERO
	animator.play("Attack")

func stagger():
	pass

func take_damage(damage):
	HP -= damage
	if HP <= 0:
		self.queue_free()

func make_attack_hitbox():
	var attack = attack_scene.instance()
	attack.global_position = global_position + direction * attack_range
	add_child(attack)
