extends RigidBody2D



func action(wall_name : String) -> void:
	match wall_name:
		"BounceWall":
			pass
		_:
			queue_free()
	


func _on_area_2d_body_entered(body) -> void:
	for i in body.get_groups():
		action(i)
