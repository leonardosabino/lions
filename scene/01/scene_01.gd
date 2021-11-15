extends Node2D

func _input(event):
	if event.is_action_pressed("interact"):
		var dialogue_player = get_node_or_null("dialog")
		dialogue_player.play("res://shared/dialog/json/dialog.json") #TODO: importar json de forma estática
