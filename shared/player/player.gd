extends KinematicBody2D

var motion = Vector2()
const SPEED = 250
var active = true

func _physics_process(_delta):
	_move_player()
pass

func _move_player():
	if (!get_tree().paused && active):
		var x = 0
		var y = 0
		
		if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
			$sprite.play("right")
			y = -1
			x = 1
		elif Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
			$sprite.play("left")
			y = -1
			x = -1
		elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
			$sprite.play("left")
			y = 1
			x = -1
		elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
			$sprite.play("right")
			y = 1
			x = 1
		elif Input.is_action_pressed("ui_left"):
			$sprite.play("left")
			x = -1
		elif Input.is_action_pressed("ui_right"):
			$sprite.play("right")
			x = 1
		elif Input.is_action_pressed("ui_down"):
			$sprite.play("front")
			y = 1
		elif Input.is_action_pressed("ui_up"):
			$sprite.play("back", true)
			y = -1
		else:
			$sprite.set_frame(0)
			$sprite.stop()
			
		motion.x = x * (SPEED)
		motion.y = y * (SPEED)
		move_and_slide(motion)
	else:
		$sprite.set_frame(0)
		$sprite.stop()
	
func _set_active(enable):
	active = enable
