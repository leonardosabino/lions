extends TextureButton

var scene_01 = load("res://scene/01/scene_01.tscn")
var player = load("res://shared/player/jao/player.tscn")

func _ready():
	self.connect("button_down", self, "on_pressed")
	pass

func on_pressed():
	var instance = scene_01.instance()
	instance.add_child(player.instance())
	get_parent().get_parent().add_child(instance)
	get_parent().queue_free()
	pass
