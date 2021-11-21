extends KinematicBody2D

var motion = Vector2()
const SPEED = 250
var active = true

func _physics_process(_delta):
	_move_player()
pass

func _move_player():
	if (active):
		var x = 0
		var y = 0
		
		if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
			$player_identity.play("right")
			y = -1
			x = 1
		elif Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
			$player_identity.play("left")
			y = -1
			x = -1
		elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
			$player_identity.play("left")
			y = 1
			x = -1
		elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
			$player_identity.play("right")
			y = 1
			x = 1
		elif Input.is_action_pressed("ui_left"):
			$player_identity.play("left")
			x = -1
		elif Input.is_action_pressed("ui_right"):
			$player_identity.play("right")
			x = 1
		elif Input.is_action_pressed("ui_down"):
			$player_identity.play("front")
			y = 1
		elif Input.is_action_pressed("ui_up"):
			$player_identity.play("back", true)
			y = -1
		else:
			$player_identity.set_frame(0)
			$player_identity.stop()
			
		motion.x = x * (SPEED)
		motion.y = y * (SPEED)
		move_and_slide(motion)
	else:
		$player_identity.set_frame(0)
		$player_identity.stop()
	
func _set_active(enable):
	active = enable
