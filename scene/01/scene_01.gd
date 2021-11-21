extends Node2D


func _input(event):
	if event.is_action_pressed("interact"):
		var player = get_tree().get_root().find_node('player_identity', true, false)
		var dialogue_player = get_node_or_null("dialog")
		if player.playerName == "leo":
			dialogue_player.play("res://shared/dialog/json/dialog-leo.json")
		if player.playerName == "joao":
			dialogue_player.play("res://shared/dialog/json/dialog-joao.json")
		if player.playerName == "natalia":
			dialogue_player.play("res://shared/dialog/json/dialog-naty.json")
