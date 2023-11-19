extends Control

@export var levels_selector : Control
@export var options : Control
@export var credits : Control

func _on_play_pressed():
	levels_selector.visible = true
	visible = false
	
	Sounds.get_node("Click1").play()


func _on_options_pressed():
	options.visible = true
	visible = false
	
	options._ready()
	
	Sounds.get_node("Click1").play()


func _on_credits_pressed():
	credits.visible= true
	visible = false
	
	Sounds.get_node("Click1").play()


func _on_quit_pressed():
	get_tree().quit()
	
	Sounds.get_node("Click1").play()
