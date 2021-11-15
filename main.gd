extends Node2D

var pauseScene = load("res://shared/pause/pause.tscn")

func _input(event):
	if !get_node("/root/main/").has_node("menu") && event.is_action_pressed("ui_cancel"):
		_pause_menu()

func _pause_menu():
	if (!get_node("/root/main/").has_node("pause")): 
		get_node("/root/main/").add_child(pauseScene.instance())
	pass
