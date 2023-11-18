extends Line2D

@export var object : Node2D
var color : Color = Color(0,0,0)

func _ready() -> void:
	default_color = color
	


func _process(delta) -> void:
	if is_instance_valid(object):
		add_point(object.global_position)
	else:
		default_color = Color(color.r, color.g, color.b, 0.1)
