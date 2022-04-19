extends Node2D


func _input(event):
	if event.is_action_pressed("interact"):		
		var new_dialog = Dialogic.start('Scene01-first') 
		add_child(new_dialog)
