extends Node2D

@onready var bullet_spawn : Node2D = $BulletSpawn
@export var bullet_scene : PackedScene

func _physics_process(delta) -> void:
	look_at(get_global_mouse_position())

func _process(delta) -> void:
	
	if Input.is_action_just_pressed("shoot"):
		var bullet : RigidBody2D = bullet_scene.instantiate()
		
		#bullet.rotation_degrees = rotation_degrees
		#bullet.dir = bullet_spawn.global_position.direction_to(get_global_mouse_position())
		
		bullet.global_position = bullet_spawn.global_position
		bullet.linear_velocity = bullet_spawn.global_position.direction_to(get_global_mouse_position()) * 1400
		
		get_parent().add_child(bullet)
		
		
		pass
