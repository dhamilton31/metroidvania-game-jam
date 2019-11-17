extends Node2D

export var speed = 100
const GRAVITY = 600

func _ready():
	pass # Replace with function body.

func _process(delta):
    var animator = $KinematicBody2D/Sprites/PlayerAnimator
    var velocity = Vector2(0, GRAVITY)  # The player's movement vector.
    if Input.is_action_pressed("ui_right"):
        velocity.x += speed
    if Input.is_action_pressed("ui_left"):
        velocity.x -= speed
    if Input.is_action_pressed("ui_down"):
        pass
    if Input.is_action_pressed("ui_up"):
        pass
    if velocity.x != 0:
        animator.play("Character_Walking")
    else:
        animator.play("Idle")
    velocity = $KinematicBody2D.move_and_slide(velocity)
