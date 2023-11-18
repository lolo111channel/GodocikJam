extends Node2D

@onready var bullet_spawn : Node2D = $BulletSpawn
@export var bullet_scene : PackedScene

var ammo : int = 3

var colors : Array[Color] = [
	Color(1, 0, 0, 0.39215686917305),
	Color(0, 1, 0, 0.39215686917305),
	Color(0, 0, 1, 0.39215686917305)
]

func _physics_process(delta) -> void:
	if ammo > 0:
		look_at(get_global_mouse_position())

func _process(delta) -> void:
	
	if ammo <= 0:
		game_over()
	
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("shoot") and ammo > 0:
		var bullet : RigidBody2D = bullet_scene.instantiate()


		bullet.global_position = bullet_spawn.global_position
		bullet.linear_velocity = bullet_spawn.global_position.direction_to(get_global_mouse_position()) * 1400
		
		get_parent().add_child(bullet)
		remove_ammo()
		add_line_2d(bullet)

func remove_ammo() -> void:
	ammo -= 1
	
	
	var ammo_grid : GridContainer = $CanvasLayer/Ammo
	if ammo_grid.get_child_count() > 0:
		ammo_grid.get_children()[ammo_grid.get_child_count()-1].queue_free()

func game_over() -> void:
	if get_tree().get_nodes_in_group("Bullet").size() <= 0:
		if get_tree().get_nodes_in_group("Enemy").size() > 0:
			get_tree().get_nodes_in_group("UI")[0].get_node("GameOver").visible = true


func add_line_2d(object : Node2D) -> void:
	var bullet_path_scene : PackedScene = load("res://Scripts/line_2d.tscn")
	var bullet_path : Line2D = bullet_path_scene.instantiate()
	
	bullet_path.object = object
	bullet_path.color = colors[ammo-1]
	
	get_parent().add_child(bullet_path)
	

