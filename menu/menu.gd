extends Node2D

var scene_01 = load("res://scene/01/scene_01.tscn")

func _ready():
	pass 

func _process(_delta):
	if Input.is_action_just_pressed("ui_enter"):
		var game = scene_01.instance()
		get_parent().add_child(game)
		queue_free()
	pass
