extends Control

@export var main_menu : Control


func _ready() -> void:
	
	if Global.levels.size() <= 0:
		var levels = get_tree().get_nodes_in_group("LevelButton")
		if levels.size() > 0:
			for i in levels:
				Global.add_level({
					is_unlock = i.is_unlock,
					score = i.score,
					level_path = i.level_path,
					level_that_will_unlock = i.level_that_will_unlock
				})
	else:
		var levels = get_tree().get_nodes_in_group("LevelButton")
		if levels.size() > 0:
			for i in levels:
				i.is_unlock = Global.levels[i.level_id].is_unlock
				i.score = Global.levels[i.level_id].score


func _process(delta):
	if Global.b:
		visible = true
		main_menu.visible = false
		
		Global.b = false




func _on_back_pressed():
	visible = false
	main_menu.visible = true
	
	Sounds.get_node("Click1").play()
