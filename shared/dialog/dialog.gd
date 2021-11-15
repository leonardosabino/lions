extends CanvasLayer

var dialogues = []
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false

func play(json):
	var player = get_tree().get_root().find_node('player', true, false)
	player._set_active(false)
	$NinePatchRect.visible = true
	dialogues = load_dialogue(json)
	
	current_dialogue_id = -1
	next_line()
	
func _input(event):
	if event.is_action_pressed("skip"):
		next_line()
		
func next_line():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogues):
		var player = get_tree().get_root().find_node('player', true, false)
		player._set_active(true)
		$NinePatchRect.visible = false
		current_dialogue_id = 0
		return
	
	$NinePatchRect/name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/message.text = dialogues[current_dialogue_id]['text']
	
func load_dialogue(json):
	var file = File.new()
	if file.file_exists(json):
		file.open(json, file.READ)
		return parse_json(file.get_as_text())
