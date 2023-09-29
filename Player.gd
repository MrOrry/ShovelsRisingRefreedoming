extends KinematicBody2D

export var max_HP = 100
export var max_speed = 400 
export var acceleration = 2000
export var friction = 2000
export var max_dash_speed = 2000
export var dash_acceleration = 1000
export var gravity = 100
export var max_gravity_speed = 600

var can_attack = true
var can_dash = true
var can_parry = true
var is_dashing = false
var is_attacking = false
var input = Vector2(0,0)
var velocity = Vector2(0,0)

export(PackedScene) var normal_attack_scene
var normal_attack
var HP = 100
var is_on_ground = true
var attack_pos = Vector2(0,0)

onready var normal_attack_cooldown = $NormalAttackCooldown
onready var dash_timer = $DashDuration
onready var dash_cooldown = $DashCooldown
onready var direction_arrow = $DirectionArrow
onready var hitbox = $Hitbox
onready var attack_lock_timer = $AttackLock
onready var life_bar = $Camera2D/UI/Lifebar
onready var animator = $AnimationPlayer
onready var audio = $AudioPlayer2D

func _ready():
	HP = max_HP
	life_bar.update_hp(HP)
	life_bar.update_max_hp(max_HP)

func _physics_process(delta):
	player_movement(delta)
	player_normal_attack()
	player_dash(delta)

func get_movement_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_movement_input()
	
	if input == Vector2(0,0):
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2(0,0)
			if not is_attacking:
				animator.play("Iddle")
	else:
		if is_dashing:
			velocity += (input * acceleration * dash_acceleration * delta)
			velocity = velocity.limit_length(max_dash_speed)

		else:
			velocity += (input * acceleration * delta)
			velocity = velocity.limit_length(max_speed)
			if not is_attacking:
				animator.play("Walk")
	
	if not is_on_ground && not is_dashing:
		velocity += Vector2.DOWN * gravity
		velocity = velocity.limit_length(max_gravity_speed)
	
	if is_attacking:
		velocity = Vector2(0,0)
		
	move_and_slide(velocity)

func player_normal_attack():
	if Input.is_action_pressed("normal_attack") && can_attack:
		normal_attack = normal_attack_scene.instance()
		direction_arrow.spawn_attack(normal_attack)
		animator.play("Attack")
		can_attack = false
		is_attacking = true
		attack_lock_timer.start()
		normal_attack_cooldown.start()

func player_dash(delta):
	if Input.is_action_pressed("dash") && can_dash:
		is_dashing = true
		can_dash = false
		dash_cooldown.start()
		dash_timer.start()

func _on_NormalAttackCooldown_timeout():
	can_attack = true

func _on_DashCooldown_timeout():
	can_dash = true

func _on_DashDuration_timeout():
	is_dashing = false

func _on_GroundDetector_area_entered(area):
	if area.is_in_group("Ground"):
		is_on_ground = true

func _on_GroundDetector_area_exited(area):
	if area.is_in_group("Ground"):
		is_on_ground = false

func _on_AttackCommit_timeout():
	is_attacking = false

func take_damage(damage):
	HP -= damage
	if HP <= 0:
		self.queue_free()
	life_bar.update_hp(HP)
