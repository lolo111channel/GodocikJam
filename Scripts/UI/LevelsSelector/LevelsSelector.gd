extends Control

@export var main_menu : Control


func _ready() -> void:
	
	if Global.levels.size() <= 0:
		var levels = get_tree().get_nodes_in_group("LevelButton")
		if levels.size() > 0:
			for i in levels:
				Global.add_level({
					is_unlock = i.is_unlock,
					score = i.score
				})
	else:
		var levels = get_tree().get_nodes_in_group("LevelButton")
		if levels.size() > 0:
			for i in levels:
				print(i.level_id)
				i.is_unlock = Global.levels[i.level_id].is_unlock
				i.score = Global.levels[i.level_id].score

func _on_back_pressed():
	visible = false
	main_menu.visible = true
