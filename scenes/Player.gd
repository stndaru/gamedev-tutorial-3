extends KinematicBody2D

export (int) var speed = 400
export (int) var GRAVITY = 1200
export (int) var jump_speed = -600

const UP = Vector2(0,-1)

var velocity = Vector2()
var double_jump = false
var dash = true
var base_size = Vector2.ZERO
var base_scale = Vector2.ZERO

func _ready():
	base_size = $CollisionShape2D.get_shape().get_extents()
	base_scale = $Sprite.get_scale()

func get_input():
	velocity.x = 0
	if is_on_floor():
		double_jump = true
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
	if !is_on_floor() and Input.is_action_just_pressed('ui_up') and double_jump:
		velocity.y = jump_speed
		double_jump = false
		
	if Input.is_action_pressed('ui_down'):
		$CollisionShape2D.get_shape().set_extents(
				Vector2(base_size.x, base_size.y/2))
		$Sprite.set_scale(
				Vector2(base_scale.x, base_scale.y/2))
		speed = 200
	else:
		$CollisionShape2D.get_shape().set_extents(
				Vector2(base_size.x, base_size.y))
		$Sprite.set_scale(
				Vector2(base_scale.x, base_scale.y))
		speed = 400
		
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
		
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
