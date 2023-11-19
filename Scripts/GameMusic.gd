extends Node

var is_music_on : bool = false

func _process(delta) -> void:
	
	if get_tree().get_nodes_in_group("Player").size() > 0 and !is_music_on:
		$AudioStreamPlayer.play()
		is_music_on = true
	elif get_tree().get_nodes_in_group("Player").size() <= 0:
		$AudioStreamPlayer.stop()
		is_music_on = false
