extends Node2D

export var enemyPrefab = preload ("res://scenes/entities/enemies/Carpincho.tscn")
export var initialSpawnInterval: float = 10.0  # Initial spawn interval in seconds
export var minSpawnInterval: float = 3.0  # Minimum spawn interval in seconds
export var intervalDecreaseRate: float = 0.2  # Rate at which the spawn interval decreases

onready var timer = $Timer

var spawns = []
var spawnTimer: float = 0.0
var currentSpawnInterval: float = initialSpawnInterval

func _ready():
	spawns = get_spawn_points()
	currentSpawnInterval = initialSpawnInterval
	timer.start(rand_range( minSpawnInterval, currentSpawnInterval ))

func get_spawn_points():
	var spawn_points = []
	for child in get_children():
		if child is Position2D:
			spawn_points.append(child)
	return spawn_points

func spawnEnemy():
	if enemyPrefab != null:
		var enemyInstance = enemyPrefab.instance()
		enemyInstance.set_as_toplevel(true)
		
#		select random spawn position
		enemyInstance.global_position = spawns[rand_range( 0, spawns.size() ) ].global_position
		decreaseSpawnInterval()
		timer.start(rand_range( minSpawnInterval, currentSpawnInterval ))
		add_child(enemyInstance)

func decreaseSpawnInterval():
	if currentSpawnInterval > minSpawnInterval:
		currentSpawnInterval -= intervalDecreaseRate



func _on_Timer_timeout():
	spawnEnemy()
