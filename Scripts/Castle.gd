extends Sprite2D

@export var movement_speed : float = 300.0

@export var x : float = -3144
@export var y : float = 6918

func _physics_process(delta):
	position.x -= movement_speed * delta
	
	if position.x <= x:
		position.x = y
