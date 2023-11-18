class_name Portal extends Area2D

@export var portal : Portal


func _ready() -> void:
	connect("area_entered",entered)

func entered(area : Area2D) -> void:
	if area.is_in_group("Bullet"):
		area.get_parent().set_deferred("position",portal.get_node("Marker2D").global_position)

