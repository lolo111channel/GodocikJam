extends Control

@onready var points : GridContainer = $CenterContainer/GridContainer/Panel/CenterContainer/GridContainer/CenterContainer/GridContainer
var next_level_id : int = -1

func show_score(score : int):
	for i in score:
		points.get_children()[i].visible = true
	


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")


func _on_next_level_pressed():
	if next_level_id != -1:
		Global.current_level_id = next_level_id
		Global.current_level_that_will_unlock = Global.levels[next_level_id].level_that_will_unlock
		get_tree().change_scene_to_file(Global.levels[next_level_id].level_path)
	else:
		get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
