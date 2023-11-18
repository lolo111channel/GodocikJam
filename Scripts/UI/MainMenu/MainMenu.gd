extends Control

@export var levels_selector : Control

func _on_play_pressed():
	levels_selector.visible = true
	visible = false


func _on_options_pressed():
	print("options")


func _on_credits_pressed():
	print("credits")


func _on_quit_pressed():
	get_tree().quit()
