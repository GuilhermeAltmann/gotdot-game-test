extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MOTION_SPEED = 160 * 2

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	
	var motion = Vector2()
	var moved = false
	
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		moved = true
		
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		moved = true
		
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		get_node("player").set_flip_h(true)
		moved = true
		
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		get_node("player").set_flip_h(false)
		moved = true
	
	motion = motion.normalized() * MOTION_SPEED
	
	move_and_slide(motion)
	
	if(moved):
		get_node("player").play("walking")
		
	else:
		get_node("player").play("stoped")
		
