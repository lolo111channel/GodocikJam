extends Control

@export var main_menu : Control



func _on_back_pressed():
	visible = false
	main_menu.visible = true
