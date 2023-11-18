extends GPUParticles2D

@onready var main_menu_camera = $"../MainMenuCamera"

func _process(delta):
	global_position.x = main_menu_camera.global_position.x
