extends CanvasLayer

var path = "res://shared/dialog/json/dialog.json"

var dialogues = []
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false

func play():
	$NinePatchRect.visible = true
	dialogues = load_dialogue()
	
	current_dialogue_id = -1
	next_line()
	
func _input(event):
	if event.is_action_pressed("skip"):
		next_line()
		
func next_line():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogues):
		$NinePatchRect.visible = false
		current_dialogue_id = 0
		return
	
	$NinePatchRect/name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/message.text = dialogues[current_dialogue_id]['text']
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(path):
		file.open(path, file.READ)
		return parse_json(file.get_as_text())
