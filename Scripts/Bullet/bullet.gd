extends RigidBody2D

@export var pos : Vector2
var current_velocity : Vector2


func _ready() -> void:
	$Sprite2D.play("default")
	
	current_velocity = linear_velocity

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		global_position = pos

func action(wall_name : String) -> void:
	match wall_name:
		"Enemy":
			pass
		"BounceWall":
			Sounds.get_node("MirrorHit").play()
		_:
			queue_free()
	


func _on_area_2d_body_entered(body) -> void:
	for i in body.get_groups():
		action(i)
