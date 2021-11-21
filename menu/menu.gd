extends Node2D

var selectPlayer = load("res://menu/selectPlayer/select_player.tscn")

func _ready():
	pass 

func _input(event):
	if event.is_action_pressed("ui_enter"):
		var game = selectPlayer.instance()
		get_parent().add_child(game)
		queue_free()
	pass
