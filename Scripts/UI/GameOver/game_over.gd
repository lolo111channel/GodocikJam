extends Control




func _on_reset_pressed():
	get_tree().get_first_node_in_group("Player").reset()

func _on_reset_2_pressed():
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
