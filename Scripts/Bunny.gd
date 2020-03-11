extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 500
const GRAVITY = 9.8
const UP = Vector2(0,-1)
const JUMP_SPEED = 500

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
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

func animate():
	$AnimatedSprite.flip_h 
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x > 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	elif motion.x < 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
