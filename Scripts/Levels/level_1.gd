extends Node2D


func _ready():
	if !Global.start:
		get_tree().change_scene_to_file("res://Scripts/start_cutscene.tscn")
