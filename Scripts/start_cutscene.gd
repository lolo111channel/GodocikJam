extends Node2D


func _ready() -> void:
	Global.current_level_id = 0
	Global.current_level_that_will_unlock = 1
	
	$AnimatedSprite2D.play("default")
	
func _process(delta):
	if $AnimatedSprite2D.frame >= 60:
		Global.finish(3)
		Global.OpenLevelSelector()
		
		get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
		
		
