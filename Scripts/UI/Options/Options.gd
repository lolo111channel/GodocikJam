extends Control

@export var main_menu : Control



@onready var music_slider : HSlider = $GridContainer/Options/Grid/MusicVolumeSlider/CenterContainer/GridContainer/Music
@onready var music_text : Label = $GridContainer/Options/Grid/MusicVolumeSlider/CenterContainer/GridContainer/Label

@onready var sound_slider : HSlider = $GridContainer/Options/Grid/SoundVolumeSlider/CenterContainer/GridContainer/Sounds
@onready var sound_text : Label = $GridContainer/Options/Grid/SoundVolumeSlider/CenterContainer/GridContainer/Label

@onready var button : Button = $GridContainer/Options/Grid/CenterContainer/Button


func _ready() -> void:
	sound_slider.value = Global.sound_volume * 100
	music_slider.value = Global.music_volume * 100
	
	if Global.is_fullscreen_on:
		button.text = "ON"
	elif !Global.is_fullscreen_on:
		button.text = "OFF"
	
	apply()

func _process(delta) -> void:
	music_text.text = "%s" % [music_slider.value]
	sound_text.text = "%s" % [sound_slider.value]


func _on_back_pressed():
	main_menu.visible = true
	visible = false
	apply()



	
func apply():
	Global.music_volume = music_slider.value / 100
	Global.sound_volume = sound_slider.value / 100
	
	var bus_index1 = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(
		bus_index1,
		linear_to_db(Global.music_volume)
	)
	
	var bus_index2 = AudioServer.get_bus_index("Sounds")
	AudioServer.set_bus_volume_db(
		bus_index2,
		linear_to_db(Global.sound_volume)
	)
	
	if Global.is_fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		


func _on_button_pressed():
	if Global.is_fullscreen_on:
		button.text = "OFF"
		Global.is_fullscreen_on = false
	elif !Global.is_fullscreen_on:
		button.text = "ON"
		Global.is_fullscreen_on = true
		
	
		
