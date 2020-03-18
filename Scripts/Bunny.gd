extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1000
const GRAVITY = 9.8
const UP = Vector2(0,-1)
const JUMP_SPEED = 2.5

func _physics_process(delta):
	apply_gravity(delta)
	jump(delta)
	move(delta)
	animate()
	move_and_slide(motion*SPEED, UP)

func jump(delta):
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
	
func move(delta):
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")

func apply_gravity(delta):
	if !is_on_floor():
		motion.y += GRAVITY*delta
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
