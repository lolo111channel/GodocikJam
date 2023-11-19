extends Node2D

@onready var bullet_spawn : Node2D = $Point/BulletSpawn
@export var bullet_scene : PackedScene

var ammo : int = 3

var colors : Array[Color] = [
	Color(1, 0, 0, 0.39215686917305),
	Color(0, 1, 0, 0.39215686917305),
	Color(0, 0, 1, 0.39215686917305)
]

var is_win : bool = false

var is_start_shooting : bool = false
var a : bool = false
var b : bool = false

var current_pos : Vector2

var level_id : int = -1
var next_level_id : int = -1

func _ready() -> void:
	$Sprite2D.play("default")
	
	level_id = Global.current_level_id
	next_level_id = Global.current_level_that_will_unlock
	
	$AnimationPlayer.play("orbAnimation")
	
func _process(delta) -> void:
	
	win()
	
	if Input.is_action_just_pressed("reset"):
		Global.current_level_id = level_id
		Global.current_level_that_will_unlock = next_level_id
		
		get_tree().reload_current_scene()
		
		
	if !is_win:
		if ammo <= 0:
			game_over()
		
		
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
		
	if Input.is_action_just_pressed("shoot") and ammo > 0 and !is_win and !is_start_shooting:
		$Sprite2D.play("attack")
		is_start_shooting = true
			
		current_pos = get_global_mouse_position()
			

	if is_start_shooting and $Sprite2D.frame == 5 and !a:
		var bullet : RigidBody2D = bullet_scene.instantiate()
		bullet.global_position = bullet_spawn.global_position
		bullet.linear_velocity = bullet_spawn.global_position.direction_to(current_pos) * 1400
			
		get_parent().add_child(bullet)
		remove_ammo()
		add_line_2d(bullet)
			
		a = true
			
	if $Sprite2D.frame >= 9 and is_start_shooting:
		is_start_shooting = false
			
		if ammo == 3:
			$Sprite2D.play("default")
		elif ammo == 2:
			$Sprite2D.play("default2")
		elif ammo == 1:
			$Sprite2D.play("default3")
		elif ammo == 0:
			$Sprite2D.play("default4")
				
		a = false
			

func remove_ammo() -> void:
	ammo -= 1
	
	
	var ammo_grid : GridContainer = $CanvasLayer/Ammo
	if ammo_grid.get_child_count() > 0:
		ammo_grid.get_children()[ammo_grid.get_child_count()-1].queue_free()

func game_over() -> void:
	if get_tree().get_nodes_in_group("Bullet").size() <= 0 and !b:
		if get_tree().get_nodes_in_group("Enemy").size() > 0:
			get_tree().get_nodes_in_group("UI")[0].get_node("GameOver").visible = true
			
			$Sprite2D.play("death")
			b = true
	
	if b:
		if $Sprite2D.frame >= 5:
			$Sprite2D.pause()
	
	
func win() -> void:
	if !is_win:
		if get_tree().get_nodes_in_group("Enemy").size() <= 0:
			var winning_panel = get_tree().get_first_node_in_group("UI").get_node("Win")
			is_win = true
			
			winning_panel.visible = true
			winning_panel.show_score(ammo+1)
			
			winning_panel.next_level_id = Global.current_level_that_will_unlock
			Global.finish(ammo+1)
			
			
			
		
func add_line_2d(object : Node2D) -> void:
	var bullet_path_scene : PackedScene = load("res://Scripts/line_2d.tscn")
	var bullet_path : Line2D = bullet_path_scene.instantiate()
	
	bullet_path.object = object
	bullet_path.color = colors[ammo-1]
	
	get_parent().add_child(bullet_path)
	

