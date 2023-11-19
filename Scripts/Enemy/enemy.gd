extends StaticBody2D

var area2D : Area2D

func _process(delta) -> void:
	if is_instance_valid(area2D):
		var distance = global_position.distance_to(area2D.global_position)
		if distance >= 10.0:
			queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Bullet"):
		area2D = area
		
	
