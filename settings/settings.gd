extends Control

@onready var mute_volume = $MarginContainer/VBoxContainer/mute_volume
@onready var volume = $MarginContainer/VBoxContainer/volume
@onready var resolution = $MarginContainer/VBoxContainer/resolution
var path_to_save_file := "user://settings.ini"
var selection_name := "game_1"
var config = ConfigFile.new()

func _on_exit_pressed():
	save_game_volume()
	get_tree().change_scene_to_file("res://Menu/menu.tscn")

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value / 5)
	

func _on_mute_volume_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)

		

func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		3:
			DisplayServer.window_set_size(Vector2i(1152, 648))

func _on_fps_limition_item_selected(index):
	match index:
		0:
			Engine.max_fps = 30
		1:
			Engine.max_fps = 60
		2:
			Engine.max_fps = 90
		3:
			Engine.max_fps = 120

func _ready():
	load_game()


func save_game_volume() -> void:
	config.set_value(selection_name, "volume", volume.value)
	config.set_value(selection_name, "resolution", resolution)
	config.save(path_to_save_file)

func load_game() -> void:
	if config.load(path_to_save_file) == OK:
		mute_volume = config.get_value(selection_name, "mute_volume", false)
		volume.value = config.get_value(selection_name, "volume", 0) # Установите значение по умолчанию
		resolution = config.get_value(selection_name, "resolution", 0) # Установите значение по умолчанию

		# Примените загруженные значения

		AudioServer.set_bus_volume_db(0, volume.value / 5)



