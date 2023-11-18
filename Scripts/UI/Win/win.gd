extends Control

@onready var points : GridContainer = $CenterContainer/GridContainer/Panel/CenterContainer/GridContainer/CenterContainer/GridContainer

func show_score(score : int):
	for i in score + 1:
		points.get_children()[i].visible = true
	
