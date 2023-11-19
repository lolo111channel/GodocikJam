extends Control

@export var main_menu : Control


func _on_back_pressed():
	main_menu.visible = true
	visible = false
	Sounds.get_node("Click1").play()
