extends Node

var current_level_id : int = -1
var current_level_that_will_unlock : int = -1
var levels : Array[Dictionary] = [

]

var music_volume : float = 0.5
var sound_volume : float = 0.5
var is_fullscreen_on : bool = false

var start : bool = false
var end : bool = false

var b : bool = false

func add_level(x : Dictionary) -> void:
	levels.append(x)

func finish(score : int) -> void:
	
	if levels[current_level_id].score < score:
		levels[current_level_id].score = score
	
	if current_level_that_will_unlock != -1:
		levels[current_level_that_will_unlock].is_unlock = true
		levels[current_level_that_will_unlock].score = 0
	
	
	current_level_id = - 1
	current_level_that_will_unlock = -1

func OpenLevelSelector() -> void:
	b =  true
