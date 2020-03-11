extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 500
const GRAVITY = 2
const UP = Vector2(0,-1)
const JUMP_SPEED = 8

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	move_and_slide(motion*SPEED, UP)

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED 
	
func move():
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")

func apply_gravity():
	if !is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0
