extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1000
const GRAVITY = 9.8
const UP = Vector2(0,-1)
const JUMP_SPEED = 2.5

signal animate

func _physics_process(delta):
	apply_gravity(delta)
	jump()
	move()
	animate()
	move_and_slide(motion*SPEED, UP)

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
	
func move():
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")

func apply_gravity(delta):
	if !is_on_floor():
		motion.y += GRAVITY*delta
	else:
		motion.y = 0

func animate():
	emit_signal("animate", motion)
