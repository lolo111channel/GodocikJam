extends Control

@onready var points : GridContainer = $CenterContainer/GridContainer/Panel/CenterContainer/GridContainer/CenterContainer/GridContainer


func show_score(score : int):
	for i in score + 1:
		points.get_children()[i].visible = true
	


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
