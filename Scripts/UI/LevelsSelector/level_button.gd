extends Panel

@export var level_path : String
@export var level_id : int = 0
@export var level_that_will_unlock : int = 1
@export var level_name : String = "Poziom 1"
var score : int = 0
@export var is_unlock : bool = true

func _process(delta) -> void:
	if is_unlock:
		$Grid/LevelName/Label.text = level_name
		
		for i in score:
			$Grid/Center/Grid.get_children()[i].visible = true
		
	else:
		$Grid/LevelName/Label.text = "Lock"
		
		for i in $Grid/Center/Grid.get_children():
			i.visible = false
	
func _on_button_pressed():
	if is_unlock:
		Global.current_level_id = level_id
		Global.current_level_that_will_unlock = level_that_will_unlock
		
		get_tree().change_scene_to_file(level_path)
