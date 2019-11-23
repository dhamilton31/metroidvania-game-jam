extends Node2D

export var speed = 100
export var jumpPower = 200
const GRAVITY = 600
var jumping = false
var velocity = Vector2(0, 0)  # The player's movement vector.

func _ready():
	pass # Replace with function body.

func _process(delta):
	var animator = $KinematicBody2D/Sprites/PlayerAnimator
	var jump = Input.is_action_just_pressed("ui_up")
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = speed * -1
	elif !jumping and $KinematicBody2D.is_on_floor():
		velocity.x = 0
		animator.play("Idle")

	if velocity.y > 0:
		animator.play("Character_jumping_up")
	elif velocity.y < 0:
		animator.play("Character_jumping_down")

	elif velocity.x != 0:
		#animator.play("Character_Walking")
		animator.play("Character_Walking")
		$KinematicBody2D/Sprites/SpriteSheet.flip_h = velocity.x < 0

	if jump and $KinematicBody2D.is_on_floor():
		jumping = true
		velocity.y = jumpPower * -1

	if jumping and $KinematicBody2D.is_on_floor():
		jumping = false
	velocity.y += GRAVITY * delta
	velocity = $KinematicBody2D.move_and_slide(velocity, Vector2(0, -1))
