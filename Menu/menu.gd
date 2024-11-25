extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass





func _on_button_pressed():
	$menu/Button.disabled = true
	$AudioStreamPlayer3.play()
	$AnimationPlayer.play("play")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://levl/levl.tscn")


func _on_button_2_pressed():
	$AudioStreamPlayer3.play()
	await $AudioStreamPlayer3.finished
	$AnimationPlayer.play("quit")
	await $AnimationPlayer.animation_finished
	get_tree().quit()


func _on_option_pressed():
	get_tree().change_scene_to_file("res://settings/settings.tscn")
